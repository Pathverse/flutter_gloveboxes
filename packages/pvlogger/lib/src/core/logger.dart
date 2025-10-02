import 'package:pvlogger/src/core/adapter.dart';
import 'package:pvlogger/src/core/event.dart';
import 'package:pvlogger/src/core/registry.dart';
import 'package:pvlogger/src/utils/stack.dart';

class PVLogger {
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

  final String namespace;
  final List<String> scopes;
  int level = 0;

  PVLogger._internal(this.namespace, {this.scopes = const []});

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

  void logSync(
    dynamic message, {
    List<String>? scopes,
    Map<String, Map<String, dynamic>>? extra,
    bool allowAsyncSkip = true,
  }) {
    final eventContext = PreEventContext(
      raw: message,
      namespace: namespace,
      scopes: this.scopes.followedBy(scopes ?? []).toList(),
      extra: <String, Map<String, dynamic>>{...?extra},
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

  Future<void> log(
    dynamic message, {
    List<String>? scopes,
    Map<String, Map<String, dynamic>>? extra,
  }) async {
    final eventContext = PreEventContext(
      raw: message,
      namespace: namespace,
      scopes: this.scopes.followedBy(scopes ?? []).toList(),
      extra: <String, Map<String, dynamic>>{...?extra},
      level: level,
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

  Future<void> catchError(
    Exception? error,
    StackTrace? stackTrace,
    dynamic message, {
    List<String>? scopes,
    Map<String, Map<String, dynamic>>? extra,
  }) async {
    final eventContext = PreEventContext(
      raw: [message, error, stackTrace],
      namespace: namespace,
      scopes: this.scopes.followedBy(scopes ?? []).toList(),
      extra: <String, Map<String, dynamic>>{
        ...?extra,
        'pvlogger_catch_error': {'error': error, 'stackTrace': stackTrace},
      },
      level: level,
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
