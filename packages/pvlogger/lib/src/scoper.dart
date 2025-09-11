import 'package:pvlogger/src/ctx.dart';
import 'package:pvlogger/src/event.dart';
import 'package:pvlogger/src/registry.dart';
import 'package:pvlogger/src/utils.dart';
import 'package:pvlogger/utils/stack.dart';

class PVLogScoper {
  final PVLogConfig config;

  PVLogScoper({required this.config});

  void logSync(dynamic message, {Map<String, dynamic>? metadata}) {
    PVLogRegistry.callerSync(config, () {
      return PVLogEvent(
        originalNamespace: config.namespace,
        scopes: config.scopes,
        raw: message,
        timestamp: DateTime.now(),
        metadata: forbidPVLoggerPrefixInMetadata(metadata ?? {}),
        trigger: getTop(decrementLvs: 3),
      );
    });
  }

  Future<void> log(dynamic message, {Map<String, dynamic>? metadata}) async {
    PVLogRegistry.caller(config, () async {
      return PVLogEvent(
        originalNamespace: config.namespace,
        scopes: config.scopes,
        raw: message,
        timestamp: DateTime.now(),
        metadata: forbidPVLoggerPrefixInMetadata(metadata ?? {}),
        trigger: getTop(decrementLvs: 3),
      );
    });
  }

  void catchErrorSync({
    dynamic message,
    Exception? error,
    StackTrace? stackTrace,
    Map<String, dynamic>? metadata,
  }) {
    metadata ??= {};
    forbidPVLoggerPrefixInMetadata(metadata);
    metadata["pvlogger_is_catch_error"] = true;
    PVLogRegistry.callerSync(config, () {
      return PVLogEvent(
        originalNamespace: config.namespace,
        scopes: config.scopes,
        raw: [message, error, stackTrace],
        timestamp: DateTime.now(),
        metadata: metadata!,
        trigger: getTop(decrementLvs: 3),
      );
    });
  }

  Future<void> catchError({
    dynamic message,
    Exception? error,
    StackTrace? stackTrace,
    Map<String, dynamic>? metadata,
  }) async {
    metadata ??= {};
    forbidPVLoggerPrefixInMetadata(metadata);
    metadata["pvlogger_is_catch_error"] = true;
    PVLogRegistry.caller(config, () async {
      return PVLogEvent(
        originalNamespace: config.namespace,
        scopes: config.scopes,
        raw: [message, error, stackTrace],
        timestamp: DateTime.now(),
        metadata: metadata!,
        trigger: getTop(decrementLvs: 3),
      );
    });
  }
}
