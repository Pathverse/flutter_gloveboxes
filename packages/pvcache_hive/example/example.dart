import 'package:flutter/material.dart';
import 'package:pvcache/pvcache.dart';
import 'package:pvcache_hive/templates/helper/basic.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PVCache Simple Demo',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const CacheDemo(),
    );
  }
}

class CacheDemo extends StatefulWidget {
  const CacheDemo({super.key});

  @override
  State<CacheDemo> createState() => _CacheDemoState();
}

class _CacheDemoState extends State<CacheDemo> {
  late PVCache userCache;
  String _results = 'Ready to test cache operations...';
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _initializeCache();
  }

  void _initializeCache() {
    userCache = PVCACHE.createStdHive(
      env: "user_cache",
      metaboxName: "user_meta",
    );
    _log('✅ Cache initialized successfully!');
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

  Future<void> _setUser() async {
    await _setLoading(true);
    try {
      final user = {
        'id': 'user_001',
        'name': 'Alice Johnson',
        'email': 'alice@example.com',
        'age': 28,
      };

      await userCache.set('user_001', user);
      _log('✅ Set user: ${user['name']}');
    } catch (e) {
      _log('❌ Error setting user: $e');
    } finally {
      await _setLoading(false);
    }
  }

  Future<void> _getUser() async {
    await _setLoading(true);
    try {
      final userData = await userCache.get('user_001');
      final userData2 = await userCache.get('user_002');
      _log('================');
      if (userData != null) {
        final user = userData as Map<String, dynamic>;
        _log('✅ Got user: ${user['name']} (${user['email']})');
      }
      if (userData2 != null) {
        final user = userData2 as Map<String, dynamic>;
        _log('✅ Got user: ${user['name']} (${user['email']})');
      }
    } catch (e) {
      _log('❌ Error getting user: $e');
    } finally {
      await _setLoading(false);
    }
  }

  Future<void> _deleteUser() async {
    await _setLoading(true);
    try {
      await userCache.delete('user_001');
      _log('✅ Deleted user');
    } catch (e) {
      _log('❌ Error deleting user: $e');
    } finally {
      await _setLoading(false);
    }
  }

  Future<void> _setUserWithExpiry() async {
    await _setLoading(true);
    try {
      final user = {
        'id': 'user_002',
        'name': 'Bob Smith',
        'email': 'bob@example.com',
        'age': 34,
      };

      await userCache.set('user_002', user, metadata: {'ttl': 10});
      _log('✅ Set user with 10-second expiry: ${user['name']}');
    } catch (e) {
      _log('❌ Error setting user with expiry: $e');
    } finally {
      await _setLoading(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PVCache Simple Demo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Control buttons
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: [
                ElevatedButton.icon(
                  onPressed: _isLoading ? null : _setUser,
                  icon: const Icon(Icons.person_add),
                  label: const Text('Set User'),
                ),
                ElevatedButton.icon(
                  onPressed: _isLoading ? null : _getUser,
                  icon: const Icon(Icons.person_search),
                  label: const Text('Get User'),
                ),
                ElevatedButton.icon(
                  onPressed: _isLoading ? null : _deleteUser,
                  icon: const Icon(Icons.person_remove),
                  label: const Text('Delete User'),
                ),
                ElevatedButton.icon(
                  onPressed: _isLoading ? null : _setUserWithExpiry,
                  icon: const Icon(Icons.timer),
                  label: const Text('Set User w/ Expiry'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange.shade100,
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
