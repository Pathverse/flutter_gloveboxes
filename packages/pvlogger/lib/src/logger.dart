import 'package:pvlogger/utils/serialize.dart';
import 'package:pvlogger/utils/stack.dart';

part 'event.dart';
part 'config.dart';

class PVLogger {
  static final Map<String, PVLogger> _loggers = {};
  final String namespace;
  final PVLoggerConfig config;
  final String? _nextLogger;

  static List<String> get namespaces => _loggers.keys.toList();

  factory PVLogger({
    String namespace = "default",
    String? nextLogger,
    PVLoggerConfig config = const PVLoggerConfig(),
  }) {
    return _loggers.putIfAbsent(
      namespace,
      () => PVLogger.internal(
        namespace: namespace,
        nextLogger: nextLogger,
        config: config,
      ),
    );
  }

  PVLogger.internal({
    required this.namespace,
    String? nextLogger,
    required this.config,
  }) : _nextLogger = nextLogger;

  PVLoggerEvent createEvent(
    dynamic message,
    StackTraceLine? trigger,
    DateTime timestamp, {
    Map<String, dynamic>? metadata,
  }) {
    final event = PVLoggerEvent(
      originalNamespace: namespace,
      initialLogger: this,
      raw: message,
      timestamp: timestamp,
      trigger: trigger,
      metadata: metadata,
    );
    if (config.enableDirectJsonify) {
      event.globalContext["jsonify"] = jsonify(event.raw);
    }

    return event;
  }

  void logEvent(PVLoggerEvent event) {
    if (config.enableChainOfResponsibility) {
      event.forwardedLoggers.add(this);
    }
    if (!shouldLog(event)) {
      return;
    }
    if (!shouldFilter(event)) {
      action(event);
    }

    if (shouldForward(event)) {
      forward(event);
    }
  }

  void log(dynamic message, {Map<String, dynamic>? metadata}) {
    StackTraceLine? trigger;
    if (config.enableStackTraceLine) {
      trigger = getTop();
    }

    final event = createEvent(
      message,
      trigger,
      DateTime.now(),
      metadata: metadata,
    );
    logEvent(event);
  }

  void action(PVLoggerEvent event) {
    return;
  }

  void forward(PVLoggerEvent event) {
    if (_nextLogger != null) {
      final next = PVLogger(namespace: _nextLogger);

      next.logEvent(event);
    }
  }

  bool shouldLog(PVLoggerEvent event) {
    return true;
  }

  bool shouldFilter(PVLoggerEvent event) {
    return false;
  }

  bool shouldForward(PVLoggerEvent event) {
    if (_nextLogger != null) {
      return true;
    }
    return false;
  }
}
