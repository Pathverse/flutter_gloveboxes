// ignore_for_file: avoid_print

import 'package:flutter/foundation.dart';
import 'package:pvlogger/src/adapter.dart';
import 'package:pvlogger/src/ctx.dart';
import 'package:pvlogger/src/event.dart';
import 'package:pvlogger/utils/serialize.dart';

class PVStdFormatter extends PVLogAdapter with Formatter {
  @override
  List<String> format(PVLogEvent event, {PVLogContext? ctx}) {
    List<String> formatted = [];
    if (event.metadata["pvlogger_is_catch_error"] == true) {
      if (event.raw[0] != null) {
        formatted.add(jsonify(event.raw[0]));
      }
      if (event.raw[1] != null) {
        formatted.add(jsonify(event.raw[1]));
      }
      if (event.raw[2] != null) {
        formatted.add(jsonify(event.raw[2]));
      }
    } else {
      formatted.add(jsonify(event.raw));
    }
    return formatted;
  }
}

class PVLogJustPrinter extends PVLogAdapter with Action {
  @override
  void action(PVLogEvent event, {PVLogContext? ctx}) {
    if (!kDebugMode) {
      return;
    }
    if (event.formatted.isEmpty) {
      return;
    }
    for (var formatted in event.formatted) {
      for (var line in formatted.split('\n')) {
        print(line);
      }
    }
  }
}

// from low severity to high severity icons
const iconList = [
  '🔍', // 0 - trace/debug - magnifying glass for detailed inspection
  'ℹ️', // 1 - info - information symbol
  '📝', // 2 - notice - memo/note for notable events
  '💡', // 3 - suggestion - lightbulb for hints/tips
  '⚠️', // 4 - warning - warning triangle
  '❗', // 5 - error - exclamation mark for errors
  '🚨', // 6 - critical - alarm/siren for critical issues
  '💥', // 7 - fatal - explosion for system failures
  '🔥', // 8 - emergency - fire for urgent situations
  '☠️', // 9 - catastrophic - skull for catastrophic failures
];

class PVLogNicerPrinter extends PVLogAdapter with Action {
  @override
  void action(PVLogEvent event, {PVLogContext? ctx}) {
    if (!kDebugMode) {
      return;
    }
    int lv = event.metadata["lv"] ?? 5;
    // Ensure the level is within bounds of the iconList
    int iconIndex = lv.clamp(0, iconList.length - 1);
    String icon = iconList[iconIndex];

    print('================================');
    print('$icon  ${event.originalNamespace} ${event.scopes.join(' > ')}');
    if (event.trigger != null) {
      print(event.trigger!.toFormatted());
      print("--------------------------------");
    }

    for (var formatted in event.formatted) {
      for (var line in formatted.split('\n')) {
        print(line);
      }
    }
    print("================================\n");
  }
}
