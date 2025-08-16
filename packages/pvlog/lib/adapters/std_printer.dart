import 'package:flutter/foundation.dart';
import 'package:pvlog/core/logger.dart';
import 'package:pvlog/utils/serialize.dart';

class StdPrinter extends PvLogAdapter {
  final bool performFormat;

  StdPrinter({this.performFormat = true});

  @override
  bool get hasOutput => true;

  @override
  bool get hasFormatter => performFormat;

  @override
  List<String> format(PVLogEvent event) {
    return jsonify(event.raw).split('\n');
  }

  @override
  void output(PVLogEvent event) {
    // Only print in debug mode, similar to logger.dart print method
    if (!kDebugMode) return;

    // Use jsonify to serialize the raw message, same as print
    final List<String> serialized;
    if (performFormat) {
      serialized = event.formatted;
    } else {
      serialized = jsonify(event.raw).split('\n');
    }
    // Split by newlines and print each line using debugPrint
    for (var line in serialized) {
      debugPrint(line);
    }
  }

  @override
  String toString() {
    return 'StdPrinter{id: $id}';
  }
}
