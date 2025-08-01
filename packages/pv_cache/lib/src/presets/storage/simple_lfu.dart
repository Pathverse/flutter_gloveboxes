import 'package:pv_cache/src/core/config.dart';

class SimpleLFU extends PVCacheEnvConfig {
  final int maxSize;
  final Map<String, int> accessCounts = {};
  final Map<String, DateTime> accessTimes = {};
  bool _initialized = false;

  // Special internal keys for tracking
  static const String _accessCountsKey = '__access_counts__';
  static const String _accessTimesKey = '__access_times__';

  SimpleLFU({
    super.defaultGet = true,
    super.defaultSet = true,
    super.defaultDelete = true,
    required this.maxSize,
  }) : super(storageType: PVCacheStorageType(name: "simple_lfu"));

  /// Initialize tracking maps from persistent storage
  Future<void> _initializeTracking() async {
    if (_initialized) return;

    try {
      // Load access counts from metadata
      final accessCountsData = await getMeta(_accessCountsKey);
      if (accessCountsData != null) {
        accessCounts.clear();
        for (final entry in accessCountsData.entries) {
          final count = int.tryParse(entry.value.toString());
          if (count != null) {
            accessCounts[entry.key] = count;
          }
        }
      }

      // Load access times from metadata
      final accessTimesData = await getMeta(_accessTimesKey);
      if (accessTimesData != null) {
        accessTimes.clear();
        for (final entry in accessTimesData.entries) {
          final timeStr = entry.value.toString();
          final time = DateTime.tryParse(timeStr);
          if (time != null) {
            accessTimes[entry.key] = time;
          }
        }
      }
    } catch (e) {
      // If loading fails, start with empty tracking
      accessCounts.clear();
      accessTimes.clear();
    }

    _initialized = true;
  }

  /// Save tracking maps to persistent storage
  Future<void> _saveTracking() async {
    // Convert int counts to strings for storage
    final accessCountsData = <String, String>{};
    for (final entry in accessCounts.entries) {
      accessCountsData[entry.key] = entry.value.toString();
    }

    // Convert DateTime objects to ISO strings for storage
    final accessTimesData = <String, String>{};
    for (final entry in accessTimes.entries) {
      accessTimesData[entry.key] = entry.value.toIso8601String();
    }

    // Save to metadata using special keys
    await setMeta(_accessCountsKey, accessCountsData);
    await setMeta(_accessTimesKey, accessTimesData);
  }

  @override
  Future<bool> isValid(String key) async {
    // LFU items are always valid unless manually invalidated
    return true;
  }

  @override
  Future<void> invalidCleanup(String key) async {
    await rawDelete(key);
    accessCounts.remove(key);
    accessTimes.remove(key);
    await _saveTracking();
  }

  @override
  Future<dynamic> preGet(String key, dynamic originalValue) async {
    await _initializeTracking();

    if (defaultGet) {
      // Update access count and time for LFU tracking
      accessCounts[key] = (accessCounts[key] ?? 0) + 1;
      accessTimes[key] = DateTime.now();

      // Store updated metadata
      final meta = {
        'accessCount': accessCounts[key]!,
        'accessTime': accessTimes[key]!.toIso8601String(),
        'lastAccessed': DateTime.now().toIso8601String(),
      };
      await setMeta(key, meta);
      await _saveTracking();

      return originalValue;
    } else {
      // Custom logic - handle everything ourselves
      final meta = await getMeta(key);
      if (meta == null) return null;

      // Update access tracking
      accessCounts[key] = (accessCounts[key] ?? 0) + 1;
      accessTimes[key] = DateTime.now();

      // Store updated metadata
      final updatedMeta = {
        'accessCount': accessCounts[key]!,
        'accessTime': accessTimes[key]!.toIso8601String(),
        'lastAccessed': DateTime.now().toIso8601String(),
      };
      await setMeta(key, updatedMeta);
      await _saveTracking();

      // Custom retrieval logic here
      return originalValue;
    }
  }

  @override
  Future<dynamic> preSet(
    String key,
    dynamic value,
    Map<String, dynamic>? metadata,
  ) async {
    await _initializeTracking();

    if (defaultSet) {
      // Check if we need to evict items due to size limit
      await _evictIfNeeded();

      // Initialize access tracking
      accessCounts[key] = 1;
      accessTimes[key] = DateTime.now();

      // Store metadata with LFU information
      final meta = {
        'accessCount': accessCounts[key]!,
        'accessTime': accessTimes[key]!.toIso8601String(),
        'created': DateTime.now().toIso8601String(),
        ...?metadata,
      };
      await setMeta(key, meta);
      await _saveTracking();

      return value;
    } else {
      // Custom logic - handle everything ourselves
      await _evictIfNeeded();

      accessCounts[key] = 1;
      accessTimes[key] = DateTime.now();

      final meta = {
        'accessCount': accessCounts[key]!,
        'accessTime': accessTimes[key]!.toIso8601String(),
        'created': DateTime.now().toIso8601String(),
        ...?metadata,
      };
      await setMeta(key, meta);
      await _saveTracking();

      // Custom processing logic here
      return value;
    }
  }

  @override
  Future<void> preDelete(String key) async {
    await _initializeTracking();

    if (defaultDelete) {
      await deleteMeta(key);
      accessCounts.remove(key);
      accessTimes.remove(key);
      await _saveTracking();
    } else {
      // Custom logic - handle everything ourselves
      await deleteMeta(key);
      accessCounts.remove(key);
      accessTimes.remove(key);
      await _saveTracking();

      // Custom deletion logic here
    }
  }

  @override
  Future<void> postGet(String key, dynamic value) async {
    // No additional post-processing needed
  }

  @override
  Future<void> postSet(String key, dynamic value) async {
    // No additional post-processing needed
  }

  @override
  Future<void> postDelete(String key) async {
    // No additional post-processing needed
  }

  /// Evict least frequently used items if cache size exceeds maxSize
  Future<void> _evictIfNeeded() async {
    if (accessCounts.length < maxSize) return;

    // Sort by access count (lowest first), then by access time (oldest first) for tie-breaking
    final sortedKeys = accessCounts.keys.toList()
      ..sort((a, b) {
        final countA = accessCounts[a]!;
        final countB = accessCounts[b]!;

        if (countA != countB) {
          return countA.compareTo(countB); // Sort by frequency first
        }

        // If frequencies are equal, sort by access time (oldest first)
        final timeA = accessTimes[a]!;
        final timeB = accessTimes[b]!;
        return timeA.compareTo(timeB);
      });

    // Evict least frequently used items until we're under the limit
    final itemsToEvict = sortedKeys.take(accessCounts.length - maxSize + 1);

    for (final key in itemsToEvict) {
      // Delete both metadata AND the actual cached value
      await rawDelete(key);
      accessCounts.remove(key);
      accessTimes.remove(key);
    }
    await _saveTracking();
  }

  /// Get cache statistics
  Map<String, dynamic> getStats() {
    if (accessCounts.isEmpty) {
      return {
        'currentSize': 0,
        'maxSize': maxSize,
        'averageAccessCount': 0,
        'minAccessCount': 0,
        'maxAccessCount': 0,
      };
    }

    final counts = accessCounts.values.toList();
    final averageCount = counts.reduce((a, b) => a + b) / counts.length;
    final minCount = counts.reduce((a, b) => a < b ? a : b);
    final maxCount = counts.reduce((a, b) => a > b ? a : b);

    return {
      'currentSize': accessCounts.length,
      'maxSize': maxSize,
      'averageAccessCount': averageCount,
      'minAccessCount': minCount,
      'maxAccessCount': maxCount,
      'oldestAccess': accessTimes.isNotEmpty
          ? accessTimes.values
              .reduce((a, b) => a.isBefore(b) ? a : b)
              .toIso8601String()
          : null,
      'newestAccess': accessTimes.isNotEmpty
          ? accessTimes.values
              .reduce((a, b) => a.isAfter(b) ? a : b)
              .toIso8601String()
          : null,
    };
  }

  /// Get items sorted by frequency (most frequently used first)
  List<MapEntry<String, int>> getItemsByFrequency() {
    final entries = accessCounts.entries.toList();
    entries.sort((a, b) => b.value.compareTo(a.value)); // Sort descending
    return entries;
  }
}
