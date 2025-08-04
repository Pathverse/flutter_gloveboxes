// ignore_for_file: avoid_print

import 'package:pvcache_test/src/initializer.dart';
import 'package:pvcache_test/src/basic_operations_test.dart';
import 'package:pvcache_test/src/lru_adapter_test.dart';
import 'package:pvcache_test/src/lfu_adapter_test.dart';
import 'package:pvcache_test/src/fragger_adapter_test.dart';

/// Main test suite coordinator for PVCache functionality
class PVCacheTestSuite {
  /// Run all PVCache tests
  static Future<void> runAllTests() async {
    try {
      print('🚀 Starting PVCache Test Suite...');

      // Register ALL environments BEFORE initialization
      await PVCacheInitializer.registerEnvironments();
      await LRUAdapterTest.registerEnvironment();
      await LFUAdapterTest.registerEnvironment();
      await FraggerAdapterTest.registerEnvironment();

      // Now initialize PVCache with all environments registered
      await PVCacheInitializer.initializePVCache();

      // Run basic operations tests
      await BasicOperationsTest.runAll();

      // Run cache adapter tests
      print('\n🧠 Testing cache adapters...');
      await LRUAdapterTest.runTests();
      await LFUAdapterTest.runTests();
      await FraggerAdapterTest.runTests();

      print('\n🎯 All PVCache tests completed successfully!');
    } catch (e) {
      print('❌ PVCache test failed: $e');
      print('Stack trace: ${StackTrace.current}');
      rethrow;
    }
  }

  /// Initialize PVCache only (for individual test runs)
  static Future<void> initializePVCache() async {
    await PVCacheInitializer.registerEnvironments();
    await LRUAdapterTest.registerEnvironment();
    await LFUAdapterTest.registerEnvironment();
    await FraggerAdapterTest.registerEnvironment();
    await PVCacheInitializer.initializePVCache();
  }

  /// Run only basic operations tests
  static Future<void> testPVCacheOperations() async {
    await BasicOperationsTest.runAll();
  }

  /// Run only LRU adapter tests
  static Future<void> testLRUAdapter() async {
    await LRUAdapterTest.runTests();
  }

  /// Run only LFU adapter tests
  static Future<void> testLFUAdapter() async {
    await LFUAdapterTest.runTests();
  }
}
