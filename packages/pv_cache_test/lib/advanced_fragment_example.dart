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
  final List<String> _availableKeys = ['w', 'w1', 'w2', 'w3'];

  @override
  void initState() {
    super.initState();
    _initializeCache();
  }

  Future<void> _initializeCache() async {
    try {
      setState(() => _status = 'Setting up advanced environment...');

      // Create fragment configurations
      final fragmentConfigs = [
        FragmentConfig(
          name: "w",
          path: "/",
          callback: _fetchWorldData,
          fragments: ["w/w1", "w/w2", "w/w3"],
        ),
        FragmentConfig(name: "w1", path: "w/w1", callback: _fetchWorld1Data),
        FragmentConfig(name: "w2", path: "w/w2", callback: _fetchWorld2Data),
        FragmentConfig(name: "w3", path: "w/w3", callback: _fetchWorld3Data),
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
    debugPrint('[Example] _fetchWorldData callback called');
    // Simulate API delay
    await Future.delayed(const Duration(milliseconds: 500));

    final data = {
      'w1': {
        'name': 'World 1',
        'population': 1000000,
        'climate': 'Tropical',
        'resources': ['Gold', 'Silver', 'Diamonds'],
      },
      'w2': {
        'name': 'World 2',
        'population': 2500000,
        'climate': 'Desert',
        'resources': ['Oil', 'Gas', 'Minerals'],
      },
      'w3': {
        'name': 'World 3',
        'population': 500000,
        'climate': 'Arctic',
        'resources': ['Ice', 'Fish', 'Minerals'],
      },
    };
    debugPrint('[Example] _fetchWorldData returning: $data');
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

  Future<void> _getData() async {
    if (!_cacheInitialized) return;

    try {
      setState(() => _status = 'Fetching data for $_selectedKey...');

      // Use the advanced environment prefix
      final fullKey = 'advanced:$_selectedKey';
      debugPrint('[Example] Getting data for key: $fullKey');

      final result = await PVCache.get(fullKey);
      debugPrint('[Example] PVCache.get returned: $result');

      setState(() {
        _lastResult = result as Map<String, dynamic>?;
        _status = 'Data retrieved for $fullKey';
      });
    } catch (e) {
      debugPrint('[Example] Error getting data: $e');
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

      // First get the main world data (should trigger callback and cache fragments)
      final worldData = await PVCache.get('advanced:w');

      // Then get individual fragments (should be resolved from cache)
      final w1Data = await PVCache.get('advanced:w1');
      final w2Data = await PVCache.get('advanced:w2');
      final w3Data = await PVCache.get('advanced:w3');

      setState(() {
        _lastResult = {
          'world_data': worldData,
          'w1_direct': w1Data,
          'w2_direct': w2Data,
          'w3_direct': w3Data,
        };
        _status = 'Fragment resolution test completed';
      });
    } catch (e) {
      setState(() => _status = 'Error in fragment test: $e');
    }
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

                    // Action buttons
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: _cacheInitialized ? _getData : null,
                          child: const Text('Get Data'),
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: _cacheInitialized
                              ? _testFragmentResolution
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            foregroundColor: Colors.white,
                          ),
                          child: const Text('Test Fragment Resolution'),
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
