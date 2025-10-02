import 'package:pvlogger/src/utils/stack.dart';

class PreEventContext {
  final dynamic raw;
  final String namespace;
  final List<String> scopes;
  final Map<String, dynamic> runtimeArgs;
  final bool asyncCall;
  final int level;
  final Map<String, Map<String, dynamic>> extra;
  final DateTime timestamp;

  PreEventContext({
    required this.raw,
    required this.namespace,
    required this.extra,
    this.scopes = const [],
    this.runtimeArgs = const {},
    this.asyncCall = false,
    this.level = 0,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();
}

class PVLogEvent {
  final String namespace;
  final dynamic raw;
  final DateTime timestamp;
  final Map<String, Map<String, dynamic>> extra;
  final StackTraceLine? trigger;

  final List<String> scopes;
  final Map<String, dynamic> runtimeArgs;
  final bool asyncCall;
  final int level;

  List<String> get extraKeys => extra.keys.toList();

  PVLogEvent({
    required this.namespace,
    required this.raw,
    DateTime? timestamp,
    Map<String, Map<String, dynamic>>? extra,
    this.trigger,
    List<String>? scopes,
    this.runtimeArgs = const {},
    this.asyncCall = false,
    this.level = 0,
  }) : timestamp = timestamp ?? DateTime.now(),
       extra = extra ?? {},
       scopes = scopes ?? [];

  factory PVLogEvent.fromPreContext(
    PreEventContext context, {
    StackTraceLine? trigger,
  }) {
    return PVLogEvent(
      namespace: context.namespace,
      raw: context.raw,
      trigger: trigger,
      extra: {...context.extra},
      scopes: context.scopes,
      runtimeArgs: context.runtimeArgs,
      asyncCall: context.asyncCall,
      level: context.level,
    );
  }
}
