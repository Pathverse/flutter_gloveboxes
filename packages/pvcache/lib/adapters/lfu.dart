import 'package:pvcache/config.dart';
import 'package:pvcache/utils/debug.dart';

/// LFU (Least Frequently Used) cache adapter
///
/// Simple decorator that adds LFU eviction behavior using internal metadata.
/// Persists access counts, access times, and configuration for durability across restarts.
/// Uses a StdAdapter internally for storage but adds frequency tracking.
///
/// Usage:
/// ```dart
/// final lfuAdapter = LFUAdapter(maxSize: 50);
/// await PVCache.register('cache_with_lfu',
///   adapters: LinkedHashMap.from({
///     'std': StdAdapter(),
///     'lfu': lfuAdapter,
///   })
/// );
/// ```
class LFUAdapter implements PVAdapter {
  final int maxSize;
  final Map<String, int> _accessCounts = {};
  final Map<String, DateTime> _accessTimes = {};
  final List<String> _sortedIndex =
      []; // Cached sorted order (least frequent first)
  bool _initialized = false;

  // Special internal keys for tracking data and configuration
  static const String _accessCountsKey = '__lfu_access_counts__';
  static const String _accessTimesKey = '__lfu_access_times__';
  static const String _sortedIndexKey = '__lfu_sorted_index__';
  static const String _configKey = '__lfu_config__';

  LFUAdapter({required this.maxSize});

  @override
  bool get hasPreMethods => true;

  @override
  bool get hasPostMethods => true;

  /// Initialize tracking from internal metadata
  Future<void> _initializeTracking(PVCacheConfig config) async {
    if (_initialized) return;

    try {
      // Load access counts from internal metadata using direct storage access
      final countsData = await config.getMetaDirect(_accessCountsKey);
      if (countsData.isNotEmpty) {
        _accessCounts.clear();
        for (final entry in countsData.entries) {
          final count = int.tryParse(entry.value);
          if (count != null) {
            _accessCounts[entry.key] = count;
          }
        }
      }

      // Load access times from internal metadata using direct storage access
      final timesData = await config.getMetaDirect(_accessTimesKey);
      if (timesData.isNotEmpty) {
        _accessTimes.clear();
        for (final entry in timesData.entries) {
          final timeStr = entry.value;
          final time = DateTime.tryParse(timeStr);
          if (time != null) {
            _accessTimes[entry.key] = time;
          }
        }
      }

      // Load sorted index from metadata using flat storage format
      final indexData = await config.getMetaDirect(_sortedIndexKey);
      if (indexData.isNotEmpty) {
        _sortedIndex.clear();

        // Reconstruct list from indexed entries
        final sortedEntries = <int, String>{};
        for (final entry in indexData.entries) {
          if (entry.key.startsWith('__index_')) {
            final indexStr = entry.key.substring(8); // Remove '__index_'
            final index = int.tryParse(indexStr);
            if (index != null) {
              sortedEntries[index] = entry.value;
            }
          }
        }

        // Add entries in order
        final sortedKeys = sortedEntries.keys.toList()..sort();
        for (final index in sortedKeys) {
          _sortedIndex.add(sortedEntries[index]!);
        }

        // Validate that all keys in index still exist in access counts
        _sortedIndex.removeWhere((key) => !_accessCounts.containsKey(key));

        // Add any new keys that aren't in the index
        for (final key in _accessCounts.keys) {
          if (!_sortedIndex.contains(key)) {
            _sortedIndex.add(key);
          }
        }

        // Re-sort if needed (this should be rare)
        if (_sortedIndex.length != _accessCounts.length) {
          _rebuildSortedIndex();
        }
      } else {
        // Build initial sorted index
        _rebuildSortedIndex();
      }

      // Save current maxSize to metadata using direct storage access
      await config.setMetaDirect(_configKey, {'maxSize': maxSize});
    } catch (e) {
      // If loading fails, start with empty tracking
      _accessCounts.clear();
      _accessTimes.clear();
    }

    _initialized = true;
  }

  /// Rebuild the sorted index from current access counts and times
  void _rebuildSortedIndex() {
    _sortedIndex.clear();
    _sortedIndex.addAll(_accessCounts.keys);
    _sortedIndex.sort((a, b) {
      final countA = _accessCounts[a]!;
      final countB = _accessCounts[b]!;

      if (countA != countB) {
        return countA.compareTo(
          countB,
        ); // Sort by frequency first (least frequent first)
      }

      // If frequencies are equal, sort by access time (oldest first)
      final timeA = _accessTimes[a]!;
      final timeB = _accessTimes[b]!;
      return timeA.compareTo(timeB);
    });
  }

  /// Save tracking to internal metadata using flat storage format
  Future<void> _saveTracking(PVCacheConfig config) async {
    try {
      // Save access counts as flat key-value pairs (all strings)
      final countsData = <String, String>{};
      for (final entry in _accessCounts.entries) {
        countsData[entry.key] = entry.value.toString();
      }
      await config.setMetaDirect(_accessCountsKey, countsData);

      // Save access times as flat key-value pairs (all strings)
      final timesData = <String, String>{};
      for (final entry in _accessTimes.entries) {
        timesData[entry.key] = entry.value.toIso8601String();
      }
      await config.setMetaDirect(_accessTimesKey, timesData);

      // Save sorted index as indexed entries (flat storage)
      final indexData = <String, String>{};
      for (int i = 0; i < _sortedIndex.length; i++) {
        indexData['__index_$i'] = _sortedIndex[i];
      }
      await config.setMetaDirect(_sortedIndexKey, indexData);
    } catch (e) {
      // Silently fail if we can't save tracking data
    }
  }

  /// Evict least frequently used items if cache size exceeds maxSize
  Future<void> _evictIfNeeded(PVCacheConfig config) async {
    cacheDebugPrint(
      '🔍 LFU._evictIfNeeded: Current size=${_accessCounts.length}, maxSize=$maxSize',
    );

    if (_accessCounts.length < maxSize) {
      cacheDebugPrint(
        '✅ LFU._evictIfNeeded: No eviction needed (${_accessCounts.length} < $maxSize)',
      );
      return;
    }

    cacheDebugPrint(
      '⚠️  LFU._evictIfNeeded: Eviction needed! Current size=${_accessCounts.length}, maxSize=$maxSize',
    );
    cacheDebugPrint(
      '📊 LFU._evictIfNeeded: Current sorted index: $_sortedIndex',
    );
    cacheDebugPrint(
      '📈 LFU._evictIfNeeded: Current access counts: $_accessCounts',
    );

    // Use cached sorted index instead of recomputing
    final itemsToEvict = _sortedIndex
        .take(_accessCounts.length - maxSize + 1)
        .toList();

    cacheDebugPrint('🗑️  LFU._evictIfNeeded: Items to evict: $itemsToEvict');

    for (final key in itemsToEvict) {
      cacheDebugPrint(
        '🗑️  LFU._evictIfNeeded: Evicting key="$key" with count=${_accessCounts[key]}',
      );

      // Delete both data and metadata using designated adapters
      await config.deleteAdapter.delete(key, config);
      await config.metaDeleteAdapter.deleteMeta(key, config);
      _accessCounts.remove(key);
      _accessTimes.remove(key);
      _sortedIndex.remove(key);

      cacheDebugPrint('✅ LFU._evictIfNeeded: Successfully evicted key="$key"');
    }

    cacheDebugPrint(
      '🎯 LFU._evictIfNeeded: After eviction - size=${_accessCounts.length}, index=$_sortedIndex',
    );
    await _saveTracking(config);
  }

  @override
  Future<void> clear(PVCacheConfig config) async {
    _accessCounts.clear();
    _accessTimes.clear();
    _sortedIndex.clear();
    await _saveTracking(config);
  }

  @override
  Future<void> clearMeta(PVCacheConfig config) async {
    // Clear our tracking data when meta is cleared
    _accessCounts.clear();
    _accessTimes.clear();
    _sortedIndex.clear();
    await _saveTracking(config);
  }

  @override
  Future<void> init(PVCacheConfig config) async {
    await _initializeTracking(config);
  }

  // Storage operations not implemented - use noSuchMethod
  @override
  dynamic noSuchMethod(Invocation invocation) {
    throw UnsupportedError(
      'LFU adapter only provides eviction logic through pre/post hooks. Storage operations should be handled by other adapters.',
    );
  }

  // LFU-specific pre/post hooks
  @override
  Future<(dynamic, bool)> preGet(
    String key,
    Map metadata,
    PVCacheConfig config,
  ) async {
    cacheDebugPrint('📖 LFU.preGet: key="$key"');
    await _initializeTracking(config);

    // Don't update access count here - wait for postGet to confirm item exists
    cacheDebugPrint(
      'LFU.preGet: Skipping access count update until item confirmed to exist',
    );

    // Return null value and continue flag - let the actual get operation proceed
    return (null, true);
  }

  @override
  Future<(dynamic, bool)> preSet(
    String key,
    dynamic value,
    Map<String, dynamic>? metadata,
    PVCacheConfig config,
  ) async {
    cacheDebugPrint('📝 LFU.preSet: key="$key", value="$value"');
    await _initializeTracking(config);

    cacheDebugPrint(
      '📊 LFU.preSet: BEFORE eviction check - size=${_accessCounts.length}, maxSize=$maxSize',
    );
    cacheDebugPrint('📊 LFU.preSet: Current index: $_sortedIndex');
    cacheDebugPrint('📊 LFU.preSet: Current counts: $_accessCounts');

    // Check if we need to evict items due to size limit
    await _evictIfNeeded(config);

    cacheDebugPrint(
      '📝 LFU.preSet: AFTER eviction - adding key="$key" with count=1',
    );

    // Initialize access tracking for new item
    _accessCounts[key] = 1;
    _accessTimes[key] = DateTime.now();

    // Add to beginning of sorted index (least frequent)
    if (_sortedIndex.contains(key)) {
      _sortedIndex.remove(key);
      cacheDebugPrint('📝 LFU.preSet: Removed existing key="$key" from index');
    }
    _sortedIndex.insert(0, key);

    cacheDebugPrint(
      '📊 LFU.preSet: FINAL state - size=${_accessCounts.length}, index=$_sortedIndex',
    );
    await _saveTracking(config);

    // Return the original value and continue flag
    return (value, true);
  }

  @override
  Future<bool> preDelete(String key, PVCacheConfig config) async {
    await _initializeTracking(config);

    // Clean up tracking
    _accessCounts.remove(key);
    _accessTimes.remove(key);
    _sortedIndex.remove(key);
    await _saveTracking(config);

    // Continue with the delete operation
    return true;
  }

  @override
  Future<void> postGet(String key, dynamic value, PVCacheConfig config) async {
    // Only update access count if item actually exists (value is not null)
    if (value != null) {
      await _initializeTracking(config);

      // Update access count and time for LFU tracking
      final oldCount = _accessCounts[key] ?? 0;
      _accessCounts[key] = oldCount + 1;
      _accessTimes[key] = DateTime.now();

      cacheDebugPrint(
        '📈 LFU.postGet: Updated key="$key" count: $oldCount → ${_accessCounts[key]}',
      );

      // Efficiently update sorted index - remove and re-insert at correct position
      if (_sortedIndex.contains(key)) {
        _sortedIndex.remove(key);
      }

      // Find correct insertion point based on new frequency
      final newCount = _accessCounts[key]!;
      int insertIndex = _sortedIndex.length;

      for (int i = _sortedIndex.length - 1; i >= 0; i--) {
        final otherKey = _sortedIndex[i];
        final otherCount = _accessCounts[otherKey]!;

        if (newCount > otherCount ||
            (newCount == otherCount &&
                _accessTimes[key]!.isAfter(_accessTimes[otherKey]!))) {
          insertIndex = i + 1;
          break;
        } else if (newCount < otherCount) {
          insertIndex = i;
        }
      }

      _sortedIndex.insert(insertIndex, key);
      cacheDebugPrint('📊 LFU.postGet: Updated sorted index: $_sortedIndex');
      await _saveTracking(config);
    } else {
      cacheDebugPrint(
        '🚫 LFU.postGet: Item "$key" not found, skipping access count update',
      );
    }
  }

  @override
  Future<void> postSet(String key, dynamic value, PVCacheConfig config) async {
    // No post-processing needed for LFU
  }

  @override
  Future<void> postDelete(String key, PVCacheConfig config) async {
    // No post-processing needed for LFU
  }

  /// Get cache statistics
  Map<String, dynamic> getStats() {
    if (_accessCounts.isEmpty) {
      return {
        'type': 'LFU',
        'currentSize': 0,
        'maxSize': maxSize,
        'averageAccessCount': 0,
        'minAccessCount': 0,
        'maxAccessCount': 0,
        'sortedKeys': <String>[],
      };
    }

    final counts = _accessCounts.values.toList();
    final averageCount = counts.reduce((a, b) => a + b) / counts.length;
    final minCount = _sortedIndex.isNotEmpty
        ? _accessCounts[_sortedIndex.first]!
        : 0;
    final maxCount = _sortedIndex.isNotEmpty
        ? _accessCounts[_sortedIndex.last]!
        : 0;

    return {
      'type': 'LFU',
      'currentSize': _accessCounts.length,
      'maxSize': maxSize,
      'averageAccessCount': averageCount,
      'minAccessCount': minCount,
      'maxAccessCount': maxCount,
      'oldestAccess': _accessTimes.isNotEmpty && _sortedIndex.isNotEmpty
          ? _accessTimes[_sortedIndex.first]?.toIso8601String()
          : null,
      'newestAccess': _accessTimes.isNotEmpty && _sortedIndex.isNotEmpty
          ? _accessTimes[_sortedIndex.last]?.toIso8601String()
          : null,
      'sortedKeys': List<String>.from(_sortedIndex), // Show current order
    };
  }

  /// Get items sorted by frequency (most frequently used first)
  List<MapEntry<String, int>> getItemsByFrequency() {
    // Use reversed sorted index since our index is least frequent first
    return _sortedIndex.reversed
        .map((key) => MapEntry(key, _accessCounts[key]!))
        .toList();
  }
}
