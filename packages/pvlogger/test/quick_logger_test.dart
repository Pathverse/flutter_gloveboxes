import 'package:flutter_test/flutter_test.dart';
import 'package:pvlogger/pvlogger.dart';
import 'package:pvlogger/src/core/registry.dart';
import 'package:pvlogger/templates/print.dart';

/// Test adapter that captures log events for verification
class QuickTestCaptureAdapter extends PVLogAdapter with Action {
  final List<PVLogEvent> capturedEvents = [];

  @override
  List<AdapterIntent> get intents => [
    AdapterIntent.action,
    AdapterIntent.print,
  ];

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

  /// Check if formatted data exists in captured events
  bool hasFormattedData() {
    return capturedEvents.any(
      (event) => event.extra.containsKey('pvlogger_formatted'),
    );
  }

  /// Get the last event's formatted content
  String? getLastFormattedContent() {
    if (capturedEvents.isEmpty) return null;
    final lastEvent = capturedEvents.last;
    if (lastEvent.extra.containsKey('pvlogger_formatted')) {
      return lastEvent.extra['pvlogger_formatted']!['formatted'];
    }
    return null;
  }
}

void main() {
  group('quickLogger Tests', () {
    late QuickTestCaptureAdapter testAdapter;

    setUp(() {
      testAdapter = QuickTestCaptureAdapter();

      // Clear registry to ensure clean state
      PVLoggerRegistry.globalAdapters.clear();
      PVLoggerRegistry.adapters.clear();
      PVLoggerRegistry.rootLoggers.clear();
      PVLoggerRegistry.childLoggers.clear();
    });

    tearDown(() {
      testAdapter.clear();
    });

    test('quickLogger creates logger with correct namespace and scopes', () {
      final logger = quickLogger('testApp', scopes: ['init', 'setup']);

      expect(logger.namespace, equals('testApp'));
      expect(logger.scopes, contains('init'));
      expect(logger.scopes, contains('setup'));
    });

    test('quickLogger registers PVStdFormatter by default', () {
      quickLogger('testApp');

      // Check that adapters are registered
      expect(PVLoggerRegistry.globalAdapters.length, greaterThan(0));

      // Check that PVStdFormatter is among the adapters
      final hasFormatter = PVLoggerRegistry.globalAdapters.any(
        (adapter) => adapter is PVStdFormatter,
      );
      expect(hasFormatter, isTrue);
    });

    test('quickLogger with nicePrint=false uses PVLogJustPrinter', () {
      quickLogger('testApp', nicePrint: false);

      final hasJustPrinter = PVLoggerRegistry.globalAdapters.any(
        (adapter) => adapter is PVLogJustPrinter,
      );
      final hasNicerPrinter = PVLoggerRegistry.globalAdapters.any(
        (adapter) => adapter is PVLogNicerPrinter,
      );

      expect(hasJustPrinter, isTrue);
      expect(hasNicerPrinter, isFalse);
    });

    test('quickLogger with nicePrint=true uses PVLogNicerPrinter', () {
      quickLogger('testApp', nicePrint: true);

      final hasJustPrinter = PVLoggerRegistry.globalAdapters.any(
        (adapter) => adapter is PVLogJustPrinter,
      );
      final hasNicerPrinter = PVLoggerRegistry.globalAdapters.any(
        (adapter) => adapter is PVLogNicerPrinter,
      );

      expect(hasJustPrinter, isFalse);
      expect(hasNicerPrinter, isTrue);
    });

    test('quickLogger default behavior (nicePrint=false)', () {
      quickLogger('testApp');

      final hasJustPrinter = PVLoggerRegistry.globalAdapters.any(
        (adapter) => adapter is PVLogJustPrinter,
      );
      expect(hasJustPrinter, isTrue);
    });

    test('quickLogger produces working logger that can log messages', () async {
      final logger = quickLogger('testApp');
      PVLogger.registerAdapter(testAdapter);

      await logger.log('Test message from quickLogger');

      expect(testAdapter.capturedEvents.length, equals(1));
      expect(testAdapter.capturedEvents.first.namespace, equals('testApp'));
      expect(
        testAdapter.capturedEvents.first.raw,
        equals('Test message from quickLogger'),
      );
    });

    test('quickLogger formatter processes messages correctly', () async {
      final logger = quickLogger('testApp');
      PVLogger.registerAdapter(testAdapter);

      await logger.log('Formatted test message');

      expect(testAdapter.hasFormattedData(), isTrue);
      final formatted = testAdapter.getLastFormattedContent();
      expect(formatted, isNotNull);
      expect(formatted, contains('Formatted test message'));
    });

    test('quickLogger handles scoped logging', () async {
      final logger = quickLogger('testApp', scopes: ['module1']);
      PVLogger.registerAdapter(testAdapter);

      await logger.log('Scoped message', scopes: ['function1']);

      expect(testAdapter.capturedEvents.length, equals(1));
      final event = testAdapter.capturedEvents.first;
      expect(event.scopes, contains('module1'));
      expect(event.scopes, contains('function1'));
    });

    test('quickLogger handles error logging', () async {
      final logger = quickLogger('testApp');
      PVLogger.registerAdapter(testAdapter);

      final testError = Exception('Test error from quickLogger');
      final testStackTrace = StackTrace.current;

      await logger.catchError(
        testError,
        testStackTrace,
        'Quick logger error test',
      );

      expect(testAdapter.capturedEvents.length, equals(1));
      final event = testAdapter.capturedEvents.first;
      expect(event.extra.containsKey('pvlogger_catch_error'), isTrue);
      expect(event.extra.containsKey('pvlogger_catch_error_formatted'), isTrue);
    });

    test('quickLogger sync logging works', () {
      final logger = quickLogger('testApp');
      PVLogger.registerAdapter(testAdapter);

      logger.logSync('Sync message from quickLogger');

      expect(testAdapter.capturedEvents.length, equals(1));
      expect(testAdapter.capturedEvents.first.asyncCall, isFalse);
      expect(
        testAdapter.capturedEvents.first.raw,
        equals('Sync message from quickLogger'),
      );
    });

    test('quickLogger with child loggers', () async {
      final logger = quickLogger('app');
      final childLogger = logger.child('module');
      PVLogger.registerAdapter(testAdapter);

      await childLogger.log('Child logger message');

      expect(testAdapter.capturedEvents.length, equals(1));
      expect(testAdapter.capturedEvents.first.namespace, equals('app.module'));
    });

    test('multiple quickLoggers share global adapters', () {
      final logger1 = quickLogger('app1');
      final logger2 = quickLogger('app2');

      // Both loggers should be valid
      expect(logger1.namespace, equals('app1'));
      expect(logger2.namespace, equals('app2'));

      // Both should share the same global adapters (they add to the same registry)
      expect(PVLoggerRegistry.globalAdapters.length, greaterThan(0));

      // Each call to quickLogger adds adapters, so count increases
      final adapterCount = PVLoggerRegistry.globalAdapters.length;
      expect(
        adapterCount,
        greaterThan(2),
      ); // At least formatter + printer for each
    });

    test('quickLogger with complex data structures', () async {
      final logger = quickLogger('testApp');
      PVLogger.registerAdapter(testAdapter);

      final complexData = {
        'user': {'id': 123, 'name': 'John'},
        'items': [1, 2, 3],
        'metadata': {'timestamp': DateTime.now().toIso8601String()},
      };

      await logger.log(complexData);

      expect(testAdapter.capturedEvents.length, equals(1));
      expect(testAdapter.hasFormattedData(), isTrue);

      final formatted = testAdapter.getLastFormattedContent();
      expect(formatted, contains('user'));
      expect(formatted, contains('items'));
      expect(formatted, contains('metadata'));
    });
  });
}
