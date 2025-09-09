// ignore_for_file: avoid_print

import 'package:pvcacher/pvcacher.dart';
import 'package:pvcacher/templates/cache/encrypted/encrypted.dart';
import 'package:pvcacher/templates/cache/std/std.dart';
import 'package:pvcacher/templates/adapters/debug.dart';
import 'package:pvcacher/templates/adapters/expired.dart';

Future<void> main() async {
  print('=== PVCacher Template Examples ===\n');

  // Initialize ALL cache instances at the top
  // Static interface registrations
  PVCACHER.register('std_cache', handle: StdHandler());
  PVCACHER.register('secure_cache', handle: EncryptedHandler());
  PVCACHER.alias('std', 'std_cache');
  PVCACHER.alias('secure', 'secure_cache');

  // Direct instances
  final stdCache = createStd(
    namespace: 'direct_std',
    adapters: [DebugAdapter()],
  );
  final encryptedCache = createEncrypted(
    namespace: 'direct_encrypted',
    adapters: [DebugAdapter()],
  );
  final expiryCache = createStd(
    namespace: 'expiry_test',
    adapters: [VerboseExpiredAdapter(), DebugAdapter()],
  );

  // Initialize direct instances first (this registers their namespaces)
  await stdCache.init();
  await encryptedCache.init();
  await expiryCache.init();

  // Then initialize static interface
  await PVCACHER.initAll();

  print('✅ All caches initialized\n');

  await demonstrateStaticInterface();
  print('\n' + '=' * 50 + '\n');
  await demonstrateDirectInstances(stdCache, encryptedCache);
  print('\n' + '=' * 50 + '\n');
  await demonstrateExpiryAdapter(expiryCache);
  print('\n' + '=' * 50 + '\n');
  await demonstrateErrorHandling();
}

/// Demonstrates both templates using the static PVCACHER interface
Future<void> demonstrateStaticInterface() async {
  print('📱 STATIC INTERFACE EXAMPLES');
  print('-' * 30);

  print('✅ Registered caches: ${PVCACHER.getRegisteredNamespaces()}');
  print('✅ Available aliases: ${PVCACHER.aliases}');

  // Test Standard Handler operations
  print('🗄️  STANDARD HANDLER OPERATIONS:');

  // Set with metadata options (StdHandler supports this)
  await PVCACHER.set(
    'std:user_profile',
    {'name': 'John Doe', 'email': 'john@example.com', 'age': 30},
    options: {
      'priority': 'high',
      'category': 'user_data',
      'expires': DateTime.now().add(Duration(hours: 24)).toIso8601String(),
    },
  );
  print('✅ Set user profile with metadata options');

  // Get the value
  final userProfile = await PVCACHER.get('std:user_profile');
  print('📖 Retrieved user profile: $userProfile');

  // Check if exists
  final hasProfile = await PVCACHER.has('std:user_profile');
  print('🔍 Profile exists: $hasProfile');

  // Test cache-or-compute pattern
  final expensiveResult = await PVCACHER.ifNotCached(
    'std:expensive_calc',
    () async {
      print('💭 Computing expensive calculation...');
      await Future.delayed(Duration(milliseconds: 100)); // Simulate work
      return {'result': 42, 'computed_at': DateTime.now().toIso8601String()};
    },
  );
  print('🧮 Expensive result: $expensiveResult');

  // Second call should return cached value
  final cachedResult = await PVCACHER.ifNotCached(
    'std:expensive_calc',
    () async {
      print('💭 This should not print - value is cached');
      return {'result': 0};
    },
  );
  print('⚡ Cached result (no computation): $cachedResult\n');

  // Test Encrypted Handler operations
  print('🔐 ENCRYPTED HANDLER OPERATIONS:');

  // Set sensitive data (no options supported)
  await PVCACHER.set('secure:api_token', 'super-secret-api-key-12345');
  print('✅ Set encrypted API token');

  // Get encrypted data
  final apiToken = await PVCACHER.get('secure:api_token');
  print('🔓 Retrieved API token: $apiToken');

  // Test complex data encryption
  await PVCACHER.set('secure:sensitive_data', {
    'ssn': '123-45-6789',
    'credit_card': '1234-5678-9012-3456',
    'password': 'my-super-secret-password',
  });
  print('✅ Set complex sensitive data');

  final sensitiveData = await PVCACHER.get('secure:sensitive_data');
  print('🔓 Retrieved sensitive data: $sensitiveData');

  // Check encrypted data existence
  final hasToken = await PVCACHER.has('secure:api_token');
  print('🔍 API token exists: $hasToken');

  // Test removal
  await PVCACHER.remove('secure:api_token');
  final tokenAfterRemoval = await PVCACHER.get('secure:api_token');
  print('🗑️  After removal, token value: $tokenAfterRemoval');
}

/// Demonstrates both templates using direct PVCacher instances
Future<void> demonstrateDirectInstances(
  PVCacher stdCache,
  PVCacher encryptedCache,
) async {
  print('🎯 DIRECT INSTANCE EXAMPLES');
  print('-' * 30);

  print('✅ Direct instances ready\n');

  // Standard cache with rich options
  print('🗄️  DIRECT STANDARD CACHE:');

  await stdCache.set(
    'complex_object',
    {
      'users': [
        {'id': 1, 'name': 'Alice'},
        {'id': 2, 'name': 'Bob'},
      ],
      'settings': {'theme': 'dark', 'notifications': true},
      'metadata': {
        'version': '1.0.0',
        'created': DateTime.now().toIso8601String(),
      },
    },
    options: {'importance': 'critical', 'backup': true, 'compress': false},
  );

  final complexData = await stdCache.get('complex_object');
  print('📖 Complex object: $complexData');

  // Test all basic operations
  await stdCache.set('test_key', 'test_value');
  print('✅ Set: test_key = test_value');

  final testValue = await stdCache.get('test_key');
  print('📖 Get: test_key = $testValue');

  final exists = await stdCache.has('test_key');
  print('🔍 Has: test_key = $exists');

  await stdCache.remove('test_key');
  final afterRemoval = await stdCache.get('test_key');
  print('🗑️  After removal: test_key = $afterRemoval\n');

  // Encrypted cache operations
  print('🔐 DIRECT ENCRYPTED CACHE:');

  // Test various data types
  await encryptedCache.set('string_data', 'Hello, encrypted world!');
  await encryptedCache.set('number_data', 123456);
  await encryptedCache.set('bool_data', true);
  await encryptedCache.set('list_data', [1, 2, 3, 'encrypted', true]);
  await encryptedCache.set('map_data', {
    'encrypted': true,
    'secure': 'very',
    'data': ['private', 'confidential'],
  });

  print('✅ Set various encrypted data types');

  // Retrieve all encrypted data
  final stringData = await encryptedCache.get('string_data');
  final numberData = await encryptedCache.get('number_data');
  final boolData = await encryptedCache.get('bool_data');
  final listData = await encryptedCache.get('list_data');
  final mapData = await encryptedCache.get('map_data');

  print('🔓 String data: $stringData');
  print('🔓 Number data: $numberData');
  print('🔓 Bool data: $boolData');
  print('🔓 List data: $listData');
  print('🔓 Map data: $mapData');

  // Test clear operation
  await encryptedCache.clear();
  final afterClear = await encryptedCache.has('string_data');
  print('🧹 After clear, string_data exists: $afterClear');
}

/// Demonstrates error handling and edge cases
Future<void> demonstrateErrorHandling() async {
  print('⚠️  ERROR HANDLING EXAMPLES');
  print('-' * 30);

  final encryptedCache = createEncrypted(namespace: 'error_test');
  await encryptedCache.init();

  // Test encrypted cache options restriction
  try {
    await encryptedCache.set('test', 'value', options: {'not': 'allowed'});
    print('❌ This should not print - options should be rejected');
  } catch (e) {
    print('✅ Expected error for encrypted options: ${e.toString()}');
  }

  // Test static interface error handling
  try {
    await PVCACHER.get('nonexistent:key');
    print('❌ This should not print - namespace should not exist');
  } catch (e) {
    print('✅ Expected error for unknown namespace: ${e.toString()}');
  }

  // Test alias conflicts
  try {
    PVCACHER.register('std', handle: StdHandler()); // 'std' is already an alias
    print('❌ This should not print - alias conflict should be detected');
  } catch (e) {
    print('✅ Expected error for alias conflict: ${e.toString()}');
  }

  // Test colon in alias name
  try {
    PVCACHER.alias('bad:alias', 'some_namespace');
    print('❌ This should not print - colon should not be allowed');
  } catch (e) {
    print('✅ Expected error for colon in alias: ${e.toString()}');
  }

  print('\n🎉 All examples completed successfully!');
}

/// Demonstrates the expiry adapter functionality
Future<void> demonstrateExpiryAdapter(PVCacher expiryCache) async {
  print('⏰ EXPIRY ADAPTER EXAMPLES');
  print('-' * 30);

  // Test 1: Short expiry (2 seconds)
  print('📝 Setting item with 2-second expiry...');
  await expiryCache.set(
    'short_lived',
    'This will expire soon',
    options: ExpiryUtils.seconds(2),
  );

  // Immediate get - should work
  final immediate = await expiryCache.get('short_lived');
  print('📖 Immediate get: $immediate');

  // Wait 1 second and get again - should still work
  await Future.delayed(Duration(seconds: 1));
  final afterOneSecond = await expiryCache.get('short_lived');
  print('📖 After 1 second: $afterOneSecond');

  // Wait 2 more seconds and get - should be expired
  await Future.delayed(Duration(seconds: 2));
  final afterExpiry = await expiryCache.get('short_lived');
  print('📖 After expiry: $afterExpiry');

  // Test 2: Specific expiry time
  final futureTime = DateTime.now().add(Duration(seconds: 3));
  print(
    '\\n📝 Setting item to expire at specific time: ${futureTime.toIso8601String()}',
  );
  await expiryCache.set(
    'timed_item',
    'This expires at a specific time',
    options: ExpiryUtils.at(futureTime),
  );

  final timedImmediate = await expiryCache.get('timed_item');
  print('📖 Immediate get: $timedImmediate');

  // Wait for expiry
  await Future.delayed(Duration(seconds: 4));
  final timedAfterExpiry = await expiryCache.get('timed_item');
  print('📖 After specific time expiry: $timedAfterExpiry');

  // Test 3: Different expiry formats
  print('\\n📝 Testing different expiry formats...');

  await expiryCache.set(
    'minutes_test',
    'Expires in minutes',
    options: ExpiryUtils.minutes(1),
  );
  await expiryCache.set(
    'hours_test',
    'Expires in hours',
    options: ExpiryUtils.hours(1),
  );
  await expiryCache.set(
    'duration_test',
    'Expires with duration',
    options: ExpiryUtils.duration(Duration(seconds: 5)),
  );

  final minutesItem = await expiryCache.get('minutes_test');
  final hoursItem = await expiryCache.get('hours_test');
  final durationItem = await expiryCache.get('duration_test');

  print('📖 Minutes test: ${minutesItem != null ? 'Valid' : 'Expired'}');
  print('📖 Hours test: ${hoursItem != null ? 'Valid' : 'Expired'}');
  print('📖 Duration test: ${durationItem != null ? 'Valid' : 'Expired'}');

  print('\\n✅ Expiry adapter demonstration completed!');
}
