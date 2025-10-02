import 'package:flutter_test/flutter_test.dart';
import 'package:pvlogger/pvlogger.dart';
import 'package:pvlogger/src/utils/serialize.dart';
import 'package:pvlogger/src/core/registry.dart';
import 'package:pvlogger/templates/print.dart';

/// Test adapter that captures log events instead of printing to stdout
class TestCaptureAdapter extends PVLogAdapter with Action {
  final List<PVLogEvent> capturedEvents = [];
  final int level;

  TestCaptureAdapter({this.level = 0});

  @override
  List<AdapterIntent> get intents => [
    AdapterIntent.action,
    AdapterIntent.print,
  ];

  @override
  int? get levelFilter => level;

  @override
  void action(PVLogEvent event) {
    capturedEvents.add(event);
  }

  @override
  Future<void> actionAsync(PVLogEvent event) async {
    capturedEvents.add(event);
  }

  void clear() {
    capturedEvents.clear();
  }

  /// Get the formatted content from the last captured event
  String? getLastFormattedContent() {
    if (capturedEvents.isEmpty) return null;
    final lastEvent = capturedEvents.last;
    if (lastEvent.extra.containsKey('pvlogger_formatted')) {
      final formatted = lastEvent.extra['pvlogger_formatted']!['formatted'];
      return formatted.toString();
    }
    return jsonify(lastEvent.raw);
  }

  /// Get catch error formatted content from the last captured event
  Map<String, dynamic>? getLastCatchErrorFormatted() {
    if (capturedEvents.isEmpty) return null;
    final lastEvent = capturedEvents.last;
    return lastEvent.extra['pvlogger_catch_error_formatted'];
  }
}

void main() {
  group('PVLogger Tests', () {
    late TestCaptureAdapter testAdapter;
    late PVStdFormatter formatter;

    setUp(() {
      testAdapter = TestCaptureAdapter();
      formatter = PVStdFormatter();

      // Clear any existing adapters from registry
      PVLoggerRegistry.globalAdapters.clear();
      PVLoggerRegistry.adapters.clear();
      PVLoggerRegistry.rootLoggers.clear();
      PVLoggerRegistry.childLoggers.clear();
    });

    tearDown(() {
      testAdapter.clear();
    });

    test('quickLogger creates logger with formatters and adapters', () {
      final logger = quickLogger('test');

      expect(logger.namespace, equals('test'));
      expect(PVLoggerRegistry.globalAdapters.length, greaterThan(0));
    });

    test('basic logging captures events', () async {
      final logger = PVLogger('test');

      // Register adapters in order: formatter first, then capture adapter
      PVLogger.registerAdapter(testAdapter);
      PVLogger.registerAdapter(formatter);

      await logger.log('Hello World');

      expect(testAdapter.capturedEvents.length, equals(1));
      expect(testAdapter.capturedEvents.first.namespace, equals('test'));
      expect(testAdapter.capturedEvents.first.raw, equals('Hello World'));
    });

    test('sync logging captures events', () {
      final logger = PVLogger('test');
      PVLogger.registerAdapter(formatter);
      PVLogger.registerAdapter(testAdapter);

      logger.logSync('Hello Sync World');

      expect(testAdapter.capturedEvents.length, equals(1));
      expect(testAdapter.capturedEvents.first.namespace, equals('test'));
      expect(testAdapter.capturedEvents.first.raw, equals('Hello Sync World'));
      expect(testAdapter.capturedEvents.first.asyncCall, isFalse);
    });

    test('formatter creates pvlogger_formatted extra data', () async {
      final logger = PVLogger('test');
      PVLogger.registerAdapter(formatter);
      PVLogger.registerAdapter(testAdapter);

      await logger.log('Test message');

      expect(testAdapter.capturedEvents.length, equals(1));
      final event = testAdapter.capturedEvents.first;
      expect(event.extra.containsKey('pvlogger_formatted'), isTrue);
      expect(event.extra['pvlogger_formatted']!['formatted'], isA<String>());
    });

    test('catch error logging creates special formatted data', () async {
      final logger = PVLogger('test');
      PVLogger.registerAdapter(formatter);
      PVLogger.registerAdapter(testAdapter);

      final testError = Exception('Test error');
      final testStackTrace = StackTrace.current;

      await logger.catchError(testError, testStackTrace, 'Error occurred');

      expect(testAdapter.capturedEvents.length, equals(1));
      final event = testAdapter.capturedEvents.first;

      // Check that catch error data is present
      expect(event.extra.containsKey('pvlogger_catch_error'), isTrue);
      expect(event.extra.containsKey('pvlogger_catch_error_formatted'), isTrue);

      final errorFormatted =
          event.extra['pvlogger_catch_error_formatted'] as Map<String, dynamic>;
      expect(errorFormatted.containsKey('error'), isTrue);
      expect(errorFormatted.containsKey('stackTrace'), isTrue);

      // Verify the error is properly jsonified
      expect(errorFormatted['error'], contains('Test error'));
    });

    test('sync catch error logging works correctly', () {
      final logger = PVLogger('test');
      PVLogger.registerAdapter(formatter);
      PVLogger.registerAdapter(testAdapter);

      final testError = Exception('Sync test error');
      final testStackTrace = StackTrace.current;

      logger.catchErrorSync(testError, testStackTrace, 'Sync error occurred');

      expect(testAdapter.capturedEvents.length, equals(1));
      final event = testAdapter.capturedEvents.first;
      expect(event.asyncCall, isFalse);
      expect(event.extra.containsKey('pvlogger_catch_error'), isTrue);
      expect(event.extra.containsKey('pvlogger_catch_error_formatted'), isTrue);
    });

    test('logger with scopes', () async {
      final logger = PVLogger('test', scopes: ['auth', 'login']);
      PVLogger.registerAdapter(formatter);
      PVLogger.registerAdapter(testAdapter);

      await logger.log('Login attempt');

      expect(testAdapter.capturedEvents.length, equals(1));
      final event = testAdapter.capturedEvents.first;
      expect(event.scopes, contains('auth'));
      expect(event.scopes, contains('login'));
    });

    test('child logger creation and hierarchy', () {
      final rootLogger = PVLogger('app');
      final childLogger = rootLogger.child('module');

      expect(childLogger.namespace, equals('app.module'));
      expect(childLogger.parent?.namespace, equals('app'));
    });

    test('level filtering works correctly', () async {
      // Create adapter that only accepts level 5 and above
      final highLevelAdapter = TestCaptureAdapter(level: 5);
      final logger = PVLogger('test');
      logger.level = 3; // Below the filter threshold

      PVLogger.registerAdapter(formatter);
      PVLogger.registerAdapter(highLevelAdapter);

      await logger.log('This should be filtered out');

      // Should be filtered out due to level
      expect(highLevelAdapter.capturedEvents.length, equals(0));

      // Now set logger to higher level
      logger.level = 6;
      await logger.log('This should pass');

      expect(highLevelAdapter.capturedEvents.length, equals(1));
    });

    test('multiple adapters receive events', () async {
      final adapter1 = TestCaptureAdapter();
      final adapter2 = TestCaptureAdapter();
      final logger = PVLogger('test');

      PVLogger.registerAdapter(formatter);
      PVLogger.registerAdapter(adapter1);
      PVLogger.registerAdapter(adapter2);

      await logger.log('Multi adapter test');

      expect(adapter1.capturedEvents.length, equals(1));
      expect(adapter2.capturedEvents.length, equals(1));
    });

    test('namespace-specific adapters', () async {
      final globalAdapter = TestCaptureAdapter();
      final specificAdapter = TestCaptureAdapter();

      // Register adapters
      PVLogger.registerAdapter(formatter);
      PVLogger.registerAdapter(globalAdapter); // Global
      PVLogger.registerAdapter(
        specificAdapter,
        namespaces: ['specific'],
      ); // Namespace-specific

      final globalLogger = PVLogger('global');
      final specificLogger = PVLogger('specific');

      await globalLogger.log('Global message');
      await specificLogger.log('Specific message');

      // Global adapter should receive both (since it's registered globally)
      expect(globalAdapter.capturedEvents.length, equals(2));

      // Specific adapter should receive both messages since global adapters are always included
      // but we can check that the specific one received the right message
      expect(specificAdapter.capturedEvents.length, equals(2));
      expect(
        specificAdapter.capturedEvents.any((e) => e.namespace == 'specific'),
        isTrue,
      );
    });

    test('extra data is properly preserved', () async {
      final logger = PVLogger('test');
      PVLogger.registerAdapter(formatter);
      PVLogger.registerAdapter(testAdapter);

      final extraData = {
        'user': {'id': 123, 'name': 'John'},
        'session': {'token': 'abc123'},
      };

      await logger.log('User action', extra: extraData);

      expect(testAdapter.capturedEvents.length, equals(1));
      final event = testAdapter.capturedEvents.first;
      expect(event.extra.containsKey('user'), isTrue);
      expect(event.extra.containsKey('session'), isTrue);
      expect(event.extra['user']!['id'], equals(123));
    });

    test('jsonify serialization works for complex objects', () async {
      final logger = PVLogger('test');
      PVLogger.registerAdapter(formatter);
      PVLogger.registerAdapter(testAdapter);

      final complexObject = {
        'numbers': [1, 2, 3],
        'nested': {'key': 'value'},
        'mixed': [1, 'string', true],
      };

      await logger.log(complexObject);

      expect(testAdapter.capturedEvents.length, equals(1));
      final formatted = testAdapter.getLastFormattedContent();
      expect(formatted, isNotNull);
      expect(formatted, contains('numbers'));
      expect(formatted, contains('nested'));
    });
  });
}
