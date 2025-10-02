import 'dart:convert';
import 'package:pvlogger/src/utils/stack.dart';

/// Context information for a log event before it's fully constructed.
///
/// This class holds all the data about a logging event during the building phase.
/// EventBuilder adapters can modify the [extra] map to add processed data
/// before the final [PVLogEvent] is created.
///
/// The PreEventContext is mutable during the event building phase, allowing
/// adapters to enrich the data before final event creation.
class PreEventContext {
  /// The raw message or data being logged
  final dynamic raw;

  /// The namespace of the logger (e.g., 'app.auth', 'database')
  final String namespace;

  /// Contextual scopes attached to this log event
  final List<String> scopes;

  /// Runtime arguments passed to the logging call
  final Map<String, dynamic> runtimeArgs;

  /// Whether this is an async logging call
  final bool asyncCall;

  /// The severity level of this log event
  final int level;

  /// Extra data attached to this event, organized by adapter/purpose
  final Map<String, Map<String, dynamic>> extra;

  /// When this log event was created
  final DateTime timestamp;

  /// Creates a new pre-event context with the specified parameters.
  ///
  /// Parameters:
  /// - [raw]: The raw message or data being logged
  /// - [namespace]: The logger namespace
  /// - [extra]: Extra data map for adapters to store processed information
  /// - [scopes]: Contextual scopes (default: empty list)
  /// - [runtimeArgs]: Runtime arguments (default: empty map)
  /// - [asyncCall]: Whether this is an async call (default: false)
  /// - [level]: Severity level (default: 0)
  /// - [timestamp]: Event timestamp (default: current time)
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

  /// Converts the PreEventContext to a JSON-serializable map.
  ///
  /// This method creates a map representation of the context that can be
  /// easily serialized to JSON for debugging, storage, or transmission.
  ///
  /// [extraKeys] - Optional list of extra keys to include. If null or empty,
  /// all extra keys are included.
  ///
  /// Returns a Map\<String, dynamic> containing all the context data.
  Map<String, dynamic> toJson([List<String>? extraKeys]) {
    Map<String, Map<String, dynamic>> filteredExtra = {};

    if (extraKeys == null) {
      // If null, include all extra keys
      filteredExtra = extra;
    } else if (extraKeys.isEmpty) {
      // If empty list, include no extra keys
      filteredExtra = {};
    } else {
      // If list has items, include only those keys
      for (final key in extraKeys) {
        if (extra.containsKey(key)) {
          filteredExtra[key] = extra[key]!;
        }
      }
    }

    return {
      'raw': raw,
      'namespace': namespace,
      'scopes': scopes,
      'runtimeArgs': runtimeArgs,
      'asyncCall': asyncCall,
      'level': level,
      'extra': filteredExtra,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  /// Converts the PreEventContext to a JSON string.
  ///
  /// [extraKeys] - Optional list of extra keys to include. If null or empty,
  /// all extra keys are included.
  ///
  /// Returns a JSON string representation of the context.
  String toJsonString([List<String>? extraKeys]) {
    return jsonEncode(toJson(extraKeys));
  }
}

/// Represents a fully constructed log event ready for processing by Action adapters.
///
/// This is the final form of a log event after it has been processed by
/// EventBuilder adapters. It contains all the original data plus any
/// enhanced information added during the building phase.
///
/// PVLogEvent instances are immutable and passed to Action adapters
/// for final processing (printing, storing, sending, etc.).
class PVLogEvent {
  /// The namespace of the logger that created this event
  final String namespace;

  /// The original raw message or data
  final dynamic raw;

  /// When this event was created
  final DateTime timestamp;

  /// Extra data added by EventBuilder adapters
  final Map<String, Map<String, dynamic>> extra;

  /// Stack trace information for where the log call originated
  final StackTraceLine? trigger;

  /// Contextual scopes attached to this event
  final List<String> scopes;

  /// Runtime arguments from the original log call
  final Map<String, dynamic> runtimeArgs;

  /// Whether this was an async logging call
  final bool asyncCall;

  /// The severity level of this event
  final int level;

  /// Returns a list of all keys in the extra data map
  List<String> get extraKeys => extra.keys.toList();

  /// Converts the PVLogEvent to a JSON-serializable map.
  ///
  /// This method creates a comprehensive map representation of the event
  /// that can be serialized to JSON for debugging, storage, transmission,
  /// or integration with external logging systems.
  ///
  /// The trigger stack trace information is included as a formatted string
  /// if available, making it human-readable in JSON output.
  ///
  /// [extraKeys] - Optional list of extra keys to include. If null or empty,
  /// all extra keys are included.
  ///
  /// Returns a Map\<String, dynamic> containing all the event data.
  Map<String, dynamic> toJson([List<String>? extraKeys]) {
    Map<String, Map<String, dynamic>> filteredExtra = {};

    if (extraKeys == null) {
      // If null, include all extra keys
      filteredExtra = extra;
    } else if (extraKeys.isEmpty) {
      // If empty list, include no extra keys
      filteredExtra = {};
    } else {
      // If list has items, include only those keys
      for (final key in extraKeys) {
        if (extra.containsKey(key)) {
          filteredExtra[key] = extra[key]!;
        }
      }
    }

    return {
      'namespace': namespace,
      'raw': raw,
      'timestamp': timestamp.toIso8601String(),
      'extra': filteredExtra,
      'trigger': trigger?.toFormatted(),
      'scopes': scopes,
      'runtimeArgs': runtimeArgs,
      'asyncCall': asyncCall,
      'level': level,
    };
  }

  /// Converts the event to a JSON string.
  ///
  /// [extraKeys] - Optional list of extra keys to include. If null or empty,
  /// all extra keys are included.
  ///
  /// Returns a JSON string representation of the event.
  String toJsonString([List<String>? extraKeys]) {
    return jsonEncode(toJson(extraKeys));
  }

  /// Creates a new PVLogEvent with the specified parameters.
  ///
  /// Parameters:
  /// - [namespace]: The logger namespace
  /// - [raw]: The original message or data
  /// - [timestamp]: Event creation time (default: current time)
  /// - [extra]: Extra data from EventBuilder adapters (default: empty)
  /// - [trigger]: Stack trace information (default: null)
  /// - [scopes]: Contextual scopes (default: empty)
  /// - [runtimeArgs]: Runtime arguments (default: empty)
  /// - [asyncCall]: Whether this was an async call (default: false)
  /// - [level]: Severity level (default: 0)
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

  /// Creates a PVLogEvent from a PreEventContext.
  ///
  /// This factory method is used internally by the logging system to convert
  /// a mutable PreEventContext (after processing by EventBuilder adapters)
  /// into an immutable PVLogEvent for final processing.
  ///
  /// Parameters:
  /// - [context]: The pre-event context to convert
  /// - [trigger]: Optional stack trace information to attach
  ///
  /// Returns a new PVLogEvent with data copied from the context.
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
