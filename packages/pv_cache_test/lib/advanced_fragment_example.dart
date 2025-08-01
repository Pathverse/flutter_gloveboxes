import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pv_cache/pv_cache.dart';

class AdvancedFragmentExample extends StatefulWidget {
  const AdvancedFragmentExample({super.key});

  @override
  State<AdvancedFragmentExample> createState() =>
      _AdvancedFragmentExampleState();
}

class _AdvancedFragmentExampleState extends State<AdvancedFragmentExample> {
  bool _cacheInitialized = false;
  String _status = 'Not initialized';
  Map<String, dynamic>? _lastResult;
  String _selectedKey = 'w';
  final List<String> _availableKeys = ['w', 'w1', 'w2', 'w3', 'smart'];
  bool _resolveFragments = true;

  @override
  void initState() {
    super.initState();
    _initializeCache();
  }

  Future<void> _initializeCache() async {
    try {
      setState(() => _status = 'Setting up advanced environment...');

      // Create fragment configurations with glob patterns and smart fragments
      final fragmentConfigs = [
        FragmentConfig(
          name: "w*", // Matches: w, w1, w2, w3, world, etc.
          path: "/",
          callback: _fetchWorldData,
          fragments: ["w*/w1", "w*/w2", "w*/w3"],
          smartFragments: [
            SmartFragment("w*", "world_{name}_{climate}"),
            SmartFragment("*/w*", "item_{name}_{id}"),
          ],
        ),
        FragmentConfig(
          name: "smart*",
          path: "/smart",
          callback: _fetchSmartFragmentData,
          smartFragments: [
            SmartFragment("x/x*", "in_{name}_id"),
            SmartFragment("users/*", "user_{id}_{name}"),
          ],
        ),
        FragmentConfig(name: "w1", path: "w*/w1", callback: _fetchWorld1Data),
        FragmentConfig(name: "w2", path: "w*/w2", callback: _fetchWorld2Data),
        FragmentConfig(name: "w3", path: "w*/w3", callback: _fetchWorld3Data),
      ];

      // Create and set up AdvancedFragment storage
      final advancedFragment = AdvancedFragment(
        fragmentConfigs: fragmentConfigs,
        defaultGet: true,
        defaultSet: true,
        defaultDelete: true,
      );

      // Set up environment FIRST
      await PVCache.setEnv('advanced', advancedFragment).timeout(
        const Duration(seconds: 5),
        onTimeout: () {
          throw TimeoutException('Timeout setting up advanced environment');
        },
      );

      setState(() => _status = 'Initializing cache...');

      // Then initialize the cache
      await PVCache.init().timeout(
        const Duration(seconds: 15),
        onTimeout: () {
          throw TimeoutException('Timeout initializing cache');
        },
      );

      _cacheInitialized = true;
      setState(() => _status = 'Ready - AdvancedFragment initialized');
    } catch (e) {
      setState(() => _status = 'Error: $e');
    }
  }

  // Mock API callbacks
  Future<Map<String, dynamic>> _fetchWorldData() async {
    debugPrint('📞 [Example] _fetchWorldData callback called');
    // Simulate API delay
    await Future.delayed(const Duration(milliseconds: 500));

    final data = {
      'w1': {
        'name': 'World 1',
        'population': 1000000,
        'climate': 'Tropical',
        'resources': ['Gold', 'Silver', 'Diamonds'],
        'description': 'A lush tropical world with abundant resources',
        'discovered': '2023-01-15',
      },
      'w2': {
        'name': 'World 2',
        'population': 2500000,
        'climate': 'Desert',
        'resources': ['Oil', 'Gas', 'Minerals'],
        'description': 'A harsh desert world rich in energy resources',
        'discovered': '2023-03-22',
      },
      'w3': {
        'name': 'World 3',
        'population': 500000,
        'climate': 'Arctic',
        'resources': ['Ice', 'Fish', 'Minerals'],
        'description': 'A frozen world with unique ice formations',
        'discovered': '2023-06-10',
      },
    };
    debugPrint('📞 [Example] _fetchWorldData returning: $data');
    return data;
  }

  Future<Map<String, dynamic>> _fetchWorld1Data() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return {
      'name': 'World 1 (Direct)',
      'population': 1000000,
      'climate': 'Tropical',
      'resources': ['Gold', 'Silver', 'Diamonds'],
      'special': 'Directly fetched from API',
    };
  }

  Future<Map<String, dynamic>> _fetchWorld2Data() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return {
      'name': 'World 2 (Direct)',
      'population': 2500000,
      'climate': 'Desert',
      'resources': ['Oil', 'Gas', 'Minerals'],
      'special': 'Directly fetched from API',
    };
  }

  Future<Map<String, dynamic>> _fetchWorld3Data() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return {
      'name': 'World 3 (Direct)',
      'population': 500000,
      'climate': 'Arctic',
      'resources': ['Ice', 'Fish', 'Minerals'],
      'special': 'Directly fetched from API',
    };
  }

  Future<Map<String, dynamic>> _fetchSmartFragmentData() async {
    debugPrint('📞 [Example] _fetchSmartFragmentData callback called');
    await Future.delayed(const Duration(milliseconds: 400));

    final data = {
      'x': {
        'x1': {'name': 'www', 'id': 3, 'type': 'website', 'status': 'active'},
        'x2': {'name': 'api', 'id': 5, 'type': 'service', 'status': 'pending'},
      },
      'users': {
        'user1': {'id': 101, 'name': 'alice', 'email': 'alice@example.com'},
        'user2': {'id': 102, 'name': 'bob', 'email': 'bob@example.com'},
      },
    };
    debugPrint('📞 [Example] _fetchSmartFragmentData returning: $data');
    return data;
  }

  Future<void> _getData() async {
    if (!_cacheInitialized) return;

    try {
      setState(() => _status = 'Fetching data for $_selectedKey...');

      // Use the advanced environment prefix
      final fullKey = 'advanced:$_selectedKey';
      debugPrint('🔍 [Example] Getting data for key: $fullKey');

      // If we want to control fragment resolution, we need to set metadata first
      if (!_resolveFragments) {
        // Get current data and store with fragment resolution disabled
        final currentData = await PVCache.get(fullKey);
        if (currentData != null) {
          await PVCache.set(
            fullKey,
            currentData,
            metadata: {'resolve_fragments': false},
          );
        }
      }

      final result = await PVCache.get(fullKey);
      debugPrint('🔍 [Example] PVCache.get returned: $result');

      setState(() {
        // Handle the type casting properly - convert LinkedMap to Map<String, dynamic>
        if (result is Map) {
          _lastResult = Map<String, dynamic>.from(result);
        } else {
          _lastResult = result as Map<String, dynamic>?;
        }
        _status =
            'Data retrieved for $fullKey (fragment resolution: $_resolveFragments)';
      });
    } catch (e) {
      debugPrint('❌ [Example] Error getting data: $e');
      setState(() => _status = 'Error fetching data: $e');
    }
  }

  Future<void> _clearCache() async {
    if (!_cacheInitialized) return;

    try {
      setState(() => _status = 'Clearing cache...');

      await PVCache.clear(env: 'advanced');

      setState(() {
        _lastResult = null;
        _status = 'Cache cleared for advanced environment';
      });
    } catch (e) {
      setState(() => _status = 'Error clearing cache: $e');
    }
  }

  Future<void> _testFragmentResolution() async {
    if (!_cacheInitialized) return;

    try {
      setState(() => _status = 'Testing fragment resolution...');

      // Clear cache first to ensure fresh test
      await PVCache.clear(env: 'advanced');

      // First get the main world data (should trigger callback and cache fragments)
      final worldData = await PVCache.get('advanced:w');

      // Then get individual fragments (should be resolved from cache)
      final w1Data = await PVCache.get('advanced:w1');
      final w2Data = await PVCache.get('advanced:w2');
      final w3Data = await PVCache.get('advanced:w3');

      setState(() {
        // Convert any LinkedMap results to proper Map<String, dynamic>
        Map<String, dynamic> convertResult(dynamic data) {
          if (data is Map) {
            return Map<String, dynamic>.from(data);
          }
          return data as Map<String, dynamic>? ?? {};
        }

        _lastResult = {
          'world_data': convertResult(worldData),
          'w1_direct': convertResult(w1Data),
          'w2_direct': convertResult(w2Data),
          'w3_direct': convertResult(w3Data),
        };
        _status =
            'Fragment resolution test completed - Check if world_data contains @fragment: references or resolved data';
      });
    } catch (e) {
      setState(() => _status = 'Error in fragment test: $e');
    }
  }

  Future<void> _testFragmentReassembly() async {
    if (!_cacheInitialized) return;

    try {
      setState(() => _status = 'Testing fragment reassembly...');

      // Clear cache first
      await PVCache.clear(env: 'advanced');

      // Step 1: Get world data with fragment resolution enabled (default)
      final worldDataWithResolution = await PVCache.get('advanced:w');

      // Step 2: Get world data with fragment resolution disabled
      await PVCache.set(
        'advanced:w',
        worldDataWithResolution,
        metadata: {'resolve_fragments': false},
      );
      final worldDataWithoutResolution = await PVCache.get('advanced:w');

      // Step 3: Get world data with fragment resolution re-enabled
      await PVCache.set(
        'advanced:w',
        worldDataWithoutResolution,
        metadata: {'resolve_fragments': true},
      );
      final worldDataReassembled = await PVCache.get('advanced:w');

      setState(() {
        Map<String, dynamic> convertResult(dynamic data) {
          if (data is Map) {
            return Map<String, dynamic>.from(data);
          }
          return data as Map<String, dynamic>? ?? {};
        }

        _lastResult = {
          'step1_with_resolution': convertResult(worldDataWithResolution),
          'step2_without_resolution': convertResult(worldDataWithoutResolution),
          'step3_reassembled': convertResult(worldDataReassembled),
          'comparison': {
            'step1_has_fragments': _containsFragmentReferences(
              worldDataWithResolution,
            ),
            'step2_has_fragments': _containsFragmentReferences(
              worldDataWithoutResolution,
            ),
            'step3_has_fragments': _containsFragmentReferences(
              worldDataReassembled,
            ),
          },
        };
        _status =
            'Fragment reassembly test completed - Compare the three steps to see fragment resolution in action';
      });
    } catch (e) {
      setState(() => _status = 'Error in fragment reassembly test: $e');
    }
  }

  bool _containsFragmentReferences(dynamic data) {
    if (data is Map) {
      for (final value in data.values) {
        if (value is String && value.startsWith('@fragment:')) {
          return true;
        }
      }
    }
    return false;
  }

  Future<void> _testManualFragmentControl() async {
    if (!_cacheInitialized) return;

    try {
      setState(() => _status = 'Testing manual fragment control...');

      // Clear cache first
      await PVCache.clear(env: 'advanced');

      // Step 1: Load world data normally (should resolve fragments)
      final worldData = await PVCache.get('advanced:w');

      // Step 2: Store with fragment resolution disabled
      await PVCache.set(
        'advanced:w',
        worldData,
        metadata: {'resolve_fragments': false},
      );

      // Step 3: Get data with fragments disabled (should show @fragment: references)
      final dataWithFragments = await PVCache.get('advanced:w');

      // Step 4: Get data with fragments enabled (should resolve references)
      await PVCache.set(
        'advanced:w',
        dataWithFragments,
        metadata: {'resolve_fragments': true},
      );
      final dataResolved = await PVCache.get('advanced:w');

      setState(() {
        Map<String, dynamic> convertResult(dynamic data) {
          if (data is Map) {
            return Map<String, dynamic>.from(data);
          }
          return data as Map<String, dynamic>? ?? {};
        }

        _lastResult = {
          'original_data': convertResult(worldData),
          'with_fragment_references': convertResult(dataWithFragments),
          'with_resolved_fragments': convertResult(dataResolved),
          'analysis': {
            'original_has_fragments': _containsFragmentReferences(worldData),
            'references_has_fragments': _containsFragmentReferences(
              dataWithFragments,
            ),
            'resolved_has_fragments': _containsFragmentReferences(dataResolved),
            'fragment_count': _countFragmentReferences(dataWithFragments),
          },
        };
        _status =
            'Manual fragment control test completed - See how metadata controls fragment resolution';
      });
    } catch (e) {
      setState(() => _status = 'Error in manual fragment control test: $e');
    }
  }

  Future<void> _testParentCallbackOnMissingFragment() async {
    if (!_cacheInitialized) return;

    try {
      setState(
        () => _status = 'Testing parent callback on missing fragment...',
      );

      // Clear cache first
      await PVCache.clear(env: 'advanced');

      // Step 1: Try to get a fragment directly (w1) without loading parent first
      // This should trigger the parent callback to load the world data
      final w1Data = await PVCache.get('advanced:w1');

      // Step 2: Try to get another fragment (w2) - should be cached now
      final w2Data = await PVCache.get('advanced:w2');

      // Step 3: Get the parent data to see if it was loaded
      final worldData = await PVCache.get('advanced:w');

      // Step 4: Try to get a fragment that doesn't exist
      final nonExistentData = await PVCache.get('advanced:non_existent');

      setState(() {
        Map<String, dynamic> convertResult(dynamic data) {
          if (data is Map) {
            return Map<String, dynamic>.from(data);
          }
          return data as Map<String, dynamic>? ?? {};
        }

        _lastResult = {
          'w1_direct_access': convertResult(w1Data),
          'w2_cached_access': convertResult(w2Data),
          'world_data_after_fragment_access': convertResult(worldData),
          'non_existent_fragment': convertResult(nonExistentData),
          'analysis': {
            'w1_has_data': w1Data != null,
            'w2_has_data': w2Data != null,
            'world_has_data': worldData != null,
            'non_existent_is_null': nonExistentData == null,
            'w1_is_direct_fetch':
                w1Data != null &&
                w1Data is Map &&
                w1Data.containsKey('special'),
            'w2_is_cached':
                w2Data != null &&
                w2Data is Map &&
                w2Data.containsKey('special'),
          },
        };
        _status =
            'Parent callback test completed - Check if accessing w1 directly triggered parent callback to load world data';
      });
    } catch (e) {
      setState(() => _status = 'Error in parent callback test: $e');
    }
  }

  Future<void> _testGlobPatternMatching() async {
    if (!_cacheInitialized) return;

    try {
      setState(() => _status = 'Testing glob pattern matching...');

      // Clear cache first
      await PVCache.clear(env: 'advanced');

      // Test various glob pattern matches
      final testKeys = [
        'w',
        'w1',
        'w2',
        'w3',
        'world',
        'world1',
        'non_existent',
      ];
      final results = <String, dynamic>{};

      for (final testKey in testKeys) {
        try {
          final data = await PVCache.get('advanced:$testKey');
          results[testKey] = {
            'found': data != null,
            'data_type': data.runtimeType.toString(),
            'has_fragments': data is Map && _containsFragmentReferences(data),
          };
        } catch (e) {
          results[testKey] = {'error': e.toString()};
        }
      }

      setState(() {
        _lastResult = {
          'glob_pattern_test': results,
          'analysis': {
            'w_matches_w*': results['w']?['found'] == true,
            'w1_matches_w*': results['w1']?['found'] == true,
            'world_matches_w*': results['world']?['found'] == true,
            'non_existent_returns_null':
                results['non_existent']?['found'] == false,
            'pattern_matching_working':
                results['w']?['found'] == true &&
                results['w1']?['found'] == true &&
                results['world']?['found'] == true,
          },
        };
        _status =
            'Glob pattern test completed - Check how different keys match the "w*" pattern';
      });
    } catch (e) {
      setState(() => _status = 'Error in glob pattern test: $e');
    }
  }

  Future<void> _testSmartFragments() async {
    if (!_cacheInitialized) return;

    try {
      setState(() => _status = 'Testing smart fragments...');

      // Clear cache first
      await PVCache.clear(env: 'advanced');

      

      // Step 1: Load smart fragment data (triggers callback and creates smart fragments)
      final smartData = await PVCache.get('advanced:smart');

      PVCache.iterEnvKeys('advanced').then((keys) {
        debugPrint('🔍 [Example] Keys in advanced environment: $keys');
      });

      // Step 2: Try to access the generated smart fragment keys directly
      final smartFragmentKeys = [
        'in_www_3', // Generated from SmartFragment("x/x*", "in_{name}_id") for x1
        'in_api_5', // Generated from SmartFragment("x/x*", "in_{name}_id") for x2
        'user_101_alice', // Generated from SmartFragment("users/*", "user_{id}_{name}") for user1
        'user_102_bob', // Generated from SmartFragment("users/*", "user_{id}_{name}") for user2
      ];

      final smartFragmentResults = <String, dynamic>{};
      for (final key in smartFragmentKeys) {
        try {
          final data = await PVCache.get('advanced:$key');
          smartFragmentResults[key] = {'found': data != null, 'data': data};
        } catch (e) {
          smartFragmentResults[key] = {'error': e.toString()};
        }
      }

      setState(() {
        Map<String, dynamic> convertResult(dynamic data) {
          if (data is Map) {
            return Map<String, dynamic>.from(data);
          }
          return data as Map<String, dynamic>? ?? {};
        }

        _lastResult = {
          'smart_data_structure': convertResult(smartData),
          'smart_fragment_access': smartFragmentResults,
          'analysis': {
            'smart_data_loaded': smartData != null,
            'has_fragment_references':
                smartData is Map && _containsFragmentReferences(smartData),
            'smart_fragments_accessible': smartFragmentResults.values.every(
              (result) => result['found'] == true,
            ),
            'generated_keys_count': smartFragmentKeys.length,
            'successful_access_count': smartFragmentResults.values
                .where((result) => result['found'] == true)
                .length,
          },
        };
        _status =
            'Smart fragment test completed - Check how data generates dynamic cache keys';
      });
    } catch (e) {
      setState(() => _status = 'Error in smart fragment test: $e');
    }
  }

  int _countFragmentReferences(dynamic data) {
    int count = 0;
    if (data is Map) {
      for (final value in data.values) {
        if (value is String && value.startsWith('@fragment:')) {
          count++;
        }
      }
    }
    return count;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AdvancedFragment Example'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Status:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(_status),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Controls
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Controls:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Key selector
                    Row(
                      children: [
                        const Text('Select Key: '),
                        const SizedBox(width: 8),
                        DropdownButton<String>(
                          value: _selectedKey,
                          items: _availableKeys.map((key) {
                            return DropdownMenuItem(
                              value: key,
                              child: Text(key),
                            );
                          }).toList(),
                          onChanged: (value) {
                            if (value != null) {
                              setState(() => _selectedKey = value);
                            }
                          },
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Fragment resolution toggle
                    Row(
                      children: [
                        const Text('Fragment Resolution: '),
                        const SizedBox(width: 8),
                        Switch(
                          value: _resolveFragments,
                          onChanged: (value) {
                            setState(() => _resolveFragments = value);
                          },
                        ),
                        Text(_resolveFragments ? 'Enabled' : 'Disabled'),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Action buttons
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: _cacheInitialized ? _getData : null,
                          child: const Text('Get Data'),
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: _cacheInitialized ? _clearCache : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                          ),
                          child: const Text('Clear Cache'),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Test buttons
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: _cacheInitialized
                                ? _testFragmentResolution
                                : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              foregroundColor: Colors.white,
                            ),
                            child: const Text('Test Fragment Resolution'),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: _cacheInitialized
                                ? _testFragmentReassembly
                                : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                            ),
                            child: const Text('🧩 Test Fragment Reassembly'),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: _cacheInitialized
                                ? _testManualFragmentControl
                                : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purple,
                              foregroundColor: Colors.white,
                            ),
                            child: const Text(
                              '⚙️ Test Manual Fragment Control',
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: _cacheInitialized
                                ? _testParentCallbackOnMissingFragment
                                : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal,
                              foregroundColor: Colors.white,
                            ),
                            child: const Text(
                              '🔗 Test Parent Callback on Missing Fragment',
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: _cacheInitialized
                                ? _testGlobPatternMatching
                                : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.indigo,
                              foregroundColor: Colors.white,
                            ),
                            child: const Text('🌟 Test Glob Pattern Matching'),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: _cacheInitialized
                                ? _testSmartFragments
                                : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.cyan,
                              foregroundColor: Colors.white,
                            ),
                            child: const Text('🧠 Test Smart Fragments'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Results
            if (_lastResult != null) ...[
              Expanded(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Results:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Text(
                              _formatJson(_lastResult!),
                              style: const TextStyle(fontFamily: 'monospace'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  String _formatJson(Map<String, dynamic> data) {
    const encoder = JsonEncoder.withIndent('  ');
    return encoder.convert(data);
  }
}

// Simple JSON encoder for pretty printing
class JsonEncoder {
  final String indent;
  const JsonEncoder.withIndent(this.indent);

  String convert(dynamic obj) {
    return _convert(obj, 0);
  }

  String _convert(dynamic obj, int depth) {
    final currentIndent = indent * depth;
    final nextIndent = indent * (depth + 1);

    if (obj is Map) {
      if (obj.isEmpty) return '{}';

      final entries = obj.entries
          .map((entry) {
            final key = entry.key.toString();
            final value = _convert(entry.value, depth + 1);
            return '$nextIndent"$key": $value';
          })
          .join(',\n');

      return '{\n$entries\n$currentIndent}';
    } else if (obj is List) {
      if (obj.isEmpty) return '[]';

      final items = obj
          .map((item) => _convert(item, depth + 1))
          .join(',\n$nextIndent');
      return '[\n$nextIndent$items\n$currentIndent]';
    } else if (obj is String) {
      return '"$obj"';
    } else {
      return obj.toString();
    }
  }
}
