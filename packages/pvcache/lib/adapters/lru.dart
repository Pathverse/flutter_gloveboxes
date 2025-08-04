import 'package:pvcache/config.dart';
import 'package:pvcache/utils/debug.dart';

/// LRU (Least Recently Used) cache adapter
///
/// Handles LRU eviction logic in pre-hooks, delegates storage to other adapters.
/// Persists access times and configuration to metadata for durability across restarts.
///
/// Usage:
/// ```dart
/// final lruAdapter = LRUAdapter(maxSize: 100);
/// await PVCache.register('cache_with_lru',
///   adapters: LinkedHashMap.from({
///     'std': StdAdapter(),
///     'lru': lruAdapter,
///   })
/// );
/// ```
class LRUAdapter implements PVAdapter {
  final int maxSize;
  final Map<String, DateTime> _accessTimes = {};
  final List<String> _sortedIndex = []; // Cached sorted order (oldest first)
  bool _initialized = false;

  // Special internal keys for tracking data and configuration
  static const String _accessTimesKey = '__lru_access_times__';
  static const String _sortedIndexKey = '__lru_sorted_index__';
  static const String _configKey = '__lru_config__';

  LRUAdapter({required this.maxSize});

  @override
  bool get hasPreMethods => true;

  @override
  bool get hasPostMethods => true;

  /// Initialize tracking from internal metadata
  Future<void> _initializeTracking(PVCacheConfig config) async {
    if (_initialized) return;

    try {
      // Load access times from metadata using direct storage access
      final trackingData = await config.getMetaDirect(_accessTimesKey);

      if (trackingData.isNotEmpty) {
        _accessTimes.clear();
        for (final entry in trackingData.entries) {
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

        // Validate that all keys in index still exist in access times
        _sortedIndex.removeWhere((key) => !_accessTimes.containsKey(key));

        // Add any new keys that aren't in the index
        for (final key in _accessTimes.keys) {
          if (!_sortedIndex.contains(key)) {
            _sortedIndex.add(key);
          }
        }

        // Re-sort if needed (this should be rare)
        if (_sortedIndex.length != _accessTimes.length) {
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
      _accessTimes.clear();
    }

    _initialized = true;
  }

  /// Rebuild the sorted index from current access times
  void _rebuildSortedIndex() {
    _sortedIndex.clear();
    _sortedIndex.addAll(_accessTimes.keys);
    _sortedIndex.sort((a, b) => _accessTimes[a]!.compareTo(_accessTimes[b]!));
  }

  /// Save tracking to internal metadata using flat storage format
  Future<void> _saveTracking(PVCacheConfig config) async {
    try {
      // Save access times as flat key-value pairs (all strings)
      final accessTimesData = <String, String>{};
      for (final entry in _accessTimes.entries) {
        accessTimesData[entry.key] = entry.value.toIso8601String();
      }
      await config.setMetaDirect(_accessTimesKey, accessTimesData);

      // Save sorted index as indexed entries (flat storage)
      final indexData = <String, String>{};
      for (int i = 0; i < _sortedIndex.length; i++) {
        indexData['__index_$i'] = _sortedIndex[i];
      }
      await config.setMetaDirect(_sortedIndexKey, indexData);
    } catch (e) {
      throw Exception('Failed to save LRU tracking data: $e');
    }
  }

  /// Evict least recently used items if cache size exceeds maxSize
  Future<void> _evictIfNeeded(PVCacheConfig config) async {
    cacheDebugPrint(
      '🔍 LRU._evictIfNeeded: Current size=${_accessTimes.length}, maxSize=$maxSize',
    );

    if (_accessTimes.length < maxSize) {
      cacheDebugPrint(
        '✅ LRU._evictIfNeeded: No eviction needed (${_accessTimes.length} < $maxSize)',
      );
      return;
    }

    cacheDebugPrint(
      '⚠️  LRU._evictIfNeeded: Eviction needed! Current size=${_accessTimes.length}, maxSize=$maxSize',
    );
    cacheDebugPrint(
      '📊 LRU._evictIfNeeded: Current sorted index: $_sortedIndex',
    );
    cacheDebugPrint(
      '📈 LRU._evictIfNeeded: Current access times: ${_accessTimes.map((k, v) => MapEntry(k, v.toIso8601String()))}',
    );

    // Use cached sorted index instead of recomputing
    final itemsToEvict = _sortedIndex
        .take(_accessTimes.length - maxSize + 1)
        .toList();

    cacheDebugPrint('🗑️  LRU._evictIfNeeded: Items to evict: $itemsToEvict');

    for (final key in itemsToEvict) {
      cacheDebugPrint(
        '🗑️  LRU._evictIfNeeded: Evicting key="$key" accessed at ${_accessTimes[key]?.toIso8601String()}',
      );

      // Delete both data and metadata using designated adapters
      await config.deleteAdapter.delete(key, config);
      await config.metaDeleteAdapter.deleteMeta(key, config);
      _accessTimes.remove(key);
      _sortedIndex.remove(key);

      cacheDebugPrint('✅ LRU._evictIfNeeded: Successfully evicted key="$key"');
    }

    cacheDebugPrint(
      '🎯 LRU._evictIfNeeded: After eviction - size=${_accessTimes.length}, index=$_sortedIndex',
    );
    await _saveTracking(config);
  }

  @override
  Future<void> clear(PVCacheConfig config) async {
    _accessTimes.clear();
    _sortedIndex.clear();
    await _saveTracking(config);
  }

  @override
  Future<void> clearMeta(PVCacheConfig config) async {
    // Clear our tracking data when meta is cleared
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
      'LRU adapter only provides eviction logic through pre/post hooks. Storage operations should be handled by other adapters.',
    );
  }

  // LRU-specific pre/post hooks - only handle eviction logic
  @override
  Future<(dynamic, bool)> preGet(
    String key,
    Map metadata,
    PVCacheConfig config,
  ) async {
    cacheDebugPrint('📖 LRU.preGet: key="$key"');
    cacheDebugPrint(
      '📊 LRU.preGet: Before - size=${_accessTimes.length}, index=$_sortedIndex',
    );

    await _initializeTracking(config);

    // Don't update access time here - wait for postGet to confirm item exists
    cacheDebugPrint(
      '🔍 LRU.preGet: Skipping access time update until item confirmed to exist',
    );

    cacheDebugPrint('📊 LRU.preGet: After - index=$_sortedIndex');

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
    cacheDebugPrint('💾 LRU.preSet: key="$key", value="$value"');
    cacheDebugPrint(
      '📊 LRU.preSet: Before eviction - size=${_accessTimes.length}, maxSize=$maxSize',
    );
    cacheDebugPrint('📈 LRU.preSet: Before eviction - index=$_sortedIndex');

    await _initializeTracking(config);

    // Check if we need to evict items due to size limit
    await _evictIfNeeded(config);

    cacheDebugPrint(
      '📊 LRU.preSet: After eviction - size=${_accessTimes.length}',
    );

    // Initialize access tracking for new item
    final now = DateTime.now();
    final oldTime = _accessTimes[key];
    _accessTimes[key] = now;

    cacheDebugPrint(
      '⏰ LRU.preSet: Updated access time for "$key" from ${oldTime?.toIso8601String() ?? 'null'} to ${now.toIso8601String()}',
    );

    // Add to end of sorted index (most recently used)
    if (!_sortedIndex.contains(key)) {
      _sortedIndex.add(key);
      cacheDebugPrint('📈 LRU.preSet: Added new key "$key" to end of index');
    } else {
      // Move existing key to end
      _sortedIndex.remove(key);
      _sortedIndex.add(key);
      cacheDebugPrint(
        '📈 LRU.preSet: Moved existing key "$key" to end of index',
      );
    }

    cacheDebugPrint(
      '📊 LRU.preSet: Final state - size=${_accessTimes.length}, index=$_sortedIndex',
    );
    await _saveTracking(config);

    // Return the original value and continue flag
    return (value, true);
  }

  @override
  Future<bool> preDelete(String key, PVCacheConfig config) async {
    await _initializeTracking(config);

    // Clean up tracking
    _accessTimes.remove(key);
    _sortedIndex.remove(key);
    await _saveTracking(config);

    // Continue with the delete operation
    return true;
  }

  @override
  Future<void> postGet(String key, dynamic value, PVCacheConfig config) async {
    // Only update access time if item actually exists (value is not null)
    if (value != null) {
      await _initializeTracking(config);

      final oldTime = _accessTimes[key];
      final now = DateTime.now();
      _accessTimes[key] = now;

      cacheDebugPrint(
        '⏰ LRU.postGet: Updated access time for "$key" from ${oldTime?.toIso8601String() ?? 'null'} to ${now.toIso8601String()}',
      );

      // Efficiently update sorted index instead of full rebuild
      if (oldTime != null) {
        // Move key to end (most recently used)
        _sortedIndex.remove(key);
        _sortedIndex.add(key);
        cacheDebugPrint(
          '📈 LRU.postGet: Moved existing key "$key" to end of index',
        );
      } else {
        // New key, add to end
        _sortedIndex.add(key);
        cacheDebugPrint('📈 LRU.postGet: Added new key "$key" to end of index');
      }

      cacheDebugPrint('📊 LRU.postGet: After - index=$_sortedIndex');
      await _saveTracking(config);
    } else {
      cacheDebugPrint(
        '🚫 LRU.postGet: Item "$key" not found, skipping access time update',
      );
    }
  }

  @override
  Future<void> postSet(String key, dynamic value, PVCacheConfig config) async {
    // No post-processing needed for LRU
  }

  @override
  Future<void> postDelete(String key, PVCacheConfig config) async {
    // No post-processing needed for LRU
  }

  /// Get cache statistics
  Map<String, dynamic> getStats() {
    return {
      'type': 'LRU',
      'currentSize': _accessTimes.length,
      'maxSize': maxSize,
      'oldestAccess': _accessTimes.isNotEmpty && _sortedIndex.isNotEmpty
          ? _accessTimes[_sortedIndex.first]?.toIso8601String()
          : null,
      'newestAccess': _accessTimes.isNotEmpty && _sortedIndex.isNotEmpty
          ? _accessTimes[_sortedIndex.last]?.toIso8601String()
          : null,
      'sortedKeys': List<String>.from(_sortedIndex), // Show current order
    };
  }
}
