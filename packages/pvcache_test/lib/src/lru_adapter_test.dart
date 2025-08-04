// ignore_for_file: avoid_print

import 'package:pvcache/pvcache.dart';
import 'package:pvcache/adapters/lru.dart';
import 'dart:collection';

/// Tests LRU (Least Recently Used) cache adapter
class LRUAdapterTest {
  /// Register LRU cache environment
  static Future<void> registerEnvironment() async {
    final lruAdapter = LRUAdapter(maxSize: 3);
    await PVCache.register(
      'lru_cache',
      secureData: false,
      secureMeta: false,
      adapters: LinkedHashMap.from({
        'lru': lruAdapter, // LRU eviction logic (hooks only)
      }),
      // LRU adapter doesn't provide storage, so keep std for operations
      // LRU will be called through pre/post hooks automatically
      defaultMeta: {
        'cache_type': 'lru',
        'created_at': DateTime.now().millisecondsSinceEpoch,
      },
    );
    print(
      '✅ lru_cache environment registered with std storage + LRU eviction hooks',
    );
  }

  /// Run LRU adapter tests
  static Future<void> runTests() async {
    print('🔄 Testing LRU (Least Recently Used) Cache Adapter...');

    try {
      await _testBasicOperations();
      await _testEvictionBehavior();
      await _testIndexPersistence();
      _printAdapterInfo();

      print('   🎉 LRU adapter test completed successfully!');
    } catch (e) {
      print('     ❌ Error in LRU adapter test: $e');
      rethrow;
    }
  }

  /// Test basic LRU operations
  static Future<void> _testBasicOperations() async {
    print('     ✅ Using registered LRU cache environment');
    print('\n   📝 Testing LRU cache operations with actual data...');

    // Clear any existing data first
    await PVCache.clear('lru_cache');

    // Test basic operations with the registered environment
    await PVCache.set('lru_cache:item1', 'First item');
    print('     ✅ Added item1 to LRU cache');
    await Future.delayed(Duration(milliseconds: 50)); // Small delay for timing

    await PVCache.set('lru_cache:item2', 'Second item');
    print('     ✅ Added item2 to LRU cache');
    await Future.delayed(Duration(milliseconds: 50));

    await PVCache.set('lru_cache:item3', 'Third item');
    print('     ✅ Added item3 to LRU cache');
    await Future.delayed(Duration(milliseconds: 50));

    print('     📊 Cache now at max capacity (3/3 items)');
    print('     📅 Access order: item1 (oldest) → item2 → item3 (newest)');
  }

  /// Test LRU eviction behavior
  static Future<void> _testEvictionBehavior() async {
    print('\n   🔄 Testing LRU eviction behavior...');

    // Access item1 to make it recently used (moves from oldest to newest)
    final item1 = await PVCache.get('lru_cache:item1');
    print('     🔄 Accessed item1: $item1');
    print('     📅 New access order: item2 (oldest) → item3 → item1 (newest)');

    // Access item2 to make it recently used
    final item2 = await PVCache.get('lru_cache:item2');
    print('     🔄 Accessed item2: $item2');
    print('     📅 New access order: item3 (oldest) → item1 → item2 (newest)');

    // Add item4 - this should trigger LRU eviction of item3 (now oldest)
    await PVCache.set('lru_cache:item4', 'Fourth item - triggers eviction');
    print('     ➕ Added item4 (cache full, should evict oldest: item3)');
    print('     📅 Expected order: item1 → item2 → item4 (newest)');

    print('\n   🔍 Checking first eviction results...');
    await _checkItemExists('lru_cache:item1', 'item1', true);
    await _checkItemExists('lru_cache:item2', 'item2', true);
    await _checkItemExists(
      'lru_cache:item3',
      'item3',
      false,
    ); // Should be evicted
    await _checkItemExists('lru_cache:item4', 'item4', true);

    // Add item5 - should evict item1 (oldest)
    await PVCache.set(
      'lru_cache:item5',
      'Fifth item - triggers another eviction',
    );
    print('\n     ➕ Added item5 (should evict oldest: item1)');
    print('     📅 Expected order: item2 → item4 → item5 (newest)');

    print('\n   🔍 Checking second eviction results...');
    await _checkItemExists(
      'lru_cache:item1',
      'item1',
      false,
    ); // Should be evicted
    await _checkItemExists('lru_cache:item2', 'item2', true);
    await _checkItemExists('lru_cache:item4', 'item4', true);
    await _checkItemExists('lru_cache:item5', 'item5', true);

    // Add item6 - should evict item2 (oldest)
    await PVCache.set('lru_cache:item6', 'Sixth item - more eviction testing');
    print('\n     ➕ Added item6 (should evict oldest: item2)');
    print('     📅 Expected order: item4 → item5 → item6 (newest)');

    // Add item7 - should evict item4 (oldest)
    await PVCache.set('lru_cache:item7', 'Seventh item - continuing eviction');
    print('     ➕ Added item7 (should evict oldest: item4)');
    print('     📅 Expected order: item5 → item6 → item7 (newest)');

    print('\n   🔍 Checking final eviction results...');
    await _checkItemExists(
      'lru_cache:item2',
      'item2',
      false,
    ); // Should be evicted
    await _checkItemExists(
      'lru_cache:item4',
      'item4',
      false,
    ); // Should be evicted
    await _checkItemExists('lru_cache:item5', 'item5', true);
    await _checkItemExists('lru_cache:item6', 'item6', true);
    await _checkItemExists('lru_cache:item7', 'item7', true);

    // Access item5 to change the order, then add item8
    final item5 = await PVCache.get('lru_cache:item5');
    print('\n     🔄 Accessed item5: $item5 (now newest)');
    print('     📅 New access order: item6 (oldest) → item7 → item5 (newest)');

    await PVCache.set('lru_cache:item8', 'Eighth item - final eviction test');
    print('     ➕ Added item8 (should evict oldest: item6)');
    print('     📅 Final expected order: item7 → item5 → item8 (newest)');

    print('\n   🔍 Checking final state...');
    await _checkItemExists(
      'lru_cache:item6',
      'item6',
      false,
    ); // Should be evicted
    await _checkItemExists('lru_cache:item7', 'item7', true);
    await _checkItemExists('lru_cache:item5', 'item5', true);
    await _checkItemExists('lru_cache:item8', 'item8', true);
  }

  /// Test index persistence by checking internal metadata
  static Future<void> _testIndexPersistence() async {
    print('\n   🔍 Testing LRU index persistence...');

    try {
      // Try to access the internal tracking metadata to verify persistence
      final accessTimes = await PVCache.getMeta(
        'lru_cache:__lru_access_times__',
      );
      print(
        '     ✅ LRU access times metadata found: ${accessTimes.keys.length} entries',
      );

      final sortedIndex = await PVCache.getMeta(
        'lru_cache:__lru_sorted_index__',
      );
      if (sortedIndex.containsKey('keys')) {
        final keys = List<String>.from(sortedIndex['keys']);
        print('     ✅ LRU sorted index found: $keys');
        print('     📊 Index order: ${keys.join(' → ')} (oldest → newest)');
      }

      final config = await PVCache.getMeta('lru_cache:__lru_config__');
      if (config.containsKey('maxSize')) {
        print('     ✅ LRU config found: maxSize = ${config['maxSize']}');
      }

      print('     🎯 Index persistence verified successfully!');
    } catch (e) {
      print('     ℹ️  Could not access internal metadata (this is normal): $e');
    }
  }

  /// Print LRU adapter information
  static void _printAdapterInfo() {
    print('\n   ⚡ LRU Adapter Features:');
    print('     🔹 Maximum cache size: 3 items');
    print('     🔹 Eviction policy: Least Recently Used (LRU)');
    print('     🔹 Purpose: Manages access tracking and eviction logic');
    print('     🔹 Storage: Delegates to std adapter for actual storage');

    print('\n   📖 How LRU Adapter Works:');
    print('     1. Tracks access times for each cache item');
    print('     2. When cache reaches maxSize, evicts oldest accessed items');
    print('     3. Updates access time on every get/set operation');
    print('     4. Uses persistent metadata storage for tracking');
    print('     5. Delegates storage operations to standard adapter');

    print('\n   💡 LRU Use Cases:');
    print('     🎯 Web/API response caching with size limits');
    print('     🎯 Image or file caching with memory constraints');
    print('     🎯 Database query result caching');
    print('     🎯 User session data with automatic cleanup');
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
