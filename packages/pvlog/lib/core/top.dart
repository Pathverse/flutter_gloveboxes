import 'package:pvlog/core/logger.dart';

class PVLoggerGlobal {
  static bool enabled = false;
  static final Set<PvLogAdapter> globalAdapters = {};
  static bool globalAdaptersRunFirst = true;
  static bool globalAdaptersEnabled = true;
}
