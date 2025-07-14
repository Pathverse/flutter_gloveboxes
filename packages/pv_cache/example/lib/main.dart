import 'package:flutter/material.dart';
import 'package:pv_cache/lib.dart';

void main() {
  runApp(const CacheVisualTestApp());
}

class CacheVisualTestApp extends StatelessWidget {
  const CacheVisualTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PVCache Visual Test',
      home: const CacheVisualTestPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CacheVisualTestPage extends StatefulWidget {
  const CacheVisualTestPage({super.key});

  @override
  State<CacheVisualTestPage> createState() => _CacheVisualTestPageState();
}

class _CacheVisualTestPageState extends State<CacheVisualTestPage> {
  late PVCache cache;
  final keyController = TextEditingController();

  String? selectedPreset = '1. Normal';
  Map<String, dynamic> allEntries = {};
  String? lastAction;
  bool showAdvanced = false;

  // Preset configurations
  final Map<String, Map<String, dynamic>> presets = {
    '1. Normal': {
      'value': 'simple_text_value',
      'options': const CacheOptions(),
    },
    '2. Encrypted': {
      'value': 'secret_information',
      'options': const CacheOptions(encrypted: true),
    },
    '3. JSON': {
      'value': {'name': 'John', 'age': 30, 'city': 'New York'},
      'options': const CacheOptions(),
    },
    '4. Sensitive JSON': {
      'value': {
        'public': 'visible_data',
        'secret': 'hidden_data',
        'password': 'top_secret',
      },
      'options': const CacheOptions(
        sensitive: ['secret', 'password'],
        depends: 'master_key',
      ),
    },
    '5. LRU': {
      'value': 'lru_tracked_value',
      'options': const CacheOptions(lru: true, lruInCount: 0),
    },
    '6. Expiring (5s)': {
      'value': 'expires_in_5_seconds',
      'options': const CacheOptions(lifetime: 5),
    },
    '7. Key Expiry': {
      'value': {'data': 'will_expire_with_key'},
      'options': const CacheOptions(
        sensitive: ['data'],
        depends: 'expiring_master_key',
      ),
    },
  };

  @override
  void initState() {
    super.initState();
    _initCache();
  }

  Future<void> _initCache() async {
    cache = await PVCache.getInstance(debug: true);
    await _refreshEntries();
    debugPrint('🚀 Cache initialized successfully');
  }

  Future<void> _refreshEntries() async {
    final keys = await cache.getAllKeys();
    final map = <String, dynamic>{};
    for (final k in keys) {
      try {
        map[k] = await cache.getWithOptions(k);
      } catch (e) {
        map[k] = 'Error: $e';
      }
    }
    setState(() {
      allEntries = map;
    });
    debugPrint('📊 Cache entries refreshed: ${keys.length} keys found');
  }

  Future<void> _put() async {
    final key = keyController.text.trim();
    if (key.isEmpty || selectedPreset == null) return;

    try {
      final preset = presets[selectedPreset]!;
      final value = preset['value'];
      final options = preset['options'] as CacheOptions;

      // Auto-setup master key for sensitive presets
      if (options.depends == 'master_key') {
        await _setupDependencyKey();
      } else if (options.depends == 'expiring_master_key') {
        await _setupExpiringKey();
      }

      await cache.putWithOptions(key, value, options: options);

      debugPrint('✅ PUT: $key = $value');
      debugPrint('   Options: $options');
      if (options.depends != null) {
        debugPrint('   🔑 Auto-setup dependency: ${options.depends}');
      }

      setState(() {
        lastAction = 'Put $key with preset: $selectedPreset';
      });
      await _refreshEntries();
    } catch (e) {
      debugPrint('❌ PUT Error: $key -> $e');
      setState(() {
        lastAction = 'Error putting $key: $e';
      });
    }
  }

  Future<void> _get() async {
    final key = keyController.text.trim();
    if (key.isEmpty || selectedPreset == null) return;

    try {
      final preset = presets[selectedPreset]!;
      final options = preset['options'] as CacheOptions;

      // Auto-setup master key for sensitive presets if needed
      if (options.depends == 'master_key') {
        await _setupDependencyKey();
      } else if (options.depends == 'expiring_master_key') {
        await _setupExpiringKey();
      }

      final value = await cache.getWithOptions(key, options: options);

      debugPrint('📖 GET: $key = $value');
      debugPrint('   Options: $options');

      setState(() {
        lastAction = 'Get $key: $value';
      });
    } catch (e) {
      debugPrint('❌ GET Error: $key -> $e');
      setState(() {
        lastAction = 'Error getting $key: $e';
      });
    }
  }

  Future<void> _delete() async {
    final key = keyController.text.trim();
    if (key.isEmpty || selectedPreset == null) return;

    try {
      final preset = presets[selectedPreset]!;
      final options = preset['options'] as CacheOptions;

      await cache.deleteWithOptions(key, options: options);

      debugPrint('�️ DELETE: $key');
      debugPrint('   Options: $options');

      setState(() {
        lastAction = 'Deleted $key';
      });
      await _refreshEntries();
    } catch (e) {
      debugPrint('❌ DELETE Error: $key -> $e');
      setState(() {
        lastAction = 'Error deleting $key: $e';
      });
    }
  }

  Future<void> _clear() async {
    try {
      await cache.clear();
      debugPrint('🧹 CLEAR: All cache cleared');
      setState(() {
        lastAction = 'Cleared all cache';
      });
      await _refreshEntries();
    } catch (e) {
      debugPrint('❌ CLEAR Error: $e');
      setState(() {
        lastAction = 'Error clearing cache: $e';
      });
    }
  }

  Future<void> _setupDependencyKey() async {
    try {
      // Store a permanent master key
      const masterKey = 'master_key';
      final permanentKey =
          'permanent_key_${DateTime.now().millisecondsSinceEpoch}';
      await cache.putWithOptions(
        masterKey,
        permanentKey,
        options: const CacheOptions(encrypted: true),
      );

      debugPrint('🔑 SETUP: Permanent master key created');
      debugPrint('   Key: $masterKey = $permanentKey');

      setState(() {
        lastAction = 'Setup master key: $masterKey';
      });
    } catch (e) {
      debugPrint('❌ SETUP Error: $e');
      setState(() {
        lastAction = 'Error setting up master key: $e';
      });
    }
  }

  Future<void> _setupExpiringKey() async {
    try {
      // Store an expiring master key (3 seconds)
      const expiringKey = 'expiring_master_key';
      final temporaryKey = 'temp_key_${DateTime.now().millisecondsSinceEpoch}';
      await cache.putWithOptions(
        expiringKey,
        temporaryKey,
        options: const CacheOptions(encrypted: true, lifetime: 3),
      );

      debugPrint('⏰ SETUP: Expiring master key created (3s)');
      debugPrint('   Key: $expiringKey = $temporaryKey');

      setState(() {
        lastAction = 'Setup expiring key: $expiringKey (3s)';
      });
    } catch (e) {
      debugPrint('❌ SETUP Error: $e');
      setState(() {
        lastAction = 'Error setting up expiring key: $e';
      });
    }
  }

  Future<void> _runBehaviorTests() async {
    debugPrint('\n🧪 Running 7 Behavior Tests...');

    try {
      // Test 1: Normal value
      debugPrint('\n1️⃣ Test: Normal Value Storage');
      await cache.putWithOptions('test_normal', 'simple_value');
      final normal = await cache.getWithOptions('test_normal');
      debugPrint('   Result: $normal');

      // Test 2: Encrypted value
      debugPrint('\n2️⃣ Test: Encrypted Storage');
      await cache.putWithOptions(
        'test_encrypted',
        'secret_data',
        options: const CacheOptions(encrypted: true),
      );
      final encrypted = await cache.getWithOptions(
        'test_encrypted',
        options: const CacheOptions(encrypted: true),
      );
      debugPrint('   Result: $encrypted');

      // Test 3: JSON object
      debugPrint('\n3️⃣ Test: JSON Object Storage');
      final jsonData = {'name': 'Alice', 'age': 25, 'role': 'developer'};
      await cache.putWithOptions('test_json', jsonData);
      final json = await cache.getWithOptions('test_json');
      debugPrint('   Result: $json');

      // Test 4: JSON with sensitive fields
      debugPrint('\n4️⃣ Test: JSON with Sensitive Fields');
      await _setupDependencyKey(); // Setup master key first

      final sensitiveJson = {
        'username': 'alice123',
        'email': 'alice@example.com',
        'password': 'secret123',
        'apiKey': 'sensitive_api_key',
      };

      await cache.putWithOptions(
        'test_sensitive',
        sensitiveJson,
        options: const CacheOptions(
          sensitive: ['password', 'apiKey'],
          depends: 'master_key',
        ),
      );

      final sensitive = await cache.getWithOptions(
        'test_sensitive',
        options: const CacheOptions(
          sensitive: ['password', 'apiKey'],
          depends: 'master_key',
        ),
      );
      debugPrint('   Result: $sensitive');

      // Test 5: LRU tracking
      debugPrint('\n5️⃣ Test: LRU Tracking');
      await cache.putWithOptions(
        'test_lru',
        'lru_value',
        options: const CacheOptions(lru: true, lruInCount: 0),
      );
      // Access it multiple times to test tracking
      await cache.getWithOptions(
        'test_lru',
        options: const CacheOptions(lru: true, lruInCount: 0),
      );
      await cache.getWithOptions(
        'test_lru',
        options: const CacheOptions(lru: true, lruInCount: 0),
      );
      debugPrint('   LRU tracking enabled (accessed 3 times total)');

      // Test 6: Expiry of key-value
      debugPrint('\n6️⃣ Test: Key-Value Expiry (3s)');
      await cache.putWithOptions(
        'test_expiry',
        'will_expire_soon',
        options: const CacheOptions(lifetime: 3),
      );
      final beforeExpiry = await cache.getWithOptions('test_expiry');
      debugPrint('   Before expiry: $beforeExpiry');

      debugPrint('   Waiting 4 seconds for expiry...');
      await Future.delayed(const Duration(seconds: 4));

      final afterExpiry = await cache.getWithOptions('test_expiry');
      debugPrint('   After expiry: $afterExpiry (should be null)');

      // Test 7: Expiry caused by master key expiry
      debugPrint('\n7️⃣ Test: Sensitive Data Expiry via Master Key');
      await _setupExpiringKey(); // Setup expiring master key (3s)

      await cache.putWithOptions(
        'test_key_expiry',
        {'public': 'visible', 'secret': 'will_fail_when_key_expires'},
        options: const CacheOptions(
          sensitive: ['secret'],
          depends: 'expiring_master_key',
        ),
      );

      final beforeKeyExpiry = await cache.getWithOptions(
        'test_key_expiry',
        options: const CacheOptions(
          sensitive: ['secret'],
          depends: 'expiring_master_key',
        ),
      );
      debugPrint('   Before key expiry: $beforeKeyExpiry');

      debugPrint('   Waiting 4 seconds for master key expiry...');
      await Future.delayed(const Duration(seconds: 4));

      final afterKeyExpiry = await cache.getWithOptions(
        'test_key_expiry',
        options: const CacheOptions(
          sensitive: ['secret'],
          depends: 'expiring_master_key',
        ),
      );
      debugPrint(
        '   After key expiry: $afterKeyExpiry (should be null due to failed decryption)',
      );

      await _refreshEntries();
      setState(() {
        lastAction = 'All 7 behavior tests completed - check terminal';
      });
    } catch (e) {
      debugPrint('❌ Behavior test error: $e');
      setState(() {
        lastAction = 'Behavior test error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PV Cache Visual Test'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Key input and preset selector
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: TextField(
                    controller: keyController,
                    decoration: const InputDecoration(
                      labelText: 'Cache Key',
                      border: OutlineInputBorder(),
                      hintText: 'e.g., user123, profile, settings',
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  flex: 2,
                  child: DropdownButtonFormField<String>(
                    value: selectedPreset,
                    decoration: const InputDecoration(
                      labelText: 'Preset',
                      border: OutlineInputBorder(),
                    ),
                    isExpanded: true,
                    items: presets.keys.map((String preset) {
                      return DropdownMenuItem<String>(
                        value: preset,
                        child: Text(preset, overflow: TextOverflow.ellipsis),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedPreset = newValue;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Action buttons
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ElevatedButton.icon(
                  onPressed: _put,
                  icon: const Icon(Icons.save),
                  label: const Text('Put'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: _get,
                  icon: const Icon(Icons.search),
                  label: const Text('Get'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                ),
                ElevatedButton.icon(
                  onPressed: _delete,
                  icon: const Icon(Icons.delete),
                  label: const Text('Delete'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                ),
                ElevatedButton.icon(
                  onPressed: _clear,
                  icon: const Icon(Icons.clear_all),
                  label: const Text('Clear All'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: _setupDependencyKey,
                  icon: const Icon(Icons.key),
                  label: const Text('Setup Key'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: _runBehaviorTests,
                  icon: const Icon(Icons.science),
                  label: const Text('Run 7 Tests'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                ),
                ElevatedButton.icon(
                  onPressed: () => setState(() => showAdvanced = !showAdvanced),
                  icon: Icon(
                    showAdvanced ? Icons.visibility_off : Icons.visibility,
                  ),
                  label: Text(showAdvanced ? 'Hide Details' : 'Show Details'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Advanced preset details
            if (showAdvanced && selectedPreset != null) ...[
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Preset Details: $selectedPreset',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text('Value: ${presets[selectedPreset]!['value']}'),
                      Text('Options: ${presets[selectedPreset]!['options']}'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],

            // Last action display
            if (lastAction != null) ...[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Last Action:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(lastAction!),
                    const SizedBox(height: 4),
                    const Text(
                      'Check terminal/debug console for detailed output',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],

            // Cache entries display (keys only)
            const Text(
              'Cache Keys:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: allEntries.isEmpty
                    ? const Text(
                        'No cache entries found.',
                        style: TextStyle(color: Colors.grey),
                      )
                    : SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: allEntries.keys.map((key) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 2.0,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.key,
                                    size: 16,
                                    color: Colors.grey[600],
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      key,
                                      style: const TextStyle(
                                        fontFamily: 'monospace',
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.content_copy,
                                      size: 16,
                                    ),
                                    onPressed: () {
                                      keyController.text = key;
                                    },
                                    tooltip: 'Copy to key field',
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
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
