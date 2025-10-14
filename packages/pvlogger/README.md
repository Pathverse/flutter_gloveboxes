# PVLogger

A flexible and extensible logging system for Dart applications with adapter-based architecture.

**Pure Dart Package** - No Flutter dependencies required! Works in any Dart environment including server-side, CLI applications, and Flutter apps.

## Features

- **Adapter-based architecture**: Customize logging behavior with pluggable adapters
- **Namespace support**: Organize logs with hierarchical namespaces
- **Scoped logging**: Add contextual scopes to log entries
- **Error handling**: Built-in support for exception and stack trace logging
- **Async/sync logging**: Support for both synchronous and asynchronous logging
- **Level filtering**: Filter logs by severity levels
- **Formatted output**: JSON serialization and pretty printing included

## Quick Start

```dart
import 'package:pvlogger/pvlogger.dart';

// Create a quick logger with nice printing
final logger = quickLogger('MyApp', nicePrint: true);

// Basic logging
await logger.log('Hello World');

// Logging with scopes
logger.logSync('User action', scopes: ['auth', 'login']);

// Error logging
try {
  // some code
} catch (error, stackTrace) {
  await logger.catchError(error, stackTrace, 'Operation failed');
}
```

## Custom Adapters

```dart
// Create custom adapters
class MyCustomAdapter extends PVLogAdapter with Action {
  @override
  void action(PVLogEvent event) {
    // Custom logging logic
  }
  
  @override
  Future<void> actionAsync(PVLogEvent event) async {
    // Async logging logic
  }
}

// Register adapters
PVLogger.registerAdapter(PVStdFormatter());
PVLogger.registerAdapter(MyCustomAdapter());
```

## Logger Hierarchy

```dart
// Create root logger
final rootLogger = PVLogger('app');

// Create child loggers
final authLogger = rootLogger.child('auth');
final dbLogger = rootLogger.child('database');

// Child loggers inherit parent context
await authLogger.log('Login successful'); // namespace: app.auth
```
