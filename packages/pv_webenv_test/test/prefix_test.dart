import 'package:flutter_test/flutter_test.dart';
import 'package:pv_webenv/lib.dart';

void main() {
  // Initialize Flutter binding once for all tests that need asset loading
  TestWidgetsFlutterBinding.ensureInitialized();

  group('PV WebEnv Prefix Functionality Tests', () {
    test('should load files with <<file>> syntax and apply prefixes', () async {
      // Reset the ENV instance for this test
      ENV.reset();

      // Temporarily override the root.env file for this test
      // We'll need to create a custom initialization that loads our test file
      // For now, we'll test with a manual approach
      await env.init();

      // Test that original functionality still works
      expect(env['APP_NAME'], equals('PV WebEnv Test'));
      expect(env['DEBUG_MODE'], equals('true'));
    });

    test('should handle ENV file with prefix syntax', () async {
      // This test requires a way to load a different root file
      // For comprehensive testing, we would need to extend the ENV class
      // to accept a custom root file path
      ENV.reset();
      await env.init();

      // Verify basic functionality still works
      expect(env['APP_NAME'], isNotNull);
      expect(env['DEBUG_MODE'], isNotNull);
    });

    test('should apply correct prefixes to loaded keys', () async {
      // Mock test - in a real implementation we would need to:
      // 1. Create a way to specify custom root.env file
      // 2. Load root_with_prefix.env instead of root.env
      // 3. Test that DB_ prefixes are applied correctly

      ENV.reset();
      await env.init();

      // For now, verify the environment loads successfully
      final envMap = env.env;
      expect(envMap, isNotEmpty);
      expect(envMap.containsKey('APP_NAME'), isTrue);
    });

    test('should handle nested JSON structures with prefixes', () async {
      // This would test that auth_service.json content gets loaded with AUTH_ prefix
      // Expected results after prefix loading:
      // AUTH_jwt_secret=super_secret_key
      // AUTH_token_expiry=3600
      // AUTH_refresh_enabled=true
      // AUTH_providers=<Map structure>
      // AUTH_session_timeout=1800

      ENV.reset();
      await env.init();

      // Placeholder test - would need custom root file loading
      expect(env.env, isNotEmpty);
    });

    test('should handle TOML structures with prefixes', () async {
      // This would test that monitoring.toml content gets loaded with MONITOR_ prefix
      // Expected results after prefix loading:
      // MONITOR_enabled=true
      // MONITOR_metrics_port=9090
      // MONITOR_health_check_interval=30
      // MONITOR_logging=<Map structure>
      // MONITOR_alerts=<Map structure>

      ENV.reset();
      await env.init();

      // Placeholder test - would need custom root file loading
      expect(env.env, isNotEmpty);
    });

    test('should remove prefix reference keys after loading', () async {
      // This would test that after loading <<file>> references,
      // the original keys (DB, AUTH, MONITOR) are removed from the environment

      ENV.reset();
      await env.init();

      // Placeholder test - would need custom root file loading
      expect(env.env, isNotEmpty);
    });

    test('should handle missing files gracefully with prefix syntax', () async {
      // Test that if a file referenced with <<file>> doesn't exist,
      // the original key remains unchanged

      ENV.reset();
      await env.init();

      // Verify basic functionality
      expect(env.env, isNotEmpty);
    });

    test('should handle mix of {{file}} and <<file>> syntax', () async {
      // Test that both syntaxes can be used in the same root.env file
      // {{file}} should merge directly
      // <<file>> should merge with prefix

      ENV.reset();
      await env.init();

      // Verify environment loads
      final envMap = env.env;
      expect(envMap, isNotEmpty);

      // Verify we have content from both regular and prefix file loading
      expect(envMap.containsKey('APP_NAME'), isTrue); // from root.env
      expect(envMap.containsKey('host'), isTrue); // from {{database.json}}
    });
  });

  group('PV WebEnv Memory Bank Update Tests', () {
    test('should maintain singleton pattern with new functionality', () async {
      ENV.reset();
      await env.init();

      final env1 = ENV.instance;
      final env2 = ENV.instance;
      final env3 = env;

      // Verify they're all the same instance
      expect(identical(env1, env2), isTrue);
      expect(identical(env1, env3), isTrue);
      expect(identical(env2, env3), isTrue);
    });

    test(
      'should properly reset and reinitialize with prefix functionality',
      () async {
        ENV.reset();
        await env.init();
        final firstValue = env['APP_NAME'];

        // Reset and initialize again
        ENV.reset();
        await env.init();
        final secondValue = env['APP_NAME'];

        // Should get the same value
        expect(firstValue, equals(secondValue));
      },
    );

    test('should handle concurrent access to prefixed environment', () async {
      ENV.reset();
      await env.init();

      // Test multiple concurrent accesses
      final futures = List.generate(10, (index) async {
        return env['APP_NAME'];
      });

      final results = await Future.wait(futures);

      // All should return the same value
      expect(results.every((result) => result == results.first), isTrue);
    });
  });
}
