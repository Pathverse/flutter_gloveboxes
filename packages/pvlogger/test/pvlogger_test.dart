// ignore_for_file: avoid_print

import 'package:flutter_test/flutter_test.dart';
import 'package:pvlogger/pvlogger.dart';

void main() {
  group('PVLogger Tests', () {
    setUpAll(() {
      // Setup the print logger before running tests
      setupPrintLogger();
    });

    test('Test different severity levels with messages', () {
      print('\n=== Testing Different Severity Levels ===\n');

      // Test different severity levels (0-9)
      for (int i = 0; i < 10; i++) {
        String severityName = getSeverityName(i);
        logger.logSync(
          'This is a $severityName message at level $i',
          metadata: {'lv': i},
        );
      }
    });

    test('Test with custom scopes and namespaces', () {
      print('\n=== Testing Custom Scopes ===\n');

      // Create logger with custom namespace and scopes
      final customLogger = PVLogScoper(
        config: PVLogConfig(
          namespace: 'MyApp',
          scopes: ['Authentication', 'UserService'],
        ),
      );

      customLogger.logSync(
        'User login attempt failed',
        metadata: {'lv': 4, 'userId': '12345', 'attempt': 3},
      );

      customLogger.logSync(
        'Database connection lost',
        metadata: {'lv': 6, 'database': 'postgres', 'retryCount': 2},
      );
    });

    test('Test exception handling', () {
      print('\n=== Testing Exception Handling ===\n');

      try {
        // Simulate an exception
        throw Exception('Database connection failed');
      } catch (e, stackTrace) {
        logger.catchErrorSync(
          message: 'Error occurred while processing user request',
          error: e as Exception,
          stackTrace: stackTrace,
        );
      }

      try {
        // Simulate another type of error
        throw ArgumentError('Invalid user ID provided');
      } catch (e, stackTrace) {
        logger.catchErrorSync(
          message: 'Validation error in user input',
          error: Exception(e.toString()),
          stackTrace: stackTrace,
        );
      }
    });

    test('Test async logging', () async {
      print('\n=== Testing Async Logging ===\n');

      await logger.log(
        'Async operation started',
        metadata: {'lv': 1, 'operation': 'data_sync'},
      );

      // Simulate some async work
      await Future.delayed(Duration(milliseconds: 10));

      await logger.log(
        'Async operation completed successfully',
        metadata: {'lv': 1, 'operation': 'data_sync', 'duration': '10ms'},
      );
    });

    test('Test edge cases', () {
      print('\n=== Testing Edge Cases ===\n');

      // Test with null/empty messages
      logger.logSync('', metadata: {'lv': 2});

      // Test with complex objects
      logger.logSync(
        {
          'user': {'id': 123, 'name': 'John Doe'},
          'action': 'login',
          'timestamp': DateTime.now().toIso8601String(),
        },
        metadata: {'lv': 1},
      );

      // Test with list
      logger.logSync(['error1', 'error2', 'error3'], metadata: {'lv': 5});

      // Test severity level outside range (should clamp)
      logger.logSync('Invalid severity level test', metadata: {'lv': 15});
      logger.logSync('Negative severity level test', metadata: {'lv': -1});
    });

    test('Test real-world scenarios', () {
      print('\n=== Testing Real-World Scenarios ===\n');

      // API request logging
      final apiLogger = PVLogScoper(
        config: PVLogConfig(
          namespace: 'API',
          scopes: ['HTTP', 'UserController'],
        ),
      );

      apiLogger.logSync(
        'GET /api/users - Request started',
        metadata: {'lv': 1},
      );
      apiLogger.logSync('User authentication successful', metadata: {'lv': 1});
      apiLogger.logSync(
        'Rate limit warning: 80% of quota used',
        metadata: {'lv': 4},
      );
      apiLogger.logSync(
        'GET /api/users - Request completed (200ms)',
        metadata: {'lv': 1},
      );

      // Database operations
      final dbLogger = PVLogScoper(
        config: PVLogConfig(
          namespace: 'Database',
          scopes: ['PostgreSQL', 'UserTable'],
        ),
      );

      dbLogger.logSync('Connection pool created', metadata: {'lv': 1});
      dbLogger.logSync(
        'Slow query detected',
        metadata: {'lv': 4, 'queryTime': '2.5s'},
      );
      dbLogger.logSync('Connection timeout', metadata: {'lv': 5});
      dbLogger.logSync('Database failover initiated', metadata: {'lv': 6});
    });
  });
}

String getSeverityName(int level) {
  switch (level) {
    case 0:
      return 'trace/debug';
    case 1:
      return 'info';
    case 2:
      return 'notice';
    case 3:
      return 'suggestion';
    case 4:
      return 'warning';
    case 5:
      return 'error';
    case 6:
      return 'critical';
    case 7:
      return 'fatal';
    case 8:
      return 'emergency';
    case 9:
      return 'catastrophic';
    default:
      return 'unknown';
  }
}
