import 'package:pvlogger/src/core/logger.dart';
import 'package:pvlogger/templates/print.dart';

export 'package:pvlogger/src/core/adapter.dart';
export 'package:pvlogger/src/core/event.dart';
export 'package:pvlogger/src/core/logger.dart';


PVLogger quickLogger(String namespace, {List<String> scopes = const [], bool nicePrint = false}) {
  final logger = PVLogger(namespace, scopes: scopes);
  PVLogger.registerAdapter(PVStdFormatter());
  if (nicePrint) {
    PVLogger.registerAdapter(PVLogNicerPrinter());
  } else {
    PVLogger.registerAdapter(PVLogJustPrinter());
  }
  return logger;
}
