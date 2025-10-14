import 'package:pvlogger/src/core/adapter.dart';
import 'package:pvlogger/src/core/event.dart';
import 'package:pvlogger/src/core/registry.dart';
import 'package:pvlogger/src/utils/stack.dart';

/// A hierarchical logger that processes events through a pipeline of adapters.
///
/// PVLogger implements a flexible logging system where:
/// - Loggers are organized in namespaces (e.g., 'app', 'app.auth', 'app.database')
/// - Events are processed through adapters that can filter, modify, and act on logs
/// - Both synchronous and asynchronous logging are supported
/// - Rich context information including scopes, levels, and stack traces
///
/// Example usage:
/// ```dart
/// // Create a logger
/// final logger = PVLogger('myapp');
///
/// // Register adapters
/// PVLogger.registerAdapter(PVStdFormatter());
/// PVLogger.registerAdapter(ConsolePrinter());
///
/// // Log messages
/// await logger.log('Application started');
/// logger.logSync('Quick message');
///
/// // Handle errors
/// try {
///   riskyOperation();
/// } catch (error, stackTrace) {
///   await logger.catchError(error, stackTrace, 'Operation failed');
/// }
/// ```
class PVLogger {
  /// Registers an adapter to process log events.
  ///
  /// Adapters can be registered globally (for all loggers) or for specific
  /// namespaces. Global adapters are added when [namespaces] is empty.
  ///
  /// Parameters:
  /// - [adapter]: The adapter to register
  /// - [namespaces]: List of namespaces this adapter should handle.
  ///   If empty, the adapter is registered globally.
  ///
  /// Example:
  /// ```dart
  /// // Global adapter (handles all loggers)
  /// PVLogger.registerAdapter(ConsoleAdapter());
  ///
  /// // Namespace-specific adapter
  /// PVLogger.registerAdapter(FileAdapter(), namespaces: ['app.database']);
  /// ```
  static void registerAdapter(
    PVLogAdapter adapter, {
    List<String> namespaces = const [],
  }) {
    if (namespaces.isEmpty) {
      PVLoggerRegistry.globalAdapters.add(adapter);
      return;
    }

    for (var ns in namespaces) {
      if (!PVLoggerRegistry.adapters.containsKey(ns)) {
        PVLoggerRegistry.adapters[ns] = [];
      }
      PVLoggerRegistry.adapters[ns]!.add(adapter);
    }
  }

  /// Gets the parent logger in the namespace hierarchy.
  ///
  /// For a logger with namespace 'app.auth.user', the parent would be
  /// the logger with namespace 'app.auth'. Root loggers return null.
  ///
  /// Returns null if this is a root logger or if the parent doesn't exist.
  PVLogger? get parent {
    final parentNs = _parentNamespace;
    if (parentNs.isEmpty) {
      return null;
    }
    if (!PVLoggerRegistry.rootLoggers.containsKey(parentNs)) {
      return null;
    }
    return PVLoggerRegistry.rootLoggers[parentNs];
  }

  /// Creates a child logger with the specified name.
  ///
  /// The child logger will have a namespace of 'parent.childName' and
  /// will inherit all scopes from the parent plus any additional scopes.
  ///
  /// Parameters:
  /// - [childName]: The name for the child logger (cannot be empty)
  /// - [scopes]: Additional scopes to add to the inherited scopes
  ///
  /// Returns a new PVLogger instance for the child.
  ///
  /// Example:
  /// ```dart
  /// final appLogger = PVLogger('app');
  /// final authLogger = appLogger.child('auth'); // namespace: 'app.auth'
  /// final userLogger = authLogger.child('user'); // namespace: 'app.auth.user'
  /// ```
  ///
  /// Throws [ArgumentError] if [childName] is empty.
  PVLogger child(String childName, {List<String> scopes = const []}) {
    if (childName.isEmpty) {
      throw ArgumentError('Child name cannot be empty');
    }
    final fullNamespace = '$namespace.$childName';
    return PVLogger(fullNamespace, scopes: scopes + this.scopes);
  }

  String get _parentNamespace {
    if (!namespace.contains('.')) {
      return '';
    }
    final parts = namespace.split('.');
    return parts.sublist(0, parts.length - 1).join('.');
  }

  /// The namespace identifier for this logger (e.g., 'app', 'app.auth')
  final String namespace;

  /// Scopes attached to all log events from this logger
  final List<String> scopes;

  /// The current logging level for this logger
  ///
  /// Events with level below this value may be filtered out by adapters.
  /// Higher numbers indicate higher severity.
  int level = 0;

  /// Internal constructor for creating logger instances
  PVLogger._internal(this.namespace, {this.scopes = const []});

  /// Creates a new PVLogger with the specified namespace and scopes.
  ///
  /// This factory constructor manages logger instances to ensure that loggers
  /// with the same namespace return the same instance (singleton pattern).
  ///
  /// For root loggers (no '.' in namespace), the logger is cached in the
  /// root logger registry. For child loggers (containing '.'), they are
  /// organized under their root logger.
  ///
  /// Parameters:
  /// - [namespace]: The logger namespace (e.g., 'app', 'app.auth')
  /// - [scopes]: Initial scopes to attach to all log events
  ///
  /// Returns the logger instance for the specified namespace.
  ///
  /// Example:
  /// ```dart
  /// final appLogger = PVLogger('app');
  /// final authLogger = PVLogger('app.auth');
  /// final sameLogger = PVLogger('app'); // Returns the same instance as appLogger
  /// ```
  ///
  /// Throws [ArgumentError] if [namespace] is empty or if trying to create
  /// a child logger when the root logger doesn't exist.
  factory PVLogger(String namespace, {List<String> scopes = const []}) {
    if (namespace.isEmpty) {
      throw ArgumentError('Namespace cannot be empty');
    }

    // if no . in namespace, it's a root logger
    if (!namespace.contains('.')) {
      if (PVLoggerRegistry.rootLoggers.containsKey(namespace)) {
        return PVLoggerRegistry.rootLoggers[namespace]!;
      } else {
        final logger = PVLogger._internal(namespace, scopes: scopes);
        PVLoggerRegistry.rootLoggers[namespace] = logger;
        PVLoggerRegistry.lastLogger = logger;
        return logger;
      }
    } else {
      // child logger
      final parts = namespace.split('.');
      final rootName = parts.first;
      final childName = parts.sublist(1).join('.');

      if (!PVLoggerRegistry.rootLoggers.containsKey(rootName)) {
        throw ArgumentError('Root logger "$rootName" does not exist');
      }

      if (!PVLoggerRegistry.childLoggers.containsKey(rootName)) {
        PVLoggerRegistry.childLoggers[rootName] = {};
      }

      final childLoggers = PVLoggerRegistry.childLoggers[rootName]!;

      if (childLoggers.containsKey(childName)) {
        return childLoggers[childName]!;
      } else {
        final logger = PVLogger._internal(namespace, scopes: scopes);
        childLoggers[childName] = logger;
        PVLoggerRegistry.lastLogger = logger;
        return logger;
      }
    }
  }

  String get _rootNamespace {
    if (!namespace.contains('.')) {
      return namespace;
    }
    return namespace.split('.').first;
  }

  List<PVLogAdapter> _getAdapters(PreEventContext ctx) {
    final adapters = <PVLogAdapter>[];

    // Get global adapters
    adapters.addAll(PVLoggerRegistry.globalAdapters);

    // Get adapters for the current logger
    if (PVLoggerRegistry.adapters.containsKey(namespace)) {
      adapters.addAll(PVLoggerRegistry.adapters[namespace]!);
    }

    // Get adapters for the root logger
    final rootNamespace = _rootNamespace;
    if (PVLoggerRegistry.adapters.containsKey(rootNamespace)) {
      adapters.addAll(PVLoggerRegistry.adapters[rootNamespace]!);
    }

    // Filter adapters based on context
    final filteredAdapters = adapters.where((adapter) {
      if (adapter.levelFilter != null && ctx.level < adapter.levelFilter!) {
        return false;
      }

      if (adapter is Filter) {
        return adapter.filter(ctx);
      }

      return true;
    }).toList();

    return filteredAdapters;
  }

  PVLogEvent _buildEvent(
    PreEventContext context,
    StackTraceLine? trigger,
    List<PVLogAdapter> adapters,
  ) {
    for (var adapter in adapters) {
      if (adapter is EventBuilder) {
        adapter.buildEvent(context, adapters);
      }
    }

    return PVLogEvent.fromPreContext(context, trigger: trigger);
  }

  /// Synchronously logs a message.
  ///
  /// This method processes the log event immediately and blocks until all
  /// synchronous adapters have processed the event. Async adapters are
  /// skipped unless [allowAsyncSkip] is false.
  ///
  /// Parameters:
  /// - [message]: The message or data to log (can be any type)
  /// - [scopes]: Additional scopes for this specific log event
  /// - [extra]: Extra data to attach to the event
  /// - [allowAsyncSkip]: Whether to skip async adapters (default: true)
  /// - [level]: Override the logger's default level for this event
  ///
  /// Example:
  /// ```dart
  /// logger.logSync('Quick debug message');
  /// logger.logSync({'user': 'john', 'action': 'login'}, scopes: ['auth']);
  /// ```
  ///
  /// Throws [ArgumentError] if an async adapter is encountered and
  /// [allowAsyncSkip] is false.
  void logSync(
    dynamic message, {
    List<String>? scopes,
    Map<String, Map<String, dynamic>>? extra,
    bool allowAsyncSkip = true,
    int? level,
  }) {
    final eventContext = PreEventContext(
      raw: message,
      namespace: namespace,
      scopes: this.scopes.followedBy(scopes ?? []).toList(),
      extra: <String, Map<String, dynamic>>{...?extra},
      level: level ?? this.level,
      asyncCall: false,
    );

    final trigger = getTop(decrementLvs: 3);
    final adapters = _getAdapters(eventContext);
    final event = _buildEvent(eventContext, trigger, adapters);
    for (var adapter in adapters) {
      if (adapter is! Action) {
        continue;
      }
      if (adapter.isAsync && allowAsyncSkip) {
        continue;
      } else if (adapter.isAsync) {
        throw ArgumentError('Async adapter found in sync log call: $adapter');
      } else {
        adapter.action(event);
      }
    }
  }

  /// Asynchronously logs a message.
  ///
  /// This method processes the log event through all registered adapters,
  /// including both synchronous and asynchronous ones. This is the preferred
  /// method for most logging operations.
  ///
  /// Parameters:
  /// - [message]: The message or data to log (can be any type)
  /// - [scopes]: Additional scopes for this specific log event
  /// - [extra]: Extra data to attach to the event
  ///
  /// Example:
  /// ```dart
  /// await logger.log('Application started');
  /// await logger.log({'status': 'success', 'duration': 150});
  /// await logger.log('User action', scopes: ['user123', 'critical']);
  /// ```
  Future<void> log(
    dynamic message, {
    List<String>? scopes,
    Map<String, Map<String, dynamic>>? extra,
    int? level,
  }) async {
    final eventContext = PreEventContext(
      raw: message,
      namespace: namespace,
      scopes: this.scopes.followedBy(scopes ?? []).toList(),
      extra: <String, Map<String, dynamic>>{...?extra},
      level: level ?? this.level,
      asyncCall: true,
    );

    final trigger = getTop(decrementLvs: 3);
    final adapters = _getAdapters(eventContext);
    final event = _buildEvent(eventContext, trigger, adapters);
    for (var adapter in adapters) {
      if (adapter is Action) {
        if (adapter.isAsync) {
          await adapter.actionAsync(event);
        } else {
          adapter.action(event);
        }
      }
    }
  }

  /// Asynchronously logs an error with exception and stack trace information.
  ///
  /// This method is specifically designed for error handling. It creates
  /// special extra data containing the error and stack trace information
  /// that can be processed by EventBuilder adapters for formatting.
  ///
  /// Parameters:
  /// - [error]: The exception that occurred (can be null)
  /// - [stackTrace]: The stack trace (can be null)
  /// - [message]: Additional context message
  /// - [scopes]: Additional scopes for this error event
  /// - [extra]: Extra data to attach to the event
  /// - [level]: Override the logger's default level for this event
  ///
  /// Example:
  /// ```dart
  /// try {
  ///   await riskyOperation();
  /// } catch (error, stackTrace) {
  ///   await logger.catchError(error, stackTrace, 'Failed to process user data');
  /// }
  /// ```
  Future<void> catchError(
    Exception? error,
    StackTrace? stackTrace,
    dynamic message, {
    List<String>? scopes,
    Map<String, Map<String, dynamic>>? extra,
    int? level,
  }) async {
    final eventContext = PreEventContext(
      raw: [message, error, stackTrace],
      namespace: namespace,
      scopes: this.scopes.followedBy(scopes ?? []).toList(),
      extra: <String, Map<String, dynamic>>{
        ...?extra,
        'pvlogger_catch_error': {'error': error, 'stackTrace': stackTrace},
      },
      level: level ?? this.level,
      asyncCall: true,
    );

    final trigger = getTop(decrementLvs: 3);
    final adapters = _getAdapters(eventContext);
    final event = _buildEvent(eventContext, trigger, adapters);
    for (var adapter in adapters) {
      if (adapter is Action) {
        if (adapter.isAsync) {
          await adapter.actionAsync(event);
        } else {
          adapter.action(event);
        }
      }
    }
  }

  void catchErrorSync(
    Exception? error,
    StackTrace? stackTrace,
    dynamic message, {
    List<String>? scopes,
    Map<String, Map<String, dynamic>>? extra,
    bool allowAsyncSkip = true,
  }) {
    final eventContext = PreEventContext(
      raw: [message, error, stackTrace],
      namespace: namespace,
      scopes: this.scopes.followedBy(scopes ?? []).toList(),
      extra: <String, Map<String, dynamic>>{
        ...?extra,
        'pvlogger_catch_error': {'error': error, 'stackTrace': stackTrace},
      },
      level: level,
      asyncCall: false,
    );

    final trigger = getTop(decrementLvs: 3);
    final adapters = _getAdapters(eventContext);
    final event = _buildEvent(eventContext, trigger, adapters);
    for (var adapter in adapters) {
      if (adapter is! Action) {
        continue;
      }
      if (adapter.isAsync && allowAsyncSkip) {
        continue;
      } else if (adapter.isAsync) {
        throw ArgumentError('Async adapter found in sync log call: $adapter');
      } else {
        adapter.action(event);
      }
    }
  }
}
