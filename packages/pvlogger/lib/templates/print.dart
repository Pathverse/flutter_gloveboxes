// ignore_for_file: avoid_print

import 'package:pvlogger/src/core/adapter.dart';
import 'package:pvlogger/src/core/event.dart';
import 'package:pvlogger/src/utils/serialize.dart';

/// Simple debug mode detection for pure Dart environment.
///
/// In pure Dart, we can't rely on Flutter's kDebugMode, so we use
/// assert statements which are only active in debug mode.
bool get kDebugMode {
  bool debugMode = false;
  assert(debugMode = true);
  return debugMode;
}

/// Standard formatter that prepares log data for printing adapters.
///
/// This EventBuilder adapter processes log events and creates formatted
/// representations using JSON serialization. It handles both regular
/// messages and error events with special formatting.
///
/// The formatter only processes events when print adapters are present
/// in the pipeline, optimizing performance when printing is not needed.
///
/// Created extra data:
/// - 'pvlogger_formatted': Contains the JSON-formatted raw message
/// - 'pvlogger_catch_error_formatted': Contains formatted error and stack trace
///   (only for catch error events)
class PVStdFormatter extends PVLogAdapter with EventBuilder {
  /// Formats log data for printing adapters.
  ///
  /// This method processes the event context and creates formatted data
  /// that printing adapters can use. It performs JSON serialization of
  /// the raw message and handles special formatting for error events.
  ///
  /// Performance optimization: Only processes events when print adapters
  /// are present in the upcoming adapters list.
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

/// Simple printer adapter that outputs formatted log data to console.
///
/// This Action adapter prints log events using Dart's print() function.
/// It only operates in debug mode and supports level filtering.
/// The printer uses formatted data created by PVStdFormatter if available,
/// otherwise falls back to raw message formatting.
///
/// Features:
/// - Debug-mode only printing (respects kDebugMode)
/// - Level-based filtering
/// - Uses pre-formatted data when available
/// - Simple line-by-line output
class PVLogJustPrinter extends PVLogAdapter with Action {
  /// The minimum level for events to be printed
  final int level;

  /// Creates a new PVLogJustPrinter with optional level filtering.
  ///
  /// Parameters:
  /// - [level]: Minimum level for events to be printed (default: 4)
  PVLogJustPrinter({this.level = 4}); // Default level set to 4 (warning level)

  @override
  List<AdapterIntent> get intents => [
    AdapterIntent.action,
    AdapterIntent.print,
  ];

  @override
  int? get levelFilter => level;

  /// Prints the log event to console.
  ///
  /// Only prints in debug mode. Uses formatted data from PVStdFormatter
  /// if available, otherwise formats the raw message directly.
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

/// Icons representing different log levels from low to high severity.
///
/// These icons are used by PVLogNicerPrinter to provide visual indicators
/// for different severity levels in log output. The array is indexed by
/// log level (0-9), with higher indices representing higher severity.
///
/// Levels:
/// - 0: 🔍 trace/debug - magnifying glass for detailed inspection
/// - 1: ℹ️ info - information symbol
/// - 2: 📝 notice - memo/note for notable events
/// - 3: 💡 suggestion - lightbulb for hints/tips
/// - 4: ⚠️ warning - warning triangle
/// - 5: ❗ error - exclamation mark for errors
/// - 6: 🚨 critical - alarm/siren for critical issues
/// - 7: 💥 fatal - explosion for system failures
/// - 8: 🔥 emergency - fire for urgent situations
/// - 9: ☠️ catastrophic - skull for catastrophic failures
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

/// Enhanced printer adapter that provides rich, formatted console output.
///
/// This Action adapter creates visually appealing log output with:
/// - Level-based icons for quick visual identification
/// - Formatted headers with namespace and scopes
/// - Stack trace information when available
/// - Bordered sections for clear separation
/// - Multi-line content formatting
///
/// The printer only operates in debug mode and uses formatted data
/// from PVStdFormatter when available.
///
/// Example output:
/// ```
/// ================================
/// ⚠️  app.auth user123 > login
/// main.dart:45 in loginUser
/// --------------------------------
/// {
///   "user": "john_doe",
///   "timestamp": "2023-10-01T12:00:00Z"
/// }
/// ================================
/// ```
class PVLogNicerPrinter extends PVLogAdapter with Action {
  /// Prints the log event with enhanced formatting and visual elements.
  ///
  /// Creates a formatted output with level icons, namespace information,
  /// stack trace details, and properly formatted content within borders.
  /// Only operates in debug mode.
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
