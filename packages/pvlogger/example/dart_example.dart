import 'package:pvlogger/pvlogger.dart';
import 'package:pvlogger/templates/print.dart';

void main() async {
  // Create a simple logger
  final logger = quickLogger('MyDartApp', nicePrint: true);

  // Basic logging
  await logger.log('Application started');
  logger.logSync('This is a sync message');

  // Scoped logging
  await logger.log('User logged in', scopes: ['auth', 'security']);

  // Error handling
  try {
    throw Exception('Something went wrong');
  } catch (error, stackTrace) {
    if (error is Exception) {
      await logger.catchError(error, stackTrace, 'Failed to process data');
    }
  }

  // Child loggers
  final dbLogger = logger.child('database');
  await dbLogger.log('Connection established');

  // Custom logger with different settings
  final debugLogger = PVLogger('debug', scopes: ['development']);
  debugLogger.level = 2;

  PVLogger.registerAdapter(PVStdFormatter());
  PVLogger.registerAdapter(PVLogJustPrinter(level: 1));

  await debugLogger.log('Debug information', scopes: ['trace']);
}
