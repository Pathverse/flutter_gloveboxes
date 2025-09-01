import 'package:flutter/foundation.dart';
import 'package:pvlogger/src/logger.dart';

class PrintLogger extends PVLogger {

  factory PrintLogger(String namespace, {String? nextLogger, PVLoggerConfig config = const PVLoggerConfig()}) {
    return PrintLogger._internal(namespace, nextLogger: nextLogger, config: config);
  }

  PrintLogger._internal(String namespace, {super.nextLogger, required super.config})
    : super.internal(namespace: namespace);

  @override
  void action(PVLoggerEvent event) {
    if (kDebugMode) {
      print("[$namespace] ${event.raw}");
    }
  }
}
