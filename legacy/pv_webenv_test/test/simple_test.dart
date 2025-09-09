import 'package:flutter_test/flutter_test.dart';
import 'package:pv_webenv/lib.dart';

void main() {
  // Initialize Flutter binding once for all tests
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Simple ENV Tests', () {
    test('test 1 - basic loading', () async {
      ENV.reset();
      await env.init();
      expect(env['APP_NAME'], equals('PV WebEnv Test'));
    });

    test('test 2 - check database', () async {
      ENV.reset();
      await env.init();
      final envMap = env.env;
      expect(envMap['host'], equals('localhost'));
    });
  });
}
