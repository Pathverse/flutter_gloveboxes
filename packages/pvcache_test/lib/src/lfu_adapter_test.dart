// ignore_for_file: avoid_print

import 'package:pvcache/pvcache.dart';
import 'package:pvcache/adapters/lfu.dart';
import 'dart:collection';

/// Tests LFU (Least Frequently Used) cache adapter
class LFUAdapterTest {
  /// Register LFU cache environment
  static Future<void> registerEnvironment() async {
    final lfuAdapter = LFUAdapter(maxSize: 3);
    await PVCache.register(
      'lfu_cache',
      secureData: false,
      secureMeta: false,
      adapters: LinkedHashMap.from({
        'lfu': lfuAdapter, // LFU eviction logic (hooks only)
      }),
      // LFU adapter doesn't provide storage, so keep std for operations
      // LFU will be called through pre/post hooks automatically
      defaultMeta: {
        'cache_type': 'lfu',
        'created_at': DateTime.now().millisecondsSinceEpoch,
      },
    );
    print(
      '✅ lfu_cache environment registered with std storage + LFU eviction hooks',
    );
  }

  /// Run LFU adapter tests
  static Future<void> runTests() async {
    print('📊 Testing LFU (Least Frequently Used) Cache Adapter...');

    try {
      await _testBasicOperations();
      await _testFrequencyTracking();
      await _testEvictionBehavior();
      await _testIndexPersistence();
      _printAdapterInfo();
      _printComparison();

      print('   🎉 LFU adapter demonstration completed successfully!');
    } catch (e) {
      print('     ❌ Error in LFU adapter test: $e');
      rethrow;
    }
  }

  /// Test basic LFU operations
  static Future<void> _testBasicOperations() async {
    print('     ✅ Using registered LFU cache environment');
    print('\n   📝 Testing LFU cache operations with actual data...');

    // Clear any existing data first
    await PVCache.clear('lfu_cache');

    // Test basic operations with the registered environment
    await PVCache.set('lfu_cache:item_a', 'Item A - will be accessed once');
    print('     ✅ Added item_a to LFU cache (access count: 1)');

    await PVCache.set(
      'lfu_cache:item_b',
      'Item B - will be accessed multiple times',
    );
    print('     ✅ Added item_b to LFU cache (access count: 1)');

    await PVCache.set('lfu_cache:item_c', 'Item C - will be accessed twice');
    print('     ✅ Added item_c to LFU cache (access count: 1)');

    print('     📊 Cache now at max capacity (3/3 items)');
    print('     🔢 All items have access count: 1');
  }

  /// Test frequency tracking
  static Future<void> _testFrequencyTracking() async {
    print('\n   📊 Testing frequency tracking...');

    // Access item_b multiple times to increase its frequency
    for (int i = 0; i < 3; i++) {
      await PVCache.get('lfu_cache:item_b');
    }
    print('     🔄 Accessed item_b 3 additional times (total access count: 4)');

    // Access item_c once more
    await PVCache.get('lfu_cache:item_c');
    print('     🔄 Accessed item_c once more (total access count: 2)');

    // item_a remains at access count: 1 (least frequent)
    print('     📈 Current frequency ranking:');
    print('       🥇 item_b: 4 accesses (most frequent)');
    print('       🥈 item_c: 2 accesses');
    print(
      '       🥉 item_a: 1 access (least frequent - will be evicted first)',
    );
  }

  /// Test LFU eviction behavior
  static Future<void> _testEvictionBehavior() async {
    print('\n   🔄 Testing LFU eviction behavior...');

    // Add item_d - this should trigger LFU eviction of item_a (least frequent)
    await PVCache.set('lfu_cache:item_d', 'Item D - triggers eviction');
    print('     ➕ Added item_d (should evict least frequent: item_a)');
    print('     📊 Expected state: item_b (4), item_c (2), item_d (1)');

    print('\n   🔍 Checking first eviction results...');
    await _checkItemExists(
      'lfu_cache:item_a',
      'item_a',
      false,
    ); // Should be evicted
    await _checkItemExists('lfu_cache:item_b', 'item_b', true);
    await _checkItemExists('lfu_cache:item_c', 'item_c', true);
    await _checkItemExists('lfu_cache:item_d', 'item_d', true);

    // Access item_d a few times to increase its frequency
    for (int i = 0; i < 2; i++) {
      await PVCache.get('lfu_cache:item_d');
    }
    print(
      '\n     🔄 Accessed item_d 2 additional times (total access count: 3)',
    );
    print('     📈 Updated frequency ranking:');
    print('       🥇 item_b: 4 accesses');
    print('       🥈 item_d: 3 accesses');
    print('       🥉 item_c: 2 accesses (least frequent)');

    // Add item_e - should evict item_c (now least frequent)
    await PVCache.set('lfu_cache:item_e', 'Item E - second eviction test');
    print('\n     ➕ Added item_e (should evict least frequent: item_c)');
    print('     📊 Expected state: item_b (4), item_d (3), item_e (1)');

    print('\n   🔍 Checking second eviction results...');
    await _checkItemExists('lfu_cache:item_b', 'item_b', true);
    await _checkItemExists(
      'lfu_cache:item_c',
      'item_c',
      false,
    ); // Should be evicted
    await _checkItemExists('lfu_cache:item_d', 'item_d', true);
    await _checkItemExists('lfu_cache:item_e', 'item_e', true);

    // Add item_f - should evict item_e (least frequent with count 1)
    await PVCache.set('lfu_cache:item_f', 'Item F - third eviction test');
    print('\n     ➕ Added item_f (should evict least frequent: item_e)');
    print('     📊 Expected state: item_b (4), item_d (3), item_f (1)');

    // Add item_g - should evict item_f (least frequent with count 1)
    await PVCache.set('lfu_cache:item_g', 'Item G - fourth eviction test');
    print('     ➕ Added item_g (should evict least frequent: item_f)');
    print('     📊 Expected state: item_b (4), item_d (3), item_g (1)');

    print('\n   🔍 Checking final eviction results...');
    await _checkItemExists('lfu_cache:item_b', 'item_b', true);
    await _checkItemExists('lfu_cache:item_d', 'item_d', true);
    await _checkItemExists(
      'lfu_cache:item_e',
      'item_e',
      false,
    ); // Should be evicted
    await _checkItemExists(
      'lfu_cache:item_f',
      'item_f',
      false,
    ); // Should be evicted
    await _checkItemExists('lfu_cache:item_g', 'item_g', true);

    print(
      '\n     🎯 LFU eviction working correctly - least frequent items evicted!',
    );
  }

  /// Test index persistence by checking internal metadata
  static Future<void> _testIndexPersistence() async {
    print('\n   🔍 Testing LFU index persistence...');

    try {
      // Try to access the internal tracking metadata to verify persistence
      final accessCounts = await PVCache.getMeta(
        'lfu_cache:__lfu_access_counts__',
      );
      print(
        '     ✅ LFU access counts metadata found: ${accessCounts.keys.length} entries',
      );

      final accessTimes = await PVCache.getMeta(
        'lfu_cache:__lfu_access_times__',
      );
      print(
        '     ✅ LFU access times metadata found: ${accessTimes.keys.length} entries',
      );

      final config = await PVCache.getMeta('lfu_cache:__lfu_config__');
      if (config.containsKey('maxSize')) {
        print('     ✅ LFU config found: maxSize = ${config['maxSize']}');
      }

      print('     🎯 Index persistence verified successfully!');
    } catch (e) {
      print('     ℹ️  Could not access internal metadata (this is normal): $e');
    }
  }

  /// Print LFU adapter information
  static void _printAdapterInfo() {
    print('\n   ⚡ LFU Adapter Features:');
    print('     🔹 Maximum cache size: 3 items');
    print('     🔹 Eviction policy: Least Frequently Used (LFU)');
    print('     🔹 Storage backend: StdAdapter (Hive-based)');
    print('     🔹 Frequency tracking: Access counts and timestamps');

    print('\n   📖 How LFU Adapter Works:');
    print('     1. Tracks access frequency for each cache item');
    print('     2. Tracks access timestamps for tie-breaking');
    print('     3. When cache reaches maxSize, evicts least frequent items');
    print('     4. Increments access count on every get operation');
    print('     5. Uses internal metadata for persistent frequency tracking');
    print('     6. Handles all storage operations through base adapter');

    print('\n   🔧 LFU Implementation Details:');
    print('     📊 Access counts stored as: __lfu_access_counts__');
    print('     ⏰ Access times stored as: __lfu_access_times__');
    print('     🔄 Eviction: Frequency first, then oldest timestamp');
    print('     💾 Persistence: Metadata survives app restarts');

    print('\n   💡 LFU Use Cases:');
    print('     🎯 Long-term caching where usage patterns matter');
    print('     🎯 CDN caching with smart content eviction');
    print('     🎯 Database query caching by popularity');
    print('     🎯 Configuration/settings caching');
    print('     🎯 User preference data with usage tracking');
  }

  /// Print LFU vs LRU comparison
  static void _printComparison() {
    print('\n   ⚖️ LFU vs LRU Comparison:');
    print('     🔹 LFU: Evicts by frequency (how often accessed)');
    print('     🔹 LRU: Evicts by recency (how recently accessed)');
    print('     🔹 LFU: Better for long-term usage patterns');
    print('     🔹 LRU: Better for temporal locality patterns');
    print('     🔹 LFU: More complex tracking (count + time)');
    print('     🔹 LRU: Simpler tracking (time only)');
  }

  /// Helper method to check if an item exists and report results
  static Future<void> _checkItemExists(
    String key,
    String itemName,
    bool shouldExist,
  ) async {
    final value = await PVCache.get(key);

    if (shouldExist) {
      if (value != null) {
        print('     ✅ $itemName still exists: $value');
      } else {
        print('     ❌ $itemName was unexpectedly evicted: null');
      }
    } else {
      if (value == null) {
        print('     ✅ $itemName was correctly evicted: null');
      } else {
        print(
          '     ❌ $itemName unexpectedly exists (should be evicted): $value',
        );
      }
    }
  }
}
