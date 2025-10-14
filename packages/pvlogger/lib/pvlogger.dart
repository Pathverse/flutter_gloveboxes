/// A flexible and extensible logging system for Dart applications.
///
/// PVLogger provides an adapter-based architecture that allows customization
/// of logging behavior through pluggable adapters. It supports hierarchical
/// namespaces, scoped logging, error handling, and both synchronous and
/// asynchronous logging operations.
///
/// Example usage:
/// ```dart
/// // Quick setup with nice printing
/// final logger = quickLogger('MyApp', nicePrint: true);
///
/// // Basic logging
/// await logger.log('Hello World');
///
/// // Error logging
/// try {
///   // some operation
/// } catch (error, stackTrace) {
///   await logger.catchError(error, stackTrace, 'Operation failed');
/// }
/// ```
library;

import 'package:pvlogger/src/core/logger.dart';
import 'package:pvlogger/templates/print.dart';

export 'package:pvlogger/src/core/adapter.dart';
export 'package:pvlogger/src/core/event.dart';
export 'package:pvlogger/src/core/logger.dart';

/// Creates a pre-configured PVLogger with standard formatting and print adapters.
///
/// This is the recommended way to quickly set up logging for most applications.
/// It automatically registers a [PVStdFormatter] for message formatting and
/// either a [PVLogJustPrinter] or [PVLogNicerPrinter] based on the [nicePrint] flag.
///
/// Parameters:
/// - [namespace]: The logger namespace (e.g., 'MyApp', 'auth', 'database')
/// - [scopes]: Optional initial scopes to attach to all log messages
/// - [nicePrint]: If true, uses pretty formatting with icons and borders;
///   if false, uses simple JSON output (default: false)
///
/// Returns a configured [PVLogger] instance ready to use.
///
/// Example:
/// ```dart
/// // Simple logger
/// final logger = quickLogger('MyApp');
/// await logger.log('Application started');
///
/// // Pretty logger with scopes
/// final authLogger = quickLogger('auth', scopes: ['security'], nicePrint: true);
/// await authLogger.log('User logged in', scopes: ['user123']);
/// ```
PVLogger quickLogger(
  String namespace, {
  List<String> scopes = const [],
  bool nicePrint = false,
}) {
  final logger = PVLogger(namespace, scopes: scopes);
  PVLogger.registerAdapter(PVStdFormatter());
  if (nicePrint) {
    PVLogger.registerAdapter(PVLogNicerPrinter());
  } else {
    PVLogger.registerAdapter(PVLogJustPrinter());
  }
  return logger;
}
