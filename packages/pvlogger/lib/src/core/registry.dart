import 'package:pvlogger/src/core/adapter.dart';
import 'package:pvlogger/src/core/logger.dart';

class PVLoggerRegistry {
  static final Map<String, PVLogger> rootLoggers = {};
  static final Map<String, Map<String, PVLogger>> childLoggers = {};
  static PVLogger? lastLogger;

  static final Map<String, List<PVLogAdapter>> adapters = {};
  static final List<PVLogAdapter> globalAdapters = [];
}
