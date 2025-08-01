import 'package:pv_cache/src/core/config.dart';

class SimpleLRU extends PVCacheEnvConfig {
  final int maxSize;
  final Map<String, DateTime> accessTimes = {};
  final Map<String, int> accessCounts = {};
  bool _initialized = false;

  // Special internal keys for tracking
  static const String _accessTimesKey = '__access_times__';
  static const String _accessCountsKey = '__access_counts__';

  SimpleLRU({
    super.defaultGet = true,
    super.defaultSet = true,
    super.defaultDelete = true,
    required this.maxSize,
  }) : super();

  /// Initialize tracking maps from persistent storage
  Future<void> _initializeTracking() async {
    if (_initialized) return;

    try {
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
    } catch (e) {
      // If loading fails, start with empty tracking
      accessTimes.clear();
      accessCounts.clear();
    }

    _initialized = true;
  }

  /// Save tracking maps to persistent storage
  Future<void> _saveTracking() async {
    // Convert DateTime objects to ISO strings for storage
    final accessTimesData = <String, String>{};
    for (final entry in accessTimes.entries) {
      accessTimesData[entry.key] = entry.value.toIso8601String();
    }

    // Convert int counts to strings for storage
    final accessCountsData = <String, String>{};
    for (final entry in accessCounts.entries) {
      accessCountsData[entry.key] = entry.value.toString();
    }

    // Save to metadata using special keys
    await setMeta(_accessTimesKey, accessTimesData);
    await setMeta(_accessCountsKey, accessCountsData);
  }

  @override
  Future<bool> isValid(String key) async {
    // LRU items are always valid unless manually invalidated
    return true;
  }

  @override
  Future<void> invalidCleanup(String key) async {
    await rawDelete(key);
    accessTimes.remove(key);
    accessCounts.remove(key);
    await _saveTracking();
  }

  @override
  Future<dynamic> preGet(String key, dynamic originalValue) async {
    await _initializeTracking();

    if (defaultGet) {
      // Update access time and count for LRU tracking
      accessTimes[key] = DateTime.now();
      accessCounts[key] = (accessCounts[key] ?? 0) + 1;

      // Store updated metadata
      final meta = {
        'accessTime': accessTimes[key]!.toIso8601String(),
        'accessCount': accessCounts[key]!,
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
      accessTimes[key] = DateTime.now();
      accessCounts[key] = (accessCounts[key] ?? 0) + 1;

      // Store updated metadata
      final updatedMeta = {
        'accessTime': accessTimes[key]!.toIso8601String(),
        'accessCount': accessCounts[key]!,
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

      // Update access tracking
      accessTimes[key] = DateTime.now();
      accessCounts[key] = 1;

      // Store metadata with LRU information
      final meta = {
        'accessTime': accessTimes[key]!.toIso8601String(),
        'accessCount': accessCounts[key]!,
        'created': DateTime.now().toIso8601String(),
        ...?metadata,
      };
      await setMeta(key, meta);
      await _saveTracking();

      return value;
    } else {
      // Custom logic - handle everything ourselves
      await _evictIfNeeded();

      accessTimes[key] = DateTime.now();
      accessCounts[key] = 1;

      final meta = {
        'accessTime': accessTimes[key]!.toIso8601String(),
        'accessCount': accessCounts[key]!,
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
      accessTimes.remove(key);
      accessCounts.remove(key);
      await _saveTracking();
    } else {
      // Custom logic - handle everything ourselves
      await deleteMeta(key);
      accessTimes.remove(key);
      accessCounts.remove(key);
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

  /// Evict least recently used items if cache size exceeds maxSize
  Future<void> _evictIfNeeded() async {
    if (accessTimes.length < maxSize) return;

    // Sort by access time (oldest first)
    final sortedKeys = accessTimes.keys.toList()
      ..sort((a, b) => accessTimes[a]!.compareTo(accessTimes[b]!));

    // Evict oldest items until we're under the limit
    final itemsToEvict = sortedKeys.take(accessTimes.length - maxSize + 1);

    for (final key in itemsToEvict) {
      // Delete both metadata AND the actual cached value
      await rawDelete(key);
      accessTimes.remove(key);
      accessCounts.remove(key);
    }
    await _saveTracking();
  }

  /// Get cache statistics
  Map<String, dynamic> getStats() {
    return {
      'currentSize': accessTimes.length,
      'maxSize': maxSize,
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
}
