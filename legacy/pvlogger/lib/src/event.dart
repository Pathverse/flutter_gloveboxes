import 'package:pvlogger/utils/serialize.dart';
import 'package:pvlogger/utils/stack.dart';

class PVLogEvent {
  final String originalNamespace;
  final dynamic raw;
  final DateTime timestamp;
  final StackTraceLine? trigger;
  final List<String> scopes;
  final Map<String, dynamic> _metadata;
  final List<String> formatted;


  PVLogEvent({
    required this.originalNamespace,
    required this.raw,
    required this.timestamp,
    this.trigger,
    required this.scopes,
    Map<String, dynamic>? metadata,
    List<String>? formatted,
  }) : formatted = formatted ?? <String>[],
    _metadata = metadata ?? <String, dynamic>{};

  Map<String, dynamic> get metadata => Map.unmodifiable(_metadata);

  PVLogEvent transform(PVLogEvent event) {
    return PVLogEvent(
      originalNamespace: event.originalNamespace,
      raw: event.raw,
      timestamp: event.timestamp,
      trigger: event.trigger,
      scopes: event.scopes,
      metadata: event.metadata,
      formatted: event.formatted,
    );
  }

  Map<String, dynamic> toJson() {
    final map = {
      "namespace": originalNamespace,
      "timestamp": timestamp.toIso8601String(),
      "metadata": metadata,
      "scopes": scopes,
    };

    if (formatted.isNotEmpty) {
      map["formatted"] = formatted;
    } else {
      map["formatted"] = jsonify(raw);
    }
    if (trigger != null) {
      map["trigger"] = trigger!.toString();
    }
    return map;
  }

  PVLogEvent fromMap(Map<String, dynamic> map) {
    return PVLogEvent(
      originalNamespace: map["namespace"],
      raw: map["formatted"],
      formatted: map["formatted"],
      timestamp: DateTime.parse(map["timestamp"]),
      trigger: StackTraceLine.fromString(map["trigger"]),
      scopes: map["scopes"],
      metadata: map["metadata"],
    );
  }
}
