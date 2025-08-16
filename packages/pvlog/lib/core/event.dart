part of 'logger.dart';

class PVLogEvent {
  final String logType;
  final PVLogger logger;
  final dynamic raw;
  final Map<String, dynamic> metadata;
  final StackTraceLine trigger;
  final List<String> formatted;
  final DateTime timestamp;

  PVLogEvent({
    required this.logType,
    required this.raw,
    required this.logger,
    required this.trigger,
    this.metadata = const {},
    this.formatted = const [],
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();
}
