part of 'logger.dart';

class PVLoggerEvent {
  final String originalNamespace;
  final PVLogger? initialLogger;
  final List<PVLogger> forwardedLoggers;
  final dynamic raw;
  final DateTime timestamp;
  final StackTraceLine? trigger;
  final Map<String, dynamic> globalContext;
  final Map<String, dynamic> metadata;
  late final Map<String, Map<String, dynamic>> _context;

  List<String> get availableNamespaces {
    final results = <String>[];
    if (initialLogger != null) {
      results.add(initialLogger!.namespace);
    }
    for (final logger in forwardedLoggers) {
      results.add(logger.namespace);
    }

    return results;
  }

  PVLoggerEvent({
    required this.originalNamespace,
    this.initialLogger,
    List<PVLogger>? forwardedLoggers,
    required this.raw,
    required this.timestamp,
    this.trigger,
    Map<String, dynamic>? metadata,
    Map<String, dynamic>? globalContext,
    Map<String, Map<String, dynamic>>? context,
  }) : forwardedLoggers = forwardedLoggers ?? <PVLogger>[],
       globalContext = globalContext ?? <String, dynamic>{},
       metadata = metadata ?? const <String, dynamic>{} {
    _context = context ?? <String, Map<String, dynamic>>{};
  }

  Map<String, dynamic> currentContext(PVLogger logger) {
    if (!_context.containsKey(logger.namespace)) {
      _context[logger.namespace] = {};
    }
    return _context[logger.namespace]!;
  }

  Map<String, dynamic> getContext(PVLogger logger, String namespace) {
    if (!availableNamespaces.contains(namespace)) {
      throw ArgumentError("Unknown namespace: $namespace");
    }
    if (!_context.containsKey(namespace)) {
      _context[namespace] = {};
    }
    if (logger.namespace != namespace) {
      return Map.unmodifiable(_context[logger.namespace]!);
    }
    return _context[namespace]!;
  }

  PVLoggerEvent transform(PVLoggerEvent event) {
    return PVLoggerEvent(
      originalNamespace: event.originalNamespace,
      initialLogger: event.initialLogger,
      forwardedLoggers: event.forwardedLoggers,
      raw: event.raw,
      timestamp: event.timestamp,
      trigger: event.trigger,
      metadata: event.metadata,
      context: event._context,
    );
  }

  Map<String, dynamic> toJson() {
    final map = {
      "namespace": originalNamespace,
      "timestamp": timestamp.toIso8601String(),
      "metadata": metadata,
    };
    if (trigger != null) {
      map["trigger"] = trigger!.toString();
    }

    if (!globalContext.containsKey("jsonify")) {
      globalContext["jsonify"] = jsonify(raw);
    }
    map["message"] = globalContext["jsonify"];
    return map;
  }
}
