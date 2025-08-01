// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:pv_cache/pv_cache.dart';
import 'advanced_fragment_example.dart';
import 'dart:async';

/// PV Cache Web Test Example
///
/// This example demonstrates the usage of pv_cache package on web platform
/// with various caching scenarios including expiry, different data types,
/// and environment management.
class PVCacheWebTest extends StatefulWidget {
  const PVCacheWebTest({super.key});

  @override
  State<PVCacheWebTest> createState() => _PVCacheWebTestState();
}

class _PVCacheWebTestState extends State<PVCacheWebTest> {
  final TextEditingController _keyController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();
  final TextEditingController _expiryController = TextEditingController();

  String _status = 'Initializing...';
  String _lastResult = '';
  bool _isInitialized = false;
  String _selectedEnvironment = 'default';
  Set<String> _availableEnvironments = {'default'};

  @override
  void initState() {
    super.initState();
    _initializeCache();
  }

  Future<void> _initializeCache() async {
    try {
      setState(() {
        _status = 'Setting up environments...';
        _availableEnvironments = {'default'};
      });

      // Set up each environment with its own specific storage type
      final environmentConfigs = {
        'default': SimpleExpiry(),
        'production': SimpleLRU(maxSize: 10),
        'staging': SimpleLFU(maxSize: 8),
        'test': SimpleExpiry(),
      };

      Set<String> successfulEnvironments = {};

      for (final entry in environmentConfigs.entries) {
        final env = entry.key;
        final config = entry.value;

        try {
          setState(() {
            _status =
                'Setting up $env environment with ${config.storageType.name}...';
          });

          // Try to set up the environment, but don't fail if it already exists
          try {
            await PVCache.setEnv(env, config).timeout(
              const Duration(seconds: 5),
              onTimeout: () {
                throw TimeoutException('Timeout setting up $env environment');
              },
            );
            successfulEnvironments.add(env);
            print(
              '$env environment set successfully with ${config.storageType.name}',
            );
          } catch (e) {
            // If environment already exists, consider it successful
            if (e.toString().contains('already exists')) {
              successfulEnvironments.add(env);
              print('$env environment already exists, using existing');
            } else {
              throw e; // Re-throw other errors
            }
          }
        } catch (e) {
          print('Error setting up $env environment: $e');
          setState(() {
            _status =
                'Warning: Could not set up $env environment, continuing with others';
          });
          // Continue with other environments even if one fails
        }
      }

      // Ensure at least default environment is available
      if (!successfulEnvironments.contains('default')) {
        throw Exception(
          'Default environment is required but could not be set up',
        );
      }

      setState(() {
        _status =
            'Initializing cache with ${successfulEnvironments.length} environments...';
      });

      // Initialize the cache with all successfully set up environments
      await PVCache.init().timeout(
        const Duration(seconds: 15),
        onTimeout: () {
          throw TimeoutException('Timeout initializing cache');
        },
      );

      setState(() {
        _isInitialized = true;
        _availableEnvironments = successfulEnvironments;
        _status =
            'Cache initialized successfully! Available environments: ${successfulEnvironments.join(', ')}';
      });

      // Test the cache with a simple operation
      try {
        await PVCache.set('default:test_init', 'initialization_test');
        final testValue = await PVCache.get('default:test_init');
        if (testValue == 'initialization_test') {
          setState(() {
            _status =
                'Cache initialized and tested successfully! Available environments: ${successfulEnvironments.join(', ')}';
          });
        }
      } catch (e) {
        print('Cache test failed: $e');
        // Don't fail initialization if test fails
      }
    } catch (e) {
      setState(() {
        _isInitialized = false;
        _status = 'Error initializing cache: $e';
      });
      print('Cache initialization error: $e');
    }
  }

  Future<void> _setValue() async {
    if (!_isInitialized) return;

    try {
      final key = _keyController.text.trim();
      final value = _valueController.text.trim();

      if (key.isEmpty || value.isEmpty) {
        setState(() {
          _status = 'Please enter both key and value';
        });
        return;
      }

      // Create the full key with environment
      final fullKey = '$_selectedEnvironment:$key';

      // Set expiry metadata if provided (only for environments that support expiry)
      Map<String, dynamic>? metadata;
      if ((_selectedEnvironment == 'default' ||
              _selectedEnvironment == 'test') &&
          _expiryController.text.isNotEmpty) {
        final expirySeconds = int.tryParse(_expiryController.text);
        if (expirySeconds != null) {
          final expiryTime = DateTime.now().add(
            Duration(seconds: expirySeconds),
          );
          metadata = {'expiry': expiryTime.toIso8601String()};
        }
      }

      await PVCache.set(fullKey, value, metadata: metadata);

      setState(() {
        _status = 'Value set successfully: $fullKey = $value';
        _lastResult = 'SET: $fullKey = $value';
      });
    } catch (e) {
      setState(() {
        _status = 'Error setting value: $e';
      });
    }
  }

  Future<void> _getValue() async {
    if (!_isInitialized) return;

    try {
      final key = _keyController.text.trim();

      if (key.isEmpty) {
        setState(() {
          _status = 'Please enter a key';
        });
        return;
      }

      // Create the full key with environment
      final fullKey = '$_selectedEnvironment:$key';

      final value = await PVCache.get(fullKey);

      setState(() {
        if (value != null) {
          _status = 'Value retrieved: $fullKey = $value';
          _lastResult = 'GET: $fullKey = $value';
        } else {
          _status = 'Value not found or expired: $fullKey';
          _lastResult = 'GET: $fullKey = null';
        }
      });
    } catch (e) {
      setState(() {
        _status = 'Error getting value: $e';
      });
    }
  }

  Future<void> _deleteValue() async {
    if (!_isInitialized) return;

    try {
      final key = _keyController.text.trim();

      if (key.isEmpty) {
        setState(() {
          _status = 'Please enter a key';
        });
        return;
      }

      // Create the full key with environment
      final fullKey = '$_selectedEnvironment:$key';

      await PVCache.delete(fullKey);

      setState(() {
        _status = 'Value deleted: $fullKey';
        _lastResult = 'DELETE: $fullKey';
      });
    } catch (e) {
      setState(() {
        _status = 'Error deleting value: $e';
      });
    }
  }

  Future<void> _clearCache() async {
    if (!_isInitialized) return;

    try {
      await PVCache.clear(env: _selectedEnvironment);

      setState(() {
        _status =
            'Cache cleared successfully for environment: $_selectedEnvironment';
        _lastResult = 'CLEAR: All data removed from $_selectedEnvironment';
      });
    } catch (e) {
      setState(() {
        _status = 'Error clearing cache: $e';
      });
    }
  }

  Future<void> _testExpiry() async {
    if (!_isInitialized ||
        (_selectedEnvironment != 'default' && _selectedEnvironment != 'test')) {
      setState(() {
        _status =
            'Expiry test only works with default or test environment (SimpleExpiry)';
      });
      return;
    }

    try {
      // Set a value with 5 second expiry
      const testKey = 'expiry_test';
      const testValue = 'This will expire in 5 seconds';
      final fullKey = '$_selectedEnvironment:$testKey';

      // Set expiry metadata
      final expiryTime = DateTime.now().add(const Duration(seconds: 5));
      final metadata = {'expiry': expiryTime.toIso8601String()};

      await PVCache.set(fullKey, testValue, metadata: metadata);

      setState(() {
        _status = 'Expiry test set: $fullKey = $testValue (expires in 5s)';
        _lastResult = 'EXPIRY TEST: Set with 5s expiry';
      });

      // Wait and check expiry
      Future.delayed(const Duration(seconds: 6), () async {
        final value = await PVCache.get(fullKey);
        setState(() {
          if (value == null) {
            _status = 'Expiry test passed: Value expired as expected';
            _lastResult = 'EXPIRY TEST: Value expired successfully';
          } else {
            _status = 'Expiry test failed: Value still exists';
            _lastResult = 'EXPIRY TEST: Value did not expire';
          }
        });
      });
    } catch (e) {
      setState(() {
        _status = 'Error in expiry test: $e';
      });
    }
  }

  Future<void> _testLRU() async {
    if (!_isInitialized || _selectedEnvironment != 'production') {
      setState(() {
        _status = 'LRU test only works with production environment (SimpleLRU)';
      });
      return;
    }

    try {
      // Fill cache to capacity (maxSize = 5)
      for (int i = 1; i <= 6; i++) {
        final fullKey = '$_selectedEnvironment:lru_test_$i';
        await PVCache.set(fullKey, 'Value $i');
      }

      // Try to get the first item (should be evicted)
      final firstValue = await PVCache.get('$_selectedEnvironment:lru_test_1');

      setState(() {
        if (firstValue == null) {
          _status = 'LRU test passed: Oldest item was evicted';
          _lastResult = 'LRU TEST: Item 1 evicted successfully';
        } else {
          _status = 'LRU test failed: Oldest item still exists';
          _lastResult = 'LRU TEST: Item 1 was not evicted';
        }
      });
    } catch (e) {
      setState(() {
        _status = 'Error in LRU test: $e';
      });
    }
  }

  Future<void> _testLFU() async {
    if (!_isInitialized || _selectedEnvironment != 'staging') {
      setState(() {
        _status = 'LFU test only works with staging environment (SimpleLFU)';
      });
      return;
    }

    try {
      // Fill cache to capacity (maxSize = 5)
      for (int i = 1; i <= 5; i++) {
        final fullKey = '$_selectedEnvironment:lfu_test_$i';
        await PVCache.set(fullKey, 'Value $i');
      }

      // Access some items multiple times to create frequency differences
      await PVCache.get('$_selectedEnvironment:lfu_test_1'); // Access once
      await PVCache.get('$_selectedEnvironment:lfu_test_2'); // Access once
      await PVCache.get('$_selectedEnvironment:lfu_test_3'); // Access once
      await PVCache.get('$_selectedEnvironment:lfu_test_1'); // Access twice
      await PVCache.get('$_selectedEnvironment:lfu_test_2'); // Access twice

      // Add one more item to trigger eviction
      await PVCache.set('$_selectedEnvironment:lfu_test_6', 'Value 6');

      // Try to get the least frequently used item (should be evicted)
      final lfuValue = await PVCache.get('$_selectedEnvironment:lfu_test_3');

      setState(() {
        if (lfuValue == null) {
          _status = 'LFU test passed: Least frequently used item was evicted';
          _lastResult = 'LFU TEST: Item 3 evicted successfully';
        } else {
          _status = 'LFU test failed: LFU item still exists';
          _lastResult = 'LFU TEST: Item 3 was not evicted';
        }
      });
    } catch (e) {
      setState(() {
        _status = 'Error in LFU test: $e';
      });
    }
  }

  Future<void> _testSpecialKeyProtection() async {
    if (!_isInitialized) return;

    try {
      // Try to set a value with a special key
      final fullKey = '$_selectedEnvironment:__test_key__';
      await PVCache.set(fullKey, 'This should fail');

      setState(() {
        _status = 'Special key test failed: Should have thrown an error';
        _lastResult = 'SPECIAL KEY TEST: Unexpected success';
      });
    } catch (e) {
      setState(() {
        _status = 'Special key test passed: Blocked __test_key__';
        _lastResult = 'SPECIAL KEY TEST: Successfully blocked special key';
      });
    }
  }

  Future<void> _testComplexData() async {
    if (!_isInitialized) return;

    try {
      const testKey = 'complex_data';
      final fullKey = '$_selectedEnvironment:$testKey';
      final testValue = {
        'string': 'Hello World',
        'number': 42,
        'boolean': true,
        'list': [1, 2, 3, 'four'],
        'nested': {
          'level1': {'level2': 'Deep nested value'},
        },
      };

      await PVCache.set(fullKey, testValue);

      setState(() {
        _status = 'Complex data test: Stored nested object';
        _lastResult = 'COMPLEX TEST: Stored nested data structure';
      });

      // Retrieve and verify
      final retrieved = await PVCache.get(fullKey);
      if (retrieved != null) {
        setState(() {
          _status = 'Complex data test: Retrieved successfully';
          _lastResult = 'COMPLEX TEST: Retrieved: ${retrieved.toString()}';
        });
      }
    } catch (e) {
      setState(() {
        _status = 'Error in complex data test: $e';
      });
    }
  }

  Future<void> _testCrossEnvironment() async {
    if (!_isInitialized) return;

    try {
      const testKey = 'cross_env_test';
      const testValue = 'Cross environment test value';

      // Set value in production environment
      await PVCache.set('production:$testKey', testValue);

      // Set different value in staging environment
      await PVCache.set('staging:$testKey', 'Different value for staging');

      // Get value from production
      final prodValue = await PVCache.get('production:$testKey');

      // Get value from staging
      final stagingValue = await PVCache.get('staging:$testKey');

      // Get value from default (should be null)
      final defaultValue = await PVCache.get('default:$testKey');

      setState(() {
        _status = 'Cross environment test completed';
        _lastResult =
            'CROSS ENV TEST: prod=$prodValue, staging=$stagingValue, default=$defaultValue';
      });
    } catch (e) {
      setState(() {
        _status = 'Error in cross environment test: $e';
      });
    }
  }

  Future<void> _testIfNotCached() async {
    if (!_isInitialized) return;

    try {
      const testKey = 'if_not_cached_test';
      final fullKey = '$_selectedEnvironment:$testKey';

      // Clear any existing value first
      await PVCache.delete(fullKey);

      setState(() {
        _status = 'Testing ifNotCached functionality...';
        _lastResult = 'IF NOT CACHED TEST: Starting test';
      });

      // Simulate expensive operation counter
      int expensiveOperationCount = 0;

      // Define the expensive callback function
      Future<String> expensiveOperation() async {
        expensiveOperationCount++;
        // Simulate network delay or expensive computation
        await Future.delayed(const Duration(milliseconds: 500));
        return 'Expensive result #$expensiveOperationCount from $_selectedEnvironment';
      }

      // First call - should execute the callback and cache the result
      setState(() {
        _status = 'First call: Executing expensive operation...';
      });

      final firstResult = await PVCache.ifNotCached(
        fullKey,
        expensiveOperation,
        metadata: {
          'source': 'if_not_cached_test',
          'timestamp': DateTime.now().toIso8601String(),
        },
      );

      // Second call - should return cached value without executing callback
      setState(() {
        _status = 'Second call: Should return cached value...';
      });

      final secondResult = await PVCache.ifNotCached(
        fullKey,
        expensiveOperation,
        metadata: {
          'source': 'if_not_cached_test',
          'timestamp': DateTime.now().toIso8601String(),
        },
      );

      // Third call - should return cached value without executing callback
      setState(() {
        _status = 'Third call: Should return cached value...';
      });

      final thirdResult = await PVCache.ifNotCached(
        fullKey,
        expensiveOperation,
        metadata: {
          'source': 'if_not_cached_test',
          'timestamp': DateTime.now().toIso8601String(),
        },
      );

      // Verify results
      final allResultsMatch =
          firstResult == secondResult && secondResult == thirdResult;
      final callbackExecutedOnce = expensiveOperationCount == 1;

      if (allResultsMatch && callbackExecutedOnce) {
        setState(() {
          _status =
              'ifNotCached test passed! Callback executed once, cached value returned for subsequent calls';
          _lastResult =
              'IF NOT CACHED TEST: SUCCESS\n'
              'Callback executed: $expensiveOperationCount times\n'
              'First result: $firstResult\n'
              'Second result: $secondResult\n'
              'Third result: $thirdResult\n'
              'All results match: $allResultsMatch';
        });
      } else {
        setState(() {
          _status =
              'ifNotCached test failed! Expected callback to execute once only';
          _lastResult =
              'IF NOT CACHED TEST: FAILED\n'
              'Callback executed: $expensiveOperationCount times (expected 1)\n'
              'First result: $firstResult\n'
              'Second result: $secondResult\n'
              'Third result: $thirdResult\n'
              'All results match: $allResultsMatch';
        });
      }

      // Test with expiry (for environments that support it)
      if (_selectedEnvironment == 'default' || _selectedEnvironment == 'test') {
        setState(() {
          _status = 'Testing ifNotCached with expiry...';
        });

        const expiryTestKey = 'if_not_cached_expiry_test';
        final expiryFullKey = '$_selectedEnvironment:$expiryTestKey';

        // Clear any existing value
        await PVCache.delete(expiryFullKey);

        int expiryOperationCount = 0;

        Future<String> expiryOperation() async {
          expiryOperationCount++;
          await Future.delayed(const Duration(milliseconds: 200));
          return 'Expiry test result #$expiryOperationCount';
        }

        // Set with 3 second expiry
        final expiryTime = DateTime.now().add(const Duration(seconds: 3));
        final expiryMetadata = {'expiry': expiryTime.toIso8601String()};

        // First call
        final expiryFirstResult = await PVCache.ifNotCached(
          expiryFullKey,
          expiryOperation,
          metadata: expiryMetadata,
        );

        // Second call (should be cached)
        await PVCache.ifNotCached(
          expiryFullKey,
          expiryOperation,
          metadata: expiryMetadata,
        );

        // Wait for expiry
        await Future.delayed(const Duration(seconds: 4));

        // Third call (should execute callback again due to expiry)
        final expiryThirdResult = await PVCache.ifNotCached(
          expiryFullKey,
          expiryOperation,
          metadata: expiryMetadata,
        );

        final expiryCallbackExecutedTwice = expiryOperationCount == 2;
        final expiryResultsDifferent = expiryFirstResult != expiryThirdResult;

        if (expiryCallbackExecutedTwice && expiryResultsDifferent) {
          setState(() {
            _status =
                'ifNotCached with expiry test passed! Callback executed twice due to expiry';
            _lastResult +=
                '\n\nEXPIRY TEST: SUCCESS\n'
                'Callback executed: $expiryOperationCount times\n'
                'First result: $expiryFirstResult\n'
                'Third result: $expiryThirdResult\n'
                'Results different after expiry: $expiryResultsDifferent';
          });
        } else {
          setState(() {
            _status = 'ifNotCached with expiry test failed!';
            _lastResult +=
                '\n\nEXPIRY TEST: FAILED\n'
                'Callback executed: $expiryOperationCount times (expected 2)\n'
                'First result: $expiryFirstResult\n'
                'Third result: $expiryThirdResult\n'
                'Results different after expiry: $expiryResultsDifferent';
          });
        }
      }
    } catch (e) {
      setState(() {
        _status = 'Error in ifNotCached test: $e';
        _lastResult = 'IF NOT CACHED TEST: ERROR - $e';
      });
    }
  }

  Future<void> _runBatchTests() async {
    if (!_isInitialized) return;

    try {
      setState(() {
        _status = 'Running automated batch tests...';
        _lastResult = 'BATCH TEST: Starting comprehensive test suite';
      });

      final results = <String, dynamic>{};
      int totalTests = 0;
      int passedTests = 0;

      // Test 1: Basic operations across all environments
      for (final env in _availableEnvironments) {
        totalTests++;
        try {
          final testKey = 'batch_test_basic_$env';
          final testValue = 'Batch test value for $env';

          await PVCache.set('$env:$testKey', testValue);
          final retrieved = await PVCache.get('$env:$testKey');

          if (retrieved == testValue) {
            passedTests++;
            results['basic_$env'] = 'PASS';
          } else {
            results['basic_$env'] = 'FAIL: Expected $testValue, got $retrieved';
          }
        } catch (e) {
          results['basic_$env'] = 'ERROR: $e';
        }
      }

      // Test 2: Complex data types
      for (final env in _availableEnvironments) {
        totalTests++;
        try {
          final testKey = 'batch_test_complex_$env';
          final testValue = {
            'string': 'Complex string for $env',
            'number': 42,
            'boolean': true,
            'list': [1, 2, 3, 'four'],
            'nested': {
              'level1': {'level2': 'Deep nested value for $env'},
            },
          };

          await PVCache.set('$env:$testKey', testValue);
          final retrieved = await PVCache.get('$env:$testKey');

          if (retrieved != null && retrieved['string'] == testValue['string']) {
            passedTests++;
            results['complex_$env'] = 'PASS';
          } else {
            results['complex_$env'] =
                'FAIL: Complex data not preserved correctly';
          }
        } catch (e) {
          results['complex_$env'] = 'ERROR: $e';
        }
      }

      // Test 3: Expiry functionality (for environments that support it)
      for (final env in ['default', 'test']) {
        if (_availableEnvironments.contains(env)) {
          totalTests++;
          try {
            final testKey = 'batch_test_expiry_$env';
            final testValue = 'Expiry test for $env';
            final expiryTime = DateTime.now().add(const Duration(seconds: 2));
            final metadata = {'expiry': expiryTime.toIso8601String()};

            await PVCache.set('$env:$testKey', testValue, metadata: metadata);
            final immediate = await PVCache.get('$env:$testKey');

            if (immediate == testValue) {
              // Wait for expiry
              await Future.delayed(const Duration(seconds: 3));
              final expired = await PVCache.get('$env:$testKey');

              if (expired == null) {
                passedTests++;
                results['expiry_$env'] = 'PASS';
              } else {
                results['expiry_$env'] = 'FAIL: Value did not expire';
              }
            } else {
              results['expiry_$env'] = 'FAIL: Could not set value with expiry';
            }
          } catch (e) {
            results['expiry_$env'] = 'ERROR: $e';
          }
        }
      }

      // Test 4: LRU eviction (for production environment)
      if (_availableEnvironments.contains('production')) {
        totalTests++;
        try {
          // Fill cache to capacity
          for (int i = 1; i <= 11; i++) {
            await PVCache.set('production:lru_batch_$i', 'Value $i');
          }

          // Check if first item was evicted
          final firstValue = await PVCache.get('production:lru_batch_1');

          if (firstValue == null) {
            passedTests++;
            results['lru_production'] = 'PASS';
          } else {
            results['lru_production'] = 'FAIL: LRU eviction not working';
          }
        } catch (e) {
          results['lru_production'] = 'ERROR: $e';
        }
      }

      // Test 5: LFU eviction (for staging environment)
      if (_availableEnvironments.contains('staging')) {
        totalTests++;
        try {
          // Fill cache to capacity
          for (int i = 1; i <= 9; i++) {
            await PVCache.set('staging:lfu_batch_$i', 'Value $i');
          }

          // Access some items to create frequency differences
          await PVCache.get('staging:lfu_batch_1');
          await PVCache.get('staging:lfu_batch_2');
          await PVCache.get('staging:lfu_batch_1'); // Access twice

          // Add one more to trigger eviction
          await PVCache.set('staging:lfu_batch_10', 'Value 10');

          // Check if least frequently used item was evicted
          final lfuValue = await PVCache.get('staging:lfu_batch_3');

          if (lfuValue == null) {
            passedTests++;
            results['lfu_staging'] = 'PASS';
          } else {
            results['lfu_staging'] = 'FAIL: LFU eviction not working';
          }
        } catch (e) {
          results['lfu_staging'] = 'ERROR: $e';
        }
      }

      // Test 6: Delete operations
      for (final env in _availableEnvironments) {
        totalTests++;
        try {
          final testKey = 'batch_test_delete_$env';
          final testValue = 'Delete test for $env';

          await PVCache.set('$env:$testKey', testValue);
          await PVCache.delete('$env:$testKey');
          final deleted = await PVCache.get('$env:$testKey');

          if (deleted == null) {
            passedTests++;
            results['delete_$env'] = 'PASS';
          } else {
            results['delete_$env'] = 'FAIL: Value not deleted';
          }
        } catch (e) {
          results['delete_$env'] = 'ERROR: $e';
        }
      }

      // Test 7: Clear operations
      for (final env in _availableEnvironments) {
        totalTests++;
        try {
          // Set some test values
          await PVCache.set('$env:clear_test_1', 'Clear test 1');
          await PVCache.set('$env:clear_test_2', 'Clear test 2');

          // Clear the environment
          await PVCache.clear(env: env);

          // Check if values are gone
          final value1 = await PVCache.get('$env:clear_test_1');
          final value2 = await PVCache.get('$env:clear_test_2');

          if (value1 == null && value2 == null) {
            passedTests++;
            results['clear_$env'] = 'PASS';
          } else {
            results['clear_$env'] = 'FAIL: Environment not cleared';
          }
        } catch (e) {
          results['clear_$env'] = 'ERROR: $e';
        }
      }

      // Test 8: Special key protection
      for (final env in _availableEnvironments) {
        totalTests++;
        try {
          final testKey = '__batch_test_special__';

          try {
            await PVCache.set('$env:$testKey', 'This should fail');
            results['special_$env'] = 'FAIL: Special key not blocked';
          } catch (e) {
            if (e.toString().contains('special') ||
                e.toString().contains('reserved')) {
              passedTests++;
              results['special_$env'] = 'PASS';
            } else {
              results['special_$env'] = 'FAIL: Unexpected error: $e';
            }
          }
        } catch (e) {
          results['special_$env'] = 'ERROR: $e';
        }
      }

      // Test 9: Performance test (basic operations)
      for (final env in _availableEnvironments) {
        totalTests++;
        try {
          final stopwatch = Stopwatch()..start();

          // Perform 10 quick operations
          for (int i = 0; i < 10; i++) {
            final testKey = 'perf_test_$env\_$i';
            await PVCache.set('$env:$testKey', 'Performance test $i');
            await PVCache.get('$env:$testKey');
          }

          stopwatch.stop();
          final duration = stopwatch.elapsedMilliseconds;

          if (duration < 5000) {
            // Should complete within 5 seconds
            passedTests++;
            results['performance_$env'] = 'PASS (${duration}ms)';
          } else {
            results['performance_$env'] = 'FAIL: Too slow (${duration}ms)';
          }
        } catch (e) {
          results['performance_$env'] = 'ERROR: $e';
        }
      }

      // Test 10: ifNotCached functionality
      for (final env in _availableEnvironments) {
        totalTests++;
        try {
          final testKey = 'batch_test_if_not_cached_$env';
          final fullKey = '$env:$testKey';

          // Clear any existing value first
          await PVCache.delete(fullKey);

          // Simulate expensive operation counter
          int expensiveOperationCount = 0;

          // Define the expensive callback function
          Future<String> expensiveOperation() async {
            expensiveOperationCount++;
            // Simulate network delay or expensive computation
            await Future.delayed(const Duration(milliseconds: 100));
            return 'Batch test result #$expensiveOperationCount from $env';
          }

          // First call - should execute the callback and cache the result
          final firstResult = await PVCache.ifNotCached(
            fullKey,
            expensiveOperation,
            metadata: {
              'source': 'batch_test',
              'timestamp': DateTime.now().toIso8601String(),
            },
          );

          // Second call - should return cached value without executing callback
          final secondResult = await PVCache.ifNotCached(
            fullKey,
            expensiveOperation,
            metadata: {
              'source': 'batch_test',
              'timestamp': DateTime.now().toIso8601String(),
            },
          );

          // Third call - should return cached value without executing callback
          final thirdResult = await PVCache.ifNotCached(
            fullKey,
            expensiveOperation,
            metadata: {
              'source': 'batch_test',
              'timestamp': DateTime.now().toIso8601String(),
            },
          );

          // Verify results
          final allResultsMatch =
              firstResult == secondResult && secondResult == thirdResult;
          final callbackExecutedOnce = expensiveOperationCount == 1;

          if (allResultsMatch && callbackExecutedOnce) {
            passedTests++;
            results['if_not_cached_$env'] = 'PASS';
          } else {
            results['if_not_cached_$env'] =
                'FAIL: Callback executed $expensiveOperationCount times (expected 1)';
          }
        } catch (e) {
          results['if_not_cached_$env'] = 'ERROR: $e';
        }
      }

      // Test 11: ifNotCached with expiry (for environments that support it)
      for (final env in ['default', 'test']) {
        if (_availableEnvironments.contains(env)) {
          totalTests++;
          try {
            final testKey = 'batch_test_if_not_cached_expiry_$env';
            final fullKey = '$env:$testKey';

            // Clear any existing value
            await PVCache.delete(fullKey);

            int expiryOperationCount = 0;

            Future<String> expiryOperation() async {
              expiryOperationCount++;
              await Future.delayed(const Duration(milliseconds: 50));
              return 'Expiry batch test result #$expiryOperationCount';
            }

            // Set with 2 second expiry
            final expiryTime = DateTime.now().add(const Duration(seconds: 2));
            final expiryMetadata = {'expiry': expiryTime.toIso8601String()};

            // First call
            final expiryFirstResult = await PVCache.ifNotCached(
              fullKey,
              expiryOperation,
              metadata: expiryMetadata,
            );

            // Second call (should be cached)
            await PVCache.ifNotCached(
              fullKey,
              expiryOperation,
              metadata: expiryMetadata,
            );

            // Wait for expiry
            await Future.delayed(const Duration(seconds: 3));

            // Third call (should execute callback again due to expiry)
            final expiryThirdResult = await PVCache.ifNotCached(
              fullKey,
              expiryOperation,
              metadata: expiryMetadata,
            );

            final expiryCallbackExecutedTwice = expiryOperationCount == 2;
            final expiryResultsDifferent =
                expiryFirstResult != expiryThirdResult;

            if (expiryCallbackExecutedTwice && expiryResultsDifferent) {
              passedTests++;
              results['if_not_cached_expiry_$env'] = 'PASS';
            } else {
              results['if_not_cached_expiry_$env'] =
                  'FAIL: Callback executed $expiryOperationCount times (expected 2)';
            }
          } catch (e) {
            results['if_not_cached_expiry_$env'] = 'ERROR: $e';
          }
        }
      }

      // Generate summary
      final successRate = totalTests > 0
          ? (passedTests / totalTests * 100).toStringAsFixed(1)
          : '0.0';

      setState(() {
        _status =
            'Batch tests completed: $passedTests/$totalTests passed ($successRate%)';
        _lastResult =
            'BATCH TEST RESULTS:\n${results.entries.map((e) => '${e.key}: ${e.value}').join('\n')}';
      });
    } catch (e) {
      setState(() {
        _status = 'Error in batch tests: $e';
        _lastResult = 'BATCH TEST: Failed to run tests';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PV Cache Web Test'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.grid_view),
            tooltip: 'Advanced Fragment Example',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AdvancedFragmentExample(),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Status Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Status: $_status',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Last Result: $_lastResult',
                      style: const TextStyle(
                        fontSize: 14,
                        fontFamily: 'monospace',
                      ),
                    ),
                    if (!_isInitialized) ...[
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _initializeCache,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Retry Initialization'),
                      ),
                    ],
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Environment Info Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Environment Storage Types:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text('• default: SimpleExpiry (with expiry support)'),
                    const Text('• production: SimpleLRU (maxSize: 10)'),
                    const Text('• staging: SimpleLFU (maxSize: 8)'),
                    const Text('• test: SimpleExpiry (with expiry support)'),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Environment Selector
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Environment:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      value: _selectedEnvironment,
                      decoration: const InputDecoration(
                        labelText: 'Select Environment',
                        border: OutlineInputBorder(),
                      ),
                      items: _availableEnvironments.map((env) {
                        return DropdownMenuItem(value: env, child: Text(env));
                      }).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            _selectedEnvironment = value;
                            _status =
                                'Environment changed to: $_selectedEnvironment';
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Input Fields
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _keyController,
                    decoration: const InputDecoration(
                      labelText: 'Key',
                      border: OutlineInputBorder(),
                      hintText: 'Enter cache key',
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: _valueController,
                    decoration: const InputDecoration(
                      labelText: 'Value',
                      border: OutlineInputBorder(),
                      hintText: 'Enter cache value',
                    ),
                  ),
                ),
                if (_selectedEnvironment == 'default' ||
                    _selectedEnvironment == 'test') ...[
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: _expiryController,
                      decoration: const InputDecoration(
                        labelText: 'Expiry (seconds)',
                        border: OutlineInputBorder(),
                        hintText: 'Optional: seconds until expiry',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ],
            ),

            const SizedBox(height: 16),

            // Basic Operations
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _isInitialized ? _setValue : null,
                    child: const Text('SET'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _isInitialized ? _getValue : null,
                    child: const Text('GET'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _isInitialized ? _deleteValue : null,
                    child: const Text('DELETE'),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Test Operations
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _isInitialized ? _testExpiry : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Test Expiry'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _isInitialized ? _testLRU : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Test LRU'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _isInitialized ? _testLFU : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Test LFU'),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Additional Test Operations
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _isInitialized ? _testComplexData : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Test Complex Data'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _isInitialized
                        ? _testSpecialKeyProtection
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Test Special Keys'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _isInitialized ? _testCrossEnvironment : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Test Cross Env'),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // ifNotCached Test
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _isInitialized ? _testIfNotCached : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('🧠 Test ifNotCached'),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Cache Management
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _isInitialized ? _clearCache : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Clear All Cache'),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Automated Testing
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _isInitialized ? _runBatchTests : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('🚀 Run Batch Tests'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _keyController.dispose();
    _valueController.dispose();
    _expiryController.dispose();
    super.dispose();
  }
}
