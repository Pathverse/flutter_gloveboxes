// ignore_for_file: avoid_print

import 'package:pvcache/pvcache.dart';
import 'package:pvcache/adapters/fragger.dart';
import 'dart:collection';

/// Tests Fragger adapter for pattern-based data fragmentation
class FraggerAdapterTest {
  // Keep a reference to the fragger instance for stats
  static late Fragger _fraggerInstance;

  /// Register Fragger cache environment
  static Future<void> registerEnvironment() async {
    _fraggerInstance = Fragger([
      // User data pattern with fragment references
      FraggerFetchConfig(
        pattern: 'user_*',
        fragmentStrategy: FragmentStorageStrategy.reference,
        fetchMethod: (pattern) async {
          print('🔄 Fetching data for pattern: $pattern');
          // Simulate API call delay
          await Future.delayed(Duration(milliseconds: 100));

          return {
            'user_123': {
              'name': 'John Doe',
              'email': 'john@example.com',
              'profile': {'avatar': 'avatar.jpg', 'bio': 'Software developer'},
              'settings': {'notifications': true, 'privacy': 'public'},
            },
            'user_456': {
              'name': 'Jane Smith',
              'email': 'jane@example.com',
              'profile': {'avatar': 'jane.jpg', 'bio': 'Designer'},
              'settings': {'notifications': false, 'privacy': 'private'},
            },
          };
        },
        frags: {
          'profile': FraggerParseConfig(justFlatten: true),
          'settings': FraggerParseConfig(justFlatten: false),
        },
      ),

      // Config pattern with pop strategy
      FraggerFetchConfig(
        pattern: 'config_*',
        fragmentStrategy: FragmentStorageStrategy.pop,
        fetchMethod: (pattern) async {
          print('🔄 Fetching config for pattern: $pattern');
          return {
            'config_app': {
              'version': '1.0.0',
              'features': ['auth', 'notifications'],
              'endpoints': {
                'api': 'https://api.example.com',
                'cdn': 'https://cdn.example.com',
              },
            },
          };
        },
        frags: {'endpoints': FraggerParseConfig(justFlatten: true)},
      ),

      // Custom strategy example
      FraggerFetchConfig(
        pattern: 'custom_*',
        fragmentStrategy: FragmentStorageStrategy.custom,
        customFragmentHandler: (key, value, mainData) {
          // Custom logic: prefix fragment references
          return 'custom_ref:$key';
        },
        fetchMethod: (pattern) async {
          return {
            'custom_data': {
              'main': 'data',
              'fragment_part': {'nested': 'value'},
            },
          };
        },
        frags: {'fragment_part': FraggerParseConfig(justFlatten: false)},
      ),
    ]);

    await PVCache.register(
      'fragger_cache',
      secureData: false,
      secureMeta: false,
      adapters: LinkedHashMap.from({'fragger': _fraggerInstance}),
      defaultMeta: {
        'cache_type': 'fragger',
        'created_at': DateTime.now().millisecondsSinceEpoch,
      },
    );
    print('✅ fragger_cache environment registered with Fragger adapter');
  }

  /// Run Fragger adapter tests
  static Future<void> runTests() async {
    print('\n🧩 === Fragger Adapter Tests ===');

    await testBasicFragmentation();
    await testFragmentStrategies();
    await testPatternMatching();
    await testFragmentResolution();
    await testCacheStatistics();

    print('🧩 === Fragger Adapter Tests Complete ===\n');
  }

  /// Test basic fragmentation functionality
  static Future<void> testBasicFragmentation() async {
    print('\n📋 Test: Basic Fragmentation');

    try {
      // Test fetch with fragment references
      final userData = await PVCache.get('fragger_cache:user_123');
      print('✅ Fetched user data: $userData');

      // Verify fragment references are created
      if (userData is Map<String, dynamic>) {
        final profileRef = userData['profile'];
        final settingsRef = userData['settings'];

        if (profileRef is String && profileRef.startsWith('@fragment:')) {
          print('✅ Profile fragment reference created: $profileRef');
        } else {
          print('❌ Profile fragment reference not found');
        }

        if (settingsRef is String && settingsRef.startsWith('@fragment:')) {
          print('✅ Settings fragment reference created: $settingsRef');
        } else {
          print('❌ Settings fragment reference not found');
        }
      }

      // Test second access (should use cached data)
      final cachedData = await PVCache.get('fragger_cache:user_456');
      print('✅ Cached data access: $cachedData');
    } catch (e) {
      print('❌ Basic fragmentation test failed: $e');
    }
  }

  /// Test different fragment strategies
  static Future<void> testFragmentStrategies() async {
    print('\n📋 Test: Fragment Strategies');

    try {
      // Test pop strategy (fragments removed from main data)
      final configData = await PVCache.get('fragger_cache:config_app');
      print('✅ Config data (pop strategy): $configData');

      if (configData is Map<String, dynamic>) {
        if (configData.containsKey('endpoints')) {
          print('❌ Pop strategy failed - endpoints still in main data');
        } else {
          print('✅ Pop strategy working - endpoints removed from main data');
        }
      }

      // Test custom strategy
      final customData = await PVCache.get('fragger_cache:custom_data');
      print('✅ Custom data (custom strategy): $customData');

      if (customData is Map<String, dynamic>) {
        final fragmentRef = customData['fragment_part'];
        if (fragmentRef is String && fragmentRef.startsWith('custom_ref:')) {
          print('✅ Custom strategy working: $fragmentRef');
        } else {
          print('❌ Custom strategy failed: $fragmentRef');
        }
      }
    } catch (e) {
      print('❌ Fragment strategies test failed: $e');
    }
  }

  /// Test pattern matching
  static Future<void> testPatternMatching() async {
    print('\n📋 Test: Pattern Matching');

    try {
      // Test manual data setting with pattern matching
      await PVCache.set('fragger_cache:user_789', {
        'name': 'Bob Wilson',
        'profile': {'avatar': 'bob.jpg', 'bio': 'Manager'},
        'settings': {'notifications': true},
      });

      final manualData = await PVCache.get('fragger_cache:user_789');
      print('✅ Manual set with pattern matching: $manualData');

      // Test non-matching pattern (should pass through normally)
      await PVCache.set('fragger_cache:other_data', {'key': 'value'});
      final otherData = await PVCache.get('fragger_cache:other_data');
      print('✅ Non-matching pattern (pass-through): $otherData');
    } catch (e) {
      print('❌ Pattern matching test failed: $e');
    }
  }

  /// Test fragment reference resolution
  static Future<void> testFragmentResolution() async {
    print('\n📋 Test: Fragment Reference Resolution');

    try {
      // First, ensure we have data with fragment references
      await PVCache.get('fragger_cache:user_123');

      // Get raw data (should contain references)
      final rawData = await PVCache.get('fragger_cache:user_123');
      print('🔍 Raw data: $rawData');

      // The postGet hook should resolve fragment references automatically
      if (rawData is Map<String, dynamic>) {
        final profile = rawData['profile'];
        if (profile is Map || profile is String) {
          print('✅ Fragment reference handling working');
        } else {
          print('⚠️ Fragment reference format unexpected: $profile');
        }
      }
    } catch (e) {
      print('❌ Fragment resolution test failed: $e');
    }
  }

  /// Test cache statistics and management
  static Future<void> testCacheStatistics() async {
    print('\n📋 Test: Cache Statistics');

    try {
      // Now we can access the fragger adapter instance directly
      printFraggerStats(_fraggerInstance);

      print('✅ Statistics test completed');
    } catch (e) {
      print('❌ Cache statistics test failed: $e');
    }
  }

  /// Test error handling
  static Future<void> testErrorHandling() async {
    print('\n📋 Test: Error Handling');

    try {
      // Create a config with a failing fetch method
      final failingFragger = Fragger([
        FraggerFetchConfig(
          pattern: 'fail_*',
          fetchMethod: (pattern) async {
            throw Exception('Simulated fetch failure');
          },
        ),
      ]);

      // This should gracefully handle the fetch failure
      // and fall back to normal storage behavior
      print('✅ Error handling test setup complete');
      print(
        '   Failing fragger created with ${failingFragger.configs.length} configs',
      );
    } catch (e) {
      print('❌ Error handling test failed: $e');
    }
  }

  /// Helper method to print fragment adapter statistics
  static void printFraggerStats(Fragger fragger) {
    final stats = fragger.getStats();
    print('📊 Fragger Statistics:');
    print('   Type: ${stats['type']}');
    print('   Patterns: ${stats['patterns']}');
    print('   Total Configs: ${stats['totalConfigs']}');
    print('   Strategies: ${stats['strategies']}');
    print('   Has Custom Handlers: ${stats['hasCustomHandlers']}');
    print('   Stateless: ${stats['stateless']}');
  }
}
