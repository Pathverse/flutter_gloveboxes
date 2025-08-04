// ignore_for_file: avoid_print

import 'package:pvcache/pvcache.dart';

/// Tests basic PVCache operations across different environments
class BasicOperationsTest {
  /// Test all basic PVCache operations
  static Future<void> runAll() async {
    print('💾 Testing PVCache operations...');
    print('   📝 Testing new env:key API...');

    try {
      await _testKVEnvironment();
      await _testEncryptedEnvironment();
      await _testCustomEnvironments();
      await _testSecureEnvironment();
      await _testDeleteOperations();
      await _testExpiryFunctionality();

      print('   🎉 All PVCache operations completed successfully!');
    } catch (e) {
      print('     ❌ Error in PVCache operations: $e');
      rethrow;
    }
  }

  /// Test KV environment (default, string only)
  static Future<void> _testKVEnvironment() async {
    print('\n   Testing KV environment...');

    await PVCache.set('username', 'john_doe');
    await PVCache.set('kv:app_version', '1.0.0');
    await PVCache.set('kv:last_login', DateTime.now().toIso8601String());

    final username = await PVCache.get('username'); // Uses default env (kv)
    final appVersion = await PVCache.get('kv:app_version');
    final lastLogin = await PVCache.get('kv:last_login');

    print('     ✅ Username: $username');
    print('     ✅ App Version: $appVersion');
    print('     ✅ Last Login: $lastLogin');
  }

  /// Test encrypted environment
  static Future<void> _testEncryptedEnvironment() async {
    print('\n   🔒 Testing Encrypted environment...');

    await PVCache.set('encrypted:secret_key', 'super_secret_password');
    await PVCache.set(
      'encrypted:api_token',
      'abc123def456',
      metadata: {
        'expiry': DateTime.now().add(Duration(hours: 1)).millisecondsSinceEpoch,
        'source': 'oauth_server',
      },
    );

    final secretKey = await PVCache.get('encrypted:secret_key');
    final apiToken = await PVCache.get('encrypted:api_token');

    print('     ✅ Secret Key: $secretKey');
    print('     ✅ API Token: $apiToken');
  }

  /// Test custom environments with metadata
  static Future<void> _testCustomEnvironments() async {
    // Test user environment
    print('\n   Testing User environment...');
    await PVCache.set(
      'user:profile',
      {'name': 'John Doe', 'age': 30},
      metadata: {
        'updated_at': DateTime.now().millisecondsSinceEpoch,
        'version': 1,
      },
    );
    await PVCache.set('user:preferences', {
      'theme': 'dark',
      'notifications': true,
    });

    final userProfile = await PVCache.get('user:profile');
    final userPrefs = await PVCache.get('user:preferences');
    final profileMeta = await PVCache.getMeta('user:profile');

    print('     ✅ User Profile: $userProfile');
    print('     ✅ User Preferences: $userPrefs');
    print('     ✅ Profile Metadata: $profileMeta');

    // Test cache environment
    print('\n   ⚡ Testing Cache environment...');
    await PVCache.set('cache:api_response', {
      'data': 'cached_data',
      'status': 'success',
    });
    await PVCache.set(
      'cache:temp_data',
      'temporary value',
      metadata: {
        'expiry': DateTime.now()
            .add(Duration(seconds: 5))
            .millisecondsSinceEpoch,
      },
    );

    final apiResponse = await PVCache.get('cache:api_response');
    final tempData = await PVCache.get('cache:temp_data');

    print('     ✅ API Response: $apiResponse');
    print('     ✅ Temp Data: $tempData');
  }

  /// Test secure environment
  static Future<void> _testSecureEnvironment() async {
    print('\n   🛡️ Testing Secure environment...');

    await PVCache.set('secure:sensitive_data', {
      'ssn': '123-45-6789',
      'credit_card': '1234-5678-9012-3456',
    });
    await PVCache.set('secure:personal_notes', 'This is a private note');

    final sensitiveData = await PVCache.get('secure:sensitive_data');
    final personalNotes = await PVCache.get('secure:personal_notes');

    print('     ✅ Sensitive Data: $sensitiveData');
    print('     ✅ Personal Notes: $personalNotes');
  }

  /// Test delete operations
  static Future<void> _testDeleteOperations() async {
    print('\n   🗑️ Testing Delete operations...');

    await PVCache.set('kv:temp_key', 'delete_me');
    print('     ✅ Set temp_key: ${await PVCache.get('kv:temp_key')}');

    await PVCache.delete('kv:temp_key');
    final deletedValue = await PVCache.get('kv:temp_key');
    print('     ✅ After deletion: $deletedValue');
  }

  /// Test expiry functionality
  static Future<void> _testExpiryFunctionality() async {
    print('\n   ⏰ Testing Expiry functionality...');
    print('     ⏳ Waiting 6 seconds for temp_data to expire...');
    await Future.delayed(Duration(seconds: 6));

    try {
      final expiredData = await PVCache.get('cache:temp_data');
      print('     ❌ Unexpectedly got expired data: $expiredData');
    } catch (e) {
      print('     ✅ Expiry working correctly: $e');
    }
  }
}
