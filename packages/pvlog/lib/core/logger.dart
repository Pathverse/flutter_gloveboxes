import 'package:flutter/foundation.dart';
import 'package:pvlog/core/enums.dart';
import 'package:pvlog/core/top.dart';
import 'package:pvlog/utils/serialize.dart';
import 'package:pvlog/utils/stack.dart';

part 'event.dart';
part 'adapter.dart';

class PVLogger {
  final PVLevel level;
  final String? namespace;
  final Set<PvLogAdapter> _adapters;

  PVLogger({
    this.level = PVLevel.all,
    Set<PvLogAdapter> adapters = const {},
    this.namespace,
  }) : _adapters = adapters;

  Set<PvLogAdapter> get adapters => _adapters.toSet();

  PVLogger sub({
    PVLevel? level,
    String? namespace,
  }) {
    PVLevel newlevel = level ?? this.level;
    // namespace inherits via .
    if (this.namespace != null) {
      namespace = '${this.namespace}.$namespace'; 
    }

    return PVLogger(
      level: newlevel,
      namespace: namespace,
      adapters: adapters,
    );
  }

  Set<PvLogAdapter> _getAdapters() {
    if (!PVLoggerGlobal.globalAdaptersEnabled) {
      return adapters;
    }

    if (adapters.isEmpty) {
      return PVLoggerGlobal.globalAdapters.toSet();
    }

    if (PVLoggerGlobal.globalAdaptersRunFirst) {
      return PVLoggerGlobal.globalAdapters.union(adapters);
    }

    return adapters.union(PVLoggerGlobal.globalAdapters);
  }

  bool _shouldNotFilter() {
    if (!PVLoggerGlobal.enabled) {
      return false;
    }

    for (var adapter in _getAdapters()) {
      if (adapter.hasFilter) {
        if (!adapter.shouldLog(this)) {
          return false;
        }
      }
    }

    return true;
  }

  void _handle(PVLogEvent event) {
    var gatheredAdapters = _getAdapters();

    for (var adapter in gatheredAdapters) {
      if (adapter.hasFormatter) {
        final lines = adapter.format(event);
        event.formatted.clear();
        event.formatted.addAll(lines);
      }
    }

    for (var adapter in gatheredAdapters) {
      if (adapter.hasOutput) {
        adapter.output(event);
      }
      if (adapter.hasForward) {
        adapter.forward(event);
      }
    }
  }

  void print(dynamic message) {
    /// print with filter, only works in debug mode
    /// no logevent will be created
    if (!kDebugMode) return;

    if (!_shouldNotFilter()) {
      return;
    }

    for (var line in jsonify(message).split('\n')) {
      debugPrint(line);
    }
  }

  void debug(dynamic message, {Map<String, dynamic>? extra}) {
    if (!_shouldNotFilter()) {
      return;
    }

    PVLogEvent event = PVLogEvent(
      logType: 'debug',
      logger: this,
      raw: message,
      trigger: getTop(),
      metadata: extra ?? {},
    );

    _handle(event);
  }

  void log(dynamic message, {Map<String, dynamic>? extra}) {
    if (!_shouldNotFilter()) {
      return;
    }

    PVLogEvent event = PVLogEvent(
      logType: 'log',
      logger: this,
      raw: message,
      trigger: getTop(),
      metadata: extra ?? {},
    );

    _handle(event);
  }

  void cat(Exception? e, StackTrace? s, {Map<String, dynamic>? extra}) {
    if (!_shouldNotFilter()) {
      return;
    }

    var catMap = {"__e": e, "__s": s};
    if (extra != null) {
      catMap.addAll(extra);
    }

    PVLogEvent event = PVLogEvent(
      logType: 'cat',
      logger: this,
      raw: e.toString(),
      trigger: getTop(),
      metadata: catMap,
    );

    _handle(event);
  }
}
