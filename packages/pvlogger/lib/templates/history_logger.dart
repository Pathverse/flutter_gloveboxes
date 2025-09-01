import 'package:pvlogger/src/logger.dart';

class HistoryLogger extends PVLogger {
  final List<PVLoggerEvent> events = [];
  final int maxHistorySize;

  factory HistoryLogger(String namespace, {String? nextLogger, PVLoggerConfig config = const PVLoggerConfig(), int maxHistorySize = 100}) {
    return HistoryLogger._internal(namespace, nextLogger: nextLogger, config: config, maxHistorySize: maxHistorySize);
  }

  HistoryLogger._internal(String namespace, {super.nextLogger, required super.config, required this.maxHistorySize})
    : super.internal(namespace: namespace);

  @override
  void action(PVLoggerEvent event) {
    events.add(event);
    if (events.length > maxHistorySize) {
      events.removeAt(0);
    }
  }
}
