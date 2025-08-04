import 'package:flutter/foundation.dart';

// ignore: non_constant_identifier_names
bool NO_DEBUG = true;


List<String> debugRanges = ["LRU", "LFU"];

cacheDebugPrint(message) {
  if (!NO_DEBUG) {
    if (debugRanges.isNotEmpty) {
      // if message does not contain any of the keywords in debugRanges, return
      if (!debugRanges.any((range) => message.contains(range))) {
        return;
      }
    }
    debugPrint(message);
  }
}
