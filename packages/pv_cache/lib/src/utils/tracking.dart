import 'package:pv_cache/src/core/options.dart';
import 'package:pv_cache/src/core/toplv.dart';

/// Handles LRU/LFU tracking and cache eviction logic
class CacheTracking {
  /// Update LRU/LFU tracking on store operation
  static Future<void> updateOnStore(String key, CacheOptions options) async {
    if (options.lru != true) return;

    // Ensure subscriberBox is initialized
    if (subscriberBox == null) await baseInit();
    final subBox = subscriberBox!;

    if ((options.lruInCount ?? 0) > 0) {
      // LFU: increment frequency count
      final currentCount = int.tryParse(subBox.get('${key}_freq') ?? '0') ?? 0;
      await subBox.put('${key}_freq', (currentCount + 1).toString());
    } else {
      // LRU: update access time
      await subBox.put(
        '${key}_access',
        DateTime.now().millisecondsSinceEpoch.toString(),
      );
    }
  }

  /// Update LRU/LFU tracking on access (get operation)
  static Future<void> updateOnAccess(String key, CacheOptions options) async {
    if (options.lru != true) return;

    // Ensure subscriberBox is initialized
    if (subscriberBox == null) await baseInit();
    final subBox = subscriberBox!;

    if ((options.lruInCount ?? 0) > 0) {
      // LFU: increment frequency count
      final currentCount = int.tryParse(subBox.get('${key}_freq') ?? '0') ?? 0;
      await subBox.put('${key}_freq', (currentCount + 1).toString());
    } else {
      // LRU: update access time
      await subBox.put(
        '${key}_access',
        DateTime.now().millisecondsSinceEpoch.toString(),
      );
    }
  }

  /// Clean up tracking data for a deleted key
  static Future<void> cleanupTracking(String key) async {
    // Ensure subscriberBox is initialized
    if (subscriberBox == null) await baseInit();
    final subBox = subscriberBox!;

    await subBox.delete('${key}_freq');
    await subBox.delete('${key}_access');
  }

  /// Get all tracked keys for eviction purposes
  static Future<List<String>> getTrackedKeys() async {
    // Ensure subscriberBox is initialized
    if (subscriberBox == null) await baseInit();
    final subBox = subscriberBox!;

    final keys = subBox.keys.cast<String>().toList();

    // Filter for tracking keys and extract original key names
    final trackedKeys = <String>{};
    for (final key in keys) {
      if (key.endsWith('_freq') || key.endsWith('_access')) {
        final originalKey = key.replaceAll(RegExp(r'_(freq|access)$'), '');
        trackedKeys.add(originalKey);
      }
    }

    return trackedKeys.toList();
  }

  /// Perform eviction based on LRU/LFU strategy
  static Future<void> performEviction(
    String group,
    int maxCount,
    bool isLFU,
  ) async {
    // Ensure subscriberBox is initialized
    if (subscriberBox == null) await baseInit();
    final subBox = subscriberBox!;

    final trackedKeys = await getTrackedKeys();

    // Only consider keys that exist in the group box
    final groupBox = await getCollectionBox(group);
    final groupKeys = <String>[];
    for (final key in trackedKeys) {
      if (await groupBox.containsKey(key)) {
        groupKeys.add(key);
      }
    }
    if (groupKeys.length <= maxCount) return;

    // Calculate eviction candidates
    final candidates = <MapEntry<String, int>>[];
    for (final key in groupKeys) {
      if (isLFU) {
        // LFU: get frequency count
        final count = int.tryParse(subBox.get('${key}_freq') ?? '0') ?? 0;
        candidates.add(MapEntry(key, count));
      } else {
        // LRU: get access time
        final accessTime =
            int.tryParse(subBox.get('${key}_access') ?? '0') ?? 0;
        candidates.add(MapEntry(key, accessTime));
      }
    }

    // Sort candidates for eviction
    if (isLFU) {
      // Sort by frequency (ascending - least frequent first)
      candidates.sort((a, b) => a.value.compareTo(b.value));
    } else {
      // Sort by access time (ascending - least recent first)
      candidates.sort((a, b) => a.value.compareTo(b.value));
    }

    // Evict excess entries
    final toEvict = candidates.length - maxCount;
    for (int i = 0; i < toEvict; i++) {
      final keyToEvict = candidates[i].key;
      try {
        await groupBox.delete(keyToEvict);
      } catch (e) {
        // Might be in secure storage, try there too
        try {
          await secureStorage.delete(key: keyToEvict);
        } catch (e) {
          // Key might already be deleted, continue
        }
      }
      await cleanupTracking(keyToEvict);
    }
  }
}
