import 'package:pvlogger/src/registry.dart';
import 'package:pvlogger/templates.dart';

bool _setupPrintLogger = false;

void setupPrintLogger() {
  if (_setupPrintLogger) {
    return;
  }
  _setupPrintLogger = true;
  PVLogRegistry.register(PVStdFormatter());
  PVLogRegistry.register(PVLogNicerPrinter());
}
