import 'package:flutter/material.dart';
import 'package:pv_cache/lib.dart';
import 'dart:math';

void main() {
  runApp(const CacheSimulatorApp());
}

class CacheSimulatorApp extends StatelessWidget {
  const CacheSimulatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PVCache API Simulator',
      home: const CacheSimulatorPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
    );
  }
}

class CacheSimulatorPage extends StatefulWidget {
  const CacheSimulatorPage({super.key});

  @override
  State<CacheSimulatorPage> createState() => _CacheSimulatorPageState();
}

class _CacheSimulatorPageState extends State<CacheSimulatorPage> {
  PVCache? cache;
  String statusMessage = 'Initializing cache...';
  bool isLoading = false;
  int operationCount = 0;

  final Random random = Random();

  @override
  void initState() {
    super.initState();
    _initCache();
  }

  Future<void> _initCache() async {
    cache = await PVCache.getInstance(debug: true);
    setState(() {
      statusMessage = 'Cache initialized - Ready for testing';
    });
  }

  Future<PVCache> _ensureCache() async {
    cache ??= await PVCache.getInstance(debug: true);
    return cache!;
  }

  void _updateStatus(String message) {
    setState(() {
      statusMessage = message;
      operationCount++;
    });
    debugPrint('📊 Operation #$operationCount: $message');
  }

  void _setLoading(bool loading) {
    setState(() {
      isLoading = loading;
    });
  }

  // ============ USER SESSION SIMULATION ============

  Future<void> _simulateUserLogin() async {
    _setLoading(true);
    try {
      final userId = 'user_${random.nextInt(1000)}';
      final sessionData = {
        'userId': userId,
        'username': 'user$userId',
        'email': '$userId@example.com',
        'loginTime': DateTime.now().toIso8601String(),
        'permissions': ['read', 'write', if (random.nextBool()) 'admin'],
        'preferences': {
          'theme': random.nextBool() ? 'dark' : 'light',
          'language': ['en', 'es', 'fr'][random.nextInt(3)],
          'notifications': random.nextBool(),
        },
      };

      await (await _ensureCache()).putWithOptions(
        'session_$userId',
        sessionData,
        options: const CacheOptions(
          group: 'user_sessions',
          lifetime: 3600, // 1 hour
        ),
      );

      _updateStatus('✅ User login cached: $userId (expires in 1h)');
    } catch (e) {
      _updateStatus('❌ Login simulation failed: $e');
    } finally {
      _setLoading(false);
    }
  }

  Future<void> _simulateUserLogout() async {
    _setLoading(true);
    try {
      final cacheInstance = await _ensureCache();

      // Look specifically in the user_sessions group where login data is stored
      final sessionOptions = const CacheOptions(group: 'user_sessions');
      final sessionKeys = await cacheInstance.getAllKeys(
        options: sessionOptions,
      );

      // Also check default box for any session keys
      final defaultKeys = await cacheInstance.getAllKeys();
      final defaultSessionKeys = defaultKeys
          .where((k) => k.startsWith('session_'))
          .toList();

      final allSessionKeys = [...sessionKeys, ...defaultSessionKeys];

      debugPrint('🔍 Session keys in user_sessions group: $sessionKeys');
      debugPrint('🔍 Session keys in default box: $defaultSessionKeys');
      debugPrint('🔍 All session keys found: $allSessionKeys');

      if (allSessionKeys.isNotEmpty) {
        final keyToRemove =
            allSessionKeys[random.nextInt(allSessionKeys.length)];

        // Determine which options to use for deletion
        final deleteOptions = sessionKeys.contains(keyToRemove)
            ? sessionOptions
            : null;

        await cacheInstance.deleteWithOptions(
          keyToRemove,
          options: deleteOptions,
        );
        _updateStatus('🚪 User logout: Removed $keyToRemove');
      } else {
        _updateStatus('ℹ️ No active sessions to logout');
      }
    } catch (e) {
      _updateStatus('❌ Logout simulation failed: $e');
    } finally {
      _setLoading(false);
    }
  }

  // ============ API RESPONSE CACHING ============

  Future<void> _simulateApiResponse() async {
    _setLoading(true);
    try {
      final endpoint = [
        'products',
        'users',
        'orders',
        'analytics',
      ][random.nextInt(4)];
      final page = random.nextInt(10) + 1;

      final mockApiResponse = {
        'status': 'success',
        'endpoint': '/api/$endpoint',
        'page': page,
        'data': List.generate(
          random.nextInt(50) + 10,
          (i) => {
            'id': i + 1 + (page - 1) * 20,
            'name': '$endpoint item ${i + 1}',
            'timestamp': DateTime.now().millisecondsSinceEpoch,
            'metadata': {
              'version': '1.${random.nextInt(10)}',
              'priority': ['low', 'medium', 'high'][random.nextInt(3)],
            },
          },
        ),
        'meta': {
          'total': random.nextInt(1000) + 100,
          'page': page,
          'perPage': 20,
          'cached': true,
          'cacheTime': DateTime.now().toIso8601String(),
        },
      };

      await (await _ensureCache()).putWithOptions(
        'api_${endpoint}_page_$page',
        mockApiResponse,
        options: const CacheOptions(
          group: 'api_cache',
          lifetime: 300, // 5 minutes
        ),
      );

      _updateStatus(
        '📡 API response cached: $endpoint page $page (expires in 5m)',
      );
    } catch (e) {
      _updateStatus('❌ API simulation failed: $e');
    } finally {
      _setLoading(false);
    }
  }

  Future<void> _simulateApiInvalidation() async {
    _setLoading(true);
    try {
      final cacheInstance = await _ensureCache();
      final keys = await cacheInstance.getAllKeys();
      final apiKeys = keys.where((k) => k.startsWith('api_')).toList();

      if (apiKeys.isNotEmpty) {
        // Invalidate random API cache entries
        final toInvalidate = apiKeys
            .take(random.nextInt(apiKeys.length) + 1)
            .toList();
        for (final key in toInvalidate) {
          await cacheInstance.deleteWithOptions(key);
        }
        _updateStatus(
          '🔄 API cache invalidated: ${toInvalidate.length} entries',
        );
      } else {
        _updateStatus('ℹ️ No API cache to invalidate');
      }
    } catch (e) {
      _updateStatus('❌ API invalidation failed: $e');
    } finally {
      _setLoading(false);
    }
  }

  // ============ ENCRYPTED DATA SIMULATION ============

  Future<void> _simulateSecureTokenStorage() async {
    _setLoading(true);
    try {
      final tokenType = ['access', 'refresh', 'api'][random.nextInt(3)];
      final token =
          'tok_${List.generate(32, (i) => '0123456789abcdef'[random.nextInt(16)]).join()}';

      await (await _ensureCache()).putWithOptions(
        '${tokenType}_token',
        token,
        options: CacheOptions(
          encrypted: true,
          group: 'secure_tokens',
          lifetime: tokenType == 'access' ? 900 : 3600, // 15m or 1h
        ),
      );

      _updateStatus('🔐 Secure token stored: $tokenType (encrypted)');
    } catch (e) {
      _updateStatus('❌ Token storage failed: $e');
    } finally {
      _setLoading(false);
    }
  }

  Future<void> _simulateCredentialStorage() async {
    _setLoading(true);
    try {
      // Setup master key if not exists
      await (await _ensureCache()).putWithOptions(
        'credential_master_key',
        'master_key_${DateTime.now().millisecondsSinceEpoch}',
        options: const CacheOptions(encrypted: true),
      );

      final serviceNames = ['database', 'smtp', 'payment', 'analytics'];
      final serviceName = serviceNames[random.nextInt(serviceNames.length)];

      final credentials = {
        'service': serviceName,
        'host': '$serviceName.example.com',
        'username': '${serviceName}_user',
        'password': 'super_secret_${random.nextInt(9999)}',
        'apiKey':
            'key_${List.generate(20, (i) => 'abcdefghijklmnopqrstuvwxyz0123456789'[random.nextInt(36)]).join()}',
        'metadata': {
          'created': DateTime.now().toIso8601String(),
          'environment': 'production',
        },
      };

      await (await _ensureCache()).putWithOptions(
        'credentials_$serviceName',
        credentials,
        options: const CacheOptions(
          sensitive: ['password', 'apiKey'],
          depends: 'credential_master_key',
          group: 'secure_credentials',
        ),
      );

      _updateStatus(
        '🔑 Service credentials stored: $serviceName (partial encryption)',
      );
    } catch (e) {
      _updateStatus('❌ Credential storage failed: $e');
    } finally {
      _setLoading(false);
    }
  }

  // ============ PERFORMANCE & STRESS TESTING ============

  Future<void> _simulateBulkDataLoad() async {
    _setLoading(true);
    try {
      final dataType = [
        'products',
        'users',
        'transactions',
        'logs',
      ][random.nextInt(4)];
      final count = random.nextInt(500) + 100;

      final futures = <Future>[];
      for (int i = 0; i < count; i++) {
        final entry = {
          'id': i,
          'type': dataType,
          'data': 'bulk_data_${dataType}_$i',
          'timestamp': DateTime.now().millisecondsSinceEpoch + i,
          'payload': List.generate(
            random.nextInt(10) + 1,
            (j) => 'item_${i}_$j',
          ),
        };

        futures.add(
          (await _ensureCache()).putWithOptions(
            'bulk_${dataType}_$i',
            entry,
            options: const CacheOptions(group: 'bulk_data'),
          ),
        );
      }

      await Future.wait(futures);
      _updateStatus('📦 Bulk data loaded: $count $dataType entries');
    } catch (e) {
      _updateStatus('❌ Bulk load failed: $e');
    } finally {
      _setLoading(false);
    }
  }

  Future<void> _simulateConcurrentOperations() async {
    _setLoading(true);
    try {
      final operations = random.nextInt(100) + 50;
      final futures = <Future>[];

      for (int i = 0; i < operations; i++) {
        switch (i % 4) {
          case 0: // Store
            futures.add(
              (await _ensureCache()).putWithOptions(
                'concurrent_$i',
                'value_$i',
              ),
            );
            break;
          case 1: // Store JSON
            futures.add(
              (await _ensureCache()).putWithOptions('concurrent_json_$i', {
                'index': i,
                'data': 'json_$i',
              }),
            );
            break;
          case 2: // Store with expiry
            futures.add(
              (await _ensureCache()).putWithOptions(
                'concurrent_exp_$i',
                'expiring_$i',
                options: const CacheOptions(lifetime: 60),
              ),
            );
            break;
          case 3: // Store encrypted
            futures.add(
              (await _ensureCache()).putWithOptions(
                'concurrent_enc_$i',
                'encrypted_$i',
                options: const CacheOptions(encrypted: true),
              ),
            );
            break;
        }
      }

      final stopwatch = Stopwatch()..start();
      await Future.wait(futures);
      stopwatch.stop();

      _updateStatus(
        '⚡ Concurrent ops: $operations operations in ${stopwatch.elapsedMilliseconds}ms',
      );
    } catch (e) {
      _updateStatus('❌ Concurrent operations failed: $e');
    } finally {
      _setLoading(false);
    }
  }

  // ============ EXPIRATION TESTING ============

  Future<void> _simulateQuickExpiry() async {
    _setLoading(true);
    try {
      final key = 'quick_expire_${DateTime.now().millisecondsSinceEpoch}';
      await (await _ensureCache()).putWithOptions(
        key,
        'This will expire in 3 seconds',
        options: const CacheOptions(lifetime: 3),
      );

      _updateStatus('⏰ Quick expiry set: $key (3 seconds)');

      // Schedule a check after expiry
      Future.delayed(const Duration(seconds: 4), () async {
        final result = await (await _ensureCache()).getWithOptions(key);
        _updateStatus(
          result == null
              ? '✅ Expiry confirmed: $key expired as expected'
              : '❌ Expiry failed: $key still exists',
        );
      });
    } catch (e) {
      _updateStatus('❌ Quick expiry failed: $e');
    } finally {
      _setLoading(false);
    }
  }

  Future<void> _simulateMasterKeyExpiry() async {
    _setLoading(true);
    try {
      // Create expiring master key
      final masterKey =
          'expiring_master_${DateTime.now().millisecondsSinceEpoch}';
      await (await _ensureCache()).putWithOptions(
        masterKey,
        'temporary_key',
        options: const CacheOptions(encrypted: true, lifetime: 5),
      );

      // Store dependent data
      final dependentKey =
          'dependent_data_${DateTime.now().millisecondsSinceEpoch}';
      await (await _ensureCache()).putWithOptions(
        dependentKey,
        {'public': 'visible_data', 'secret': 'will_fail_when_master_expires'},
        options: CacheOptions(sensitive: const ['secret'], depends: masterKey),
      );

      _updateStatus(
        '🔐 Master key expiry test: Key expires in 5s, dependent data will fail',
      );

      // Schedule check after expiry
      Future.delayed(const Duration(seconds: 6), () async {
        try {
          final result = await (await _ensureCache()).getWithOptions(
            dependentKey,
            options: CacheOptions(
              sensitive: const ['secret'],
              depends: masterKey,
            ),
          );
          _updateStatus(
            result == null
                ? '✅ Dependent data expired with master key'
                : '❌ Dependent data unexpectedly survived',
          );
        } catch (e) {
          _updateStatus('✅ Dependent data failed as expected: $e');
        }
      });
    } catch (e) {
      _updateStatus('❌ Master key expiry test failed: $e');
    } finally {
      _setLoading(false);
    }
  }

  // ============ LRU/LFU TESTING ============

  Future<void> _simulateLRUBehavior() async {
    _setLoading(true);
    try {
      const maxEntries = 50;
      const testEntries = 75; // More than max

      final options = CacheOptions(
        lru: true,
        lruInCount: maxEntries,
        group: 'lru_test',
      );

      // Fill beyond capacity
      for (int i = 0; i < testEntries; i++) {
        await (await _ensureCache()).putWithOptions(
          'lru_item_$i',
          'lru_data_$i',
          options: options,
        );

        // Access some older items to test LRU
        if (i > 30 && i % 10 == 0) {
          await (await _ensureCache()).getWithOptions(
            'lru_item_${i - 20}',
            options: options,
          );
        }
      }

      final keys = await (await _ensureCache()).getAllKeys();
      final lruKeys = keys.where((k) => k.startsWith('lru_item_')).length;

      _updateStatus(
        '🔄 LRU test: Created $testEntries, retained ~$lruKeys entries',
      );
    } catch (e) {
      _updateStatus('❌ LRU simulation failed: $e');
    } finally {
      _setLoading(false);
    }
  }

  // ============ CLEANUP & UTILITIES ============

  Future<void> _clearAllCache() async {
    _setLoading(true);
    try {
      await (await _ensureCache()).clear();
      _updateStatus('🧹 All cache cleared');
    } catch (e) {
      _updateStatus('❌ Clear failed: $e');
    } finally {
      _setLoading(false);
    }
  }

  Future<void> _showCacheStats() async {
    _setLoading(true);
    try {
      final cacheInstance = await _ensureCache();
      
      // Get keys from all collections
      final allKeys = await cacheInstance.getAllKeys(includeAllGroups: true);
      
      // Parse groups from prefixed keys
      final groups = <String, int>{};
      var defaultCount = 0;
      
      for (final key in allKeys) {
        if (key.startsWith('[') && key.contains(']')) {
          // Extract group name from [groupname]key format
          final endBracket = key.indexOf(']');
          final groupName = key.substring(1, endBracket);
          groups[groupName] = (groups[groupName] ?? 0) + 1;
        } else {
          defaultCount++;
        }
      }
      
      final groupStats = groups.entries
          .map((e) => '${e.key}: ${e.value}')
          .join(', ');
      
      final statsMessage = [
        'Total: ${allKeys.length} entries',
        if (defaultCount > 0) 'default: $defaultCount',
        if (groupStats.isNotEmpty) groupStats,
      ].join(' | ');
      
      _updateStatus('📊 Cache stats: $statsMessage');
    } catch (e) {
      _updateStatus('❌ Stats failed: $e');
    } finally {
      _setLoading(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PVCache API Simulator'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: _showCacheStats,
            icon: const Icon(Icons.info),
            tooltip: 'Cache Statistics',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status Display
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        isLoading ? Icons.hourglass_empty : Icons.check_circle,
                        color: isLoading ? Colors.orange : Colors.green,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Status:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(statusMessage),
                  if (operationCount > 0) ...[
                    const SizedBox(height: 4),
                    Text(
                      'Operations performed: $operationCount',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Simulation Categories
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCategorySection('👤 User Session Management', [
                      _buildSimulationButton(
                        'Simulate User Login',
                        'Create user session with preferences',
                        Icons.login,
                        Colors.green,
                        _simulateUserLogin,
                      ),
                      _buildSimulationButton(
                        'Simulate User Logout',
                        'Remove random user session',
                        Icons.logout,
                        Colors.orange,
                        _simulateUserLogout,
                      ),
                    ]),

                    _buildCategorySection('📡 API Response Caching', [
                      _buildSimulationButton(
                        'Cache API Response',
                        'Store paginated API data with 5min expiry',
                        Icons.api,
                        Colors.blue,
                        _simulateApiResponse,
                      ),
                      _buildSimulationButton(
                        'Invalidate API Cache',
                        'Clear stale API cache entries',
                        Icons.refresh,
                        Colors.indigo,
                        _simulateApiInvalidation,
                      ),
                    ]),

                    _buildCategorySection('🔐 Encrypted Data Storage', [
                      _buildSimulationButton(
                        'Store Security Tokens',
                        'Cache encrypted access/refresh tokens',
                        Icons.security,
                        Colors.purple,
                        _simulateSecureTokenStorage,
                      ),
                      _buildSimulationButton(
                        'Store Service Credentials',
                        'Partially encrypted service credentials',
                        Icons.vpn_key,
                        Colors.deepPurple,
                        _simulateCredentialStorage,
                      ),
                    ]),

                    _buildCategorySection('⚡ Performance & Stress Testing', [
                      _buildSimulationButton(
                        'Bulk Data Load',
                        'Load 100-600 entries rapidly',
                        Icons.storage,
                        Colors.teal,
                        _simulateBulkDataLoad,
                      ),
                      _buildSimulationButton(
                        'Concurrent Operations',
                        'Run 50-150 parallel operations',
                        Icons.speed,
                        Colors.cyan,
                        _simulateConcurrentOperations,
                      ),
                      _buildSimulationButton(
                        'LRU Cache Behavior',
                        'Test eviction with 75 items, 50 limit',
                        Icons.cached,
                        Colors.amber,
                        _simulateLRUBehavior,
                      ),
                    ]),

                    _buildCategorySection('⏰ Expiration Testing', [
                      _buildSimulationButton(
                        'Quick Expiry Test',
                        'Data expires in 3 seconds',
                        Icons.timer,
                        Colors.red,
                        _simulateQuickExpiry,
                      ),
                      _buildSimulationButton(
                        'Master Key Expiry',
                        'Dependent data fails when key expires',
                        Icons.timer_off,
                        Colors.pink,
                        _simulateMasterKeyExpiry,
                      ),
                    ]),

                    _buildCategorySection('🧹 Cache Management', [
                      _buildSimulationButton(
                        'Clear All Cache',
                        'Remove all cached data',
                        Icons.clear_all,
                        Colors.red[300]!,
                        _clearAllCache,
                      ),
                      _buildSimulationButton(
                        'Show Cache Stats',
                        'Display current cache statistics',
                        Icons.analytics,
                        Colors.grey,
                        _showCacheStats,
                      ),
                    ]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategorySection(String title, List<Widget> buttons) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ...buttons,
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildSimulationButton(
    String title,
    String description,
    IconData icon,
    Color color,
    Future<void> Function() onPressed,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.all(16),
            alignment: Alignment.centerLeft,
          ),
          child: Row(
            children: [
              Icon(icon),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
              if (isLoading)
                const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
