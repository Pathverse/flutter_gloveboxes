import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/services.dart';
import 'package:pv_webenv/lib.dart';

void main() {
  // Initialize Flutter binding once for all tests that need asset loading
  TestWidgetsFlutterBinding.ensureInitialized();

  group('PV WebEnv Integration Tests', () {
    test('should load and merge all configuration files', () async {
      // Reset the ENV instance for this test
      ENV.reset();
      // Initialize the environment
      await env.init();

      // Test direct values from root.env
      expect(env['APP_NAME'], equals('PV WebEnv Test'));
      expect(env['APP_VERSION'], equals('1.0.0'));
      expect(env['DEBUG_MODE'], equals('true'));
      expect(env['MAX_RETRIES'], equals('3'));
      expect(env['TIMEOUT_SECONDS'], equals('30'));

      // Test that file references are processed and removed after loading
      expect(env['DATABASE_CONFIG'], isNull);
      expect(env['API_CONFIG'], isNull);
      expect(env['CACHE_CONFIG'], isNull);

      // Test that content from referenced files is merged into the main env
      final envMap = env.env;
      expect(envMap.containsKey('host'), isTrue); // from database.json
      expect(envMap.containsKey('api'), isTrue); // from api.toml
      expect(envMap.containsKey('CACHE_TYPE'), isTrue); // from cache.env
    });

    test('should load database.json configuration', () async {
      // Reset the ENV instance for this test
      ENV.reset();
      // Initialize the environment
      await env.init();

      // Get the environment map
      final envMap = env.env;

      // Test basic database configuration from JSON
      expect(envMap['host'], equals('localhost'));
      expect(envMap['port'], equals(5432));
      expect(envMap['name'], equals('test_db'));
      expect(envMap['ssl_enabled'], equals(false));

      // Test nested credentials - check existence first
      expect(envMap.containsKey('credentials'), isTrue);
      expect(envMap['credentials'], isA<Map>());
      if (envMap['credentials'] is Map<String, dynamic>) {
        final credentials = envMap['credentials'] as Map<String, dynamic>;
        expect(credentials['username'], equals('test_user'));
        expect(credentials['password'], equals('test_pass'));
      }

      // Test nested connection pool - check existence first
      expect(envMap.containsKey('connection_pool'), isTrue);
      expect(envMap['connection_pool'], isA<Map>());
      if (envMap['connection_pool'] is Map<String, dynamic>) {
        final pool = envMap['connection_pool'] as Map<String, dynamic>;
        expect(pool['min_connections'], equals(5));
        expect(pool['max_connections'], equals(20));
        expect(pool['timeout'], equals(30.5));
      }
    });

    test('should load api.toml configuration', () async {
      // Reset the ENV instance for this test
      ENV.reset();
      await env.init();

      final envMap = env.env;

      // Test API configuration from TOML
      expect(envMap['api'], isA<Map>());
      final api = envMap['api'] as Map<String, dynamic>;
      expect(api['base_url'], equals('https://api.example.com'));
      expect(api['version'], equals('v1'));
      expect(api['timeout'], equals(60));
      expect(api['enabled'], equals(true));

      // Test nested auth section
      expect(api['auth'], isA<Map>());
      final auth = api['auth'] as Map<String, dynamic>;
      expect(auth['type'], equals('bearer'));
      expect(auth['token_url'], equals('/auth/token'));
      expect(auth['refresh_enabled'], equals(true));

      // Test nested endpoints section
      expect(api['endpoints'], isA<Map>());
      final endpoints = api['endpoints'] as Map<String, dynamic>;
      expect(endpoints['users'], equals('/users'));
      expect(endpoints['orders'], equals('/orders'));
      expect(endpoints['products'], equals('/products'));

      // Test rate limiting section
      expect(envMap['rate_limiting'], isA<Map>());
      final rateLimit = envMap['rate_limiting'] as Map<String, dynamic>;
      expect(rateLimit['requests_per_minute'], equals(100));
      expect(rateLimit['burst_limit'], equals(10));
    });

    test('should load cache.env configuration', () async {
      // Reset the ENV instance for this test
      ENV.reset();
      await env.init();

      final envMap = env.env;

      // Test cache configuration from ENV
      expect(envMap['CACHE_TYPE'], equals('redis'));
      expect(envMap['CACHE_HOST'], equals('localhost'));
      expect(envMap['CACHE_PORT'], equals('6379'));
      expect(envMap['CACHE_TTL'], equals('3600'));
      expect(envMap['CACHE_MAX_SIZE'], equals('1000'));
      expect(envMap['CACHE_COMPRESSION'], equals('true'));
    });

    test('should provide access to merged configuration', () async {
      // Reset the ENV instance for this test
      ENV.reset();
      await env.init();

      final envMap = env.env;

      // Verify all configurations are merged into one map
      expect(
        envMap.keys,
        containsAll([
          'APP_NAME',
          'APP_VERSION',
          'DEBUG_MODE',
          'MAX_RETRIES',
          'TIMEOUT_SECONDS', // root.env
          'host',
          'port',
          'name',
          'ssl_enabled',
          'credentials',
          'connection_pool', // database.json
          'api', 'rate_limiting', // api.toml
          'CACHE_TYPE',
          'CACHE_HOST',
          'CACHE_PORT',
          'CACHE_TTL',
          'CACHE_MAX_SIZE',
          'CACHE_COMPRESSION', // cache.env
        ]),
      );

      // Test that different data types are preserved
      expect(envMap['port'], isA<int>());
      expect(envMap['ssl_enabled'], isA<bool>());
      expect(envMap['connection_pool']['timeout'], isA<double>());
      expect(envMap['APP_NAME'], isA<String>());
    });

    test('should handle nested configuration access', () async {
      // Reset the ENV instance for this test
      ENV.reset();
      await env.init();

      final envMap = env.env;

      // Test nested access patterns
      expect(envMap['api']['auth']['type'], equals('bearer'));
      expect(envMap['credentials']['username'], equals('test_user'));
      expect(envMap['connection_pool']['timeout'], equals(30.5));
    });

    test('should maintain singleton behavior', () async {
      // Reset the ENV instance for this test
      ENV.reset();
      await env.init();

      // Get the instance multiple times
      final env1 = ENV.instance;
      final env2 = ENV.instance;
      final env3 = env;

      // Verify they're all the same instance
      expect(identical(env1, env2), isTrue);
      expect(identical(env1, env3), isTrue);
      expect(identical(env2, env3), isTrue);
    });

    test('should handle reinitialization', () async {
      // Reset the ENV instance for this test
      ENV.reset();
      // Initialize once
      await env.init();
      final firstValue = env['APP_NAME'];

      // Initialize again
      await env.init();
      final secondValue = env['APP_NAME'];

      // Should get the same value
      expect(firstValue, equals(secondValue));
      expect(secondValue, equals('PV WebEnv Test'));
    });
  });
}
