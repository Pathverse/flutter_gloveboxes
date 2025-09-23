import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';
import 'package:pvcache/pvcache.dart';
import 'package:pvcache_hive/pvcache_hive.dart';
import 'package:pvcache_hive/src/hboxcore.dart' as hboxcore;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Create a 32-byte encryption key for HiveAesCipher
  final encryptionKey = Uint8List.fromList([
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31,
    32,
  ]);

  hboxcore.setHiveCipher(HiveAesCipher(encryptionKey));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PVCache Misc Data Demo',
      theme: ThemeData(primarySwatch: Colors.green, useMaterial3: true),
      home: const MiscCacheDemo(),
    );
  }
}

class MiscCacheDemo extends StatefulWidget {
  const MiscCacheDemo({super.key});

  @override
  State<MiscCacheDemo> createState() => _MiscCacheDemoState();
}

class _MiscCacheDemoState extends State<MiscCacheDemo> {
  late PVCache miscCache;
  String _results = 'Ready to test misc cache operations...';
  bool _isLoading = false;

  final TextEditingController _keyController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();
  final TextEditingController _ttlController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initializeCache();
  }

  @override
  void dispose() {
    _keyController.dispose();
    _valueController.dispose();
    _ttlController.dispose();
    super.dispose();
  }

  void _initializeCache() {
    miscCache = PVCACHE.createStdHive(
      env: "misc_cache",
      metaboxName: "misc_meta",
    );
    _log('✅ Misc cache initialized successfully!');
  }

  void _log(String message) {
    setState(() {
      _results = '$message\n\n$_results';
    });
  }

  Future<void> _setLoading(bool loading) async {
    setState(() {
      _isLoading = loading;
    });
  }

  Future<void> _setData() async {
    if (_keyController.text.isEmpty || _valueController.text.isEmpty) {
      _log('⚠️ Please enter both key and value');
      return;
    }

    await _setLoading(true);
    try {
      final key = _keyController.text.trim();
      final value = _valueController.text.trim();

      // Try to parse as different data types
      dynamic data;
      if (value.startsWith('{') && value.endsWith('}')) {
        // Try JSON object
        try {
          data = _parseJsonLike(value);
        } catch (e) {
          data = value; // Keep as string if parsing fails
        }
      } else if (value.startsWith('[') && value.endsWith(']')) {
        // Try JSON array
        try {
          data = _parseArrayLike(value);
        } catch (e) {
          data = value; // Keep as string if parsing fails
        }
      } else if (value.toLowerCase() == 'true' ||
          value.toLowerCase() == 'false') {
        data = value.toLowerCase() == 'true';
      } else if (double.tryParse(value) != null) {
        data = double.parse(value);
      } else {
        data = value;
      }

      Map<String, dynamic>? metadata;
      if (_ttlController.text.isNotEmpty) {
        final ttl = int.tryParse(_ttlController.text);
        if (ttl != null && ttl > 0) {
          metadata = {'ttl': ttl};
        }
      }

      if (metadata != null) {
        await miscCache.set(key, data, metadata: metadata);
      } else {
        await miscCache.set(key, data);
      }

      final ttlInfo = metadata != null ? ' (TTL: ${metadata['ttl']}s)' : '';
      _log('✅ Set "$key" = $data$ttlInfo');
      _log('   Type: ${data.runtimeType}');
    } catch (e) {
      _log('❌ Error setting data: $e');
    } finally {
      await _setLoading(false);
    }
  }

  Future<void> _getData() async {
    if (_keyController.text.isEmpty) {
      _log('⚠️ Please enter a key');
      return;
    }

    await _setLoading(true);
    try {
      final key = _keyController.text.trim();
      final data = await miscCache.get(key);

      if (data != null) {
        _log('✅ Got "$key" = $data');
        _log('   Type: ${data.runtimeType}');
      } else {
        _log('📭 No data found for key "$key"');
      }
    } catch (e) {
      _log('❌ Error getting data: $e');
    } finally {
      await _setLoading(false);
    }
  }

  Future<void> _deleteData() async {
    if (_keyController.text.isEmpty) {
      _log('⚠️ Please enter a key');
      return;
    }

    await _setLoading(true);
    try {
      final key = _keyController.text.trim();
      await miscCache.delete(key);
      _log('✅ Deleted "$key"');
    } catch (e) {
      _log('❌ Error deleting data: $e');
    } finally {
      await _setLoading(false);
    }
  }

  Future<void> _clearCache() async {
    await _setLoading(true);
    try {
      await miscCache.clear();
      _log('🧹 Cleared all cache data');
    } catch (e) {
      _log('❌ Error clearing cache: $e');
    } finally {
      await _setLoading(false);
    }
  }

  Future<void> _testRandomData() async {
    await _setLoading(true);
    try {
      _log('🎲 Testing various data types...');

      // String
      await miscCache.set('string_test', 'Hello World!');
      _log('✅ String: "Hello World!"');

      // Number
      await miscCache.set('number_test', 42.5);
      _log('✅ Number: 42.5');

      // Boolean
      await miscCache.set('bool_test', true);
      _log('✅ Boolean: true');

      // List
      await miscCache.set('list_test', ['apple', 'banana', 'cherry']);
      _log('✅ List: [apple, banana, cherry]');

      // bytes
      await miscCache.set('bytes_test', ByteData(4)..setUint32(0, 123456));
      _log('✅ Bytes: ByteData with 123456 at offset 0');

      // Map
      await miscCache.set('map_test', {
        'name': 'Test User',
        'score': 95,
        'active': true,
        'tags': ['flutter', 'dart'],
      });
      _log('✅ Map: Complex object with mixed types');

      // With expiry
      await miscCache.set(
        'expiry_test',
        'This expires in 5 seconds',
        metadata: {'ttl': 5},
      );
      _log('✅ Expiry: Data with 5-second TTL');

      _log('🎉 All test data stored successfully!');
    } catch (e) {
      _log('❌ Error testing random data: $e');
      rethrow;
    } finally {
      await _setLoading(false);
    }
  }

  // Simple JSON-like parser for demo purposes
  Map<String, dynamic> _parseJsonLike(String value) {
    // Very basic parsing - just for demo
    final content = value.substring(1, value.length - 1);
    final pairs = content.split(',');
    final result = <String, dynamic>{};

    for (final pair in pairs) {
      final parts = pair.split(':');
      if (parts.length == 2) {
        final key = parts[0].trim().replaceAll('"', '').replaceAll("'", '');
        final val = parts[1].trim().replaceAll('"', '').replaceAll("'", '');
        result[key] = val;
      }
    }
    return result;
  }

  List<String> _parseArrayLike(String value) {
    // Very basic parsing - just for demo
    final content = value.substring(1, value.length - 1);
    return content
        .split(',')
        .map((e) => e.trim().replaceAll('"', '').replaceAll("'", ''))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PVCache Misc Data Demo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Input fields
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _keyController,
                      decoration: const InputDecoration(
                        labelText: 'Key',
                        hintText: 'Enter cache key',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _valueController,
                      decoration: const InputDecoration(
                        labelText: 'Value',
                        hintText:
                            'Enter any data (string, number, {key:value}, [item1,item2])',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 3,
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _ttlController,
                      decoration: const InputDecoration(
                        labelText: 'TTL (seconds, optional)',
                        hintText: 'Leave empty for no expiry',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Control buttons
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: [
                ElevatedButton.icon(
                  onPressed: _isLoading ? null : _setData,
                  icon: const Icon(Icons.save),
                  label: const Text('Set Data'),
                ),
                ElevatedButton.icon(
                  onPressed: _isLoading ? null : _getData,
                  icon: const Icon(Icons.search),
                  label: const Text('Get Data'),
                ),
                ElevatedButton.icon(
                  onPressed: _isLoading ? null : _deleteData,
                  icon: const Icon(Icons.delete),
                  label: const Text('Delete Data'),
                ),
                ElevatedButton.icon(
                  onPressed: _isLoading ? null : _testRandomData,
                  icon: const Icon(Icons.science),
                  label: const Text('Test Random Data'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade100,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: _isLoading ? null : _clearCache,
                  icon: const Icon(Icons.clear_all),
                  label: const Text('Clear All'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade100,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (_isLoading) const LinearProgressIndicator(),
            const SizedBox(height: 16),

            // Results area
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey.shade50,
                ),
                child: SingleChildScrollView(
                  child: SelectableText(
                    _results,
                    style: const TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
