// ignore_for_file: avoid_print

import 'package:flutter/foundation.dart';
import 'package:pvlogger/src/core/adapter.dart';
import 'package:pvlogger/src/core/event.dart';
import 'package:pvlogger/src/utils/serialize.dart';

class PVStdFormatter extends PVLogAdapter with EventBuilder {
  @override
  void buildEvent(
    PreEventContext context,
    List<PVLogAdapter> upcomingAdapters,
  ) {
    // skip if no print adapter in upcoming adapters by checking intents
    bool hasPrintAdapter = upcomingAdapters.any(
      (adapter) => adapter.intents.contains(AdapterIntent.print),
    );
    if (!hasPrintAdapter) {
      return;
    }

    // Check if this is a catch error event
    if (context.extra.containsKey('pvlogger_catch_error')) {
      final errorData = context.extra['pvlogger_catch_error']!;
      final error = errorData['error'];
      final stackTrace = errorData['stackTrace'];

      // Create formatted catch error data using jsonify
      context.extra['pvlogger_catch_error_formatted'] = {
        'error': jsonify(error),
        'stackTrace': jsonify(stackTrace),
      };
    }

    // Always call jsonify on raw and save as pvlogger_formatted
    context.extra['pvlogger_formatted'] = {'formatted': jsonify(context.raw)};
  }
}

class PVLogJustPrinter extends PVLogAdapter with Action {
  final int level;

  PVLogJustPrinter({this.level = 4}); // Default level set to 4 (warning level)

  int? get levelFilter => level;

  @override
  void action(PVLogEvent event) {
    if (!kDebugMode) {
      return;
    }

    // Use formatted data if available, otherwise fallback to raw
    if (event.extra.containsKey('pvlogger_formatted')) {
      final formattedData = event.extra['pvlogger_formatted']!;
      final formatted = formattedData['formatted'] as List<String>;
      for (final line in formatted) {
        print(line);
      }
    } else {
      print(jsonify(event.raw));
    }
  }

  @override
  Future<void> actionAsync(PVLogEvent event) {
    throw UnimplementedError();
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
  void action(PVLogEvent event) {
    if (!kDebugMode) {
      return;
    }

    // Use event level, default to 5 (error level)
    int lv = event.level;
    // Ensure the level is within bounds of the iconList
    int iconIndex = lv.clamp(0, iconList.length - 1);
    String icon = iconList[iconIndex];

    print('================================');
    print('$icon  ${event.namespace} ${event.scopes.join(' > ')}');
    if (event.trigger != null) {
      print(event.trigger!.toFormatted());
      print("--------------------------------");
    }

    // Use formatted data if available, otherwise format raw data
    if (event.extra.containsKey('pvlogger_formatted')) {
      final formattedData = event.extra['pvlogger_formatted']!;
      final formatted = formattedData['formatted'] as List<String>;
      for (final formattedLine in formatted) {
        for (final line in formattedLine.split('\n')) {
          print(line);
        }
      }
    } else {
      final formatted = jsonify(event.raw);
      for (final line in formatted.split('\n')) {
        print(line);
      }
    }
    print("================================\n");
  }

  @override
  Future<void> actionAsync(PVLogEvent event) {
    throw UnimplementedError();
  }
}
