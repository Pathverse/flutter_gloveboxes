import 'package:pvlogger/src/core/event.dart';

/// Defines the types of operations that adapters can perform.
///
/// These intents help categorize adapters and can be used for filtering
/// or optimization purposes within the logging pipeline.
enum AdapterIntent {
  /// Adapter filters log events based on criteria
  filter,

  /// Adapter performs actions on log events (e.g., writing, sending)
  action,

  /// Adapter handles printing/displaying log events
  print,

  /// Adapter sends log events via HTTP
  http,

  /// Adapter stores log events to persistent storage
  storage,

  /// Adapter has unknown or unspecified purpose
  unknown,

  /// Adapter performs custom operations
  custom,

  /// Adapter handles error-specific processing
  error,

  /// Adapter builds or modifies event data
  buildEvent,
}

/// Base class for all logging adapters in the PVLogger system.
///
/// Adapters extend this class and implement specific mixins ([EventBuilder],
/// [Action], [Filter]) to define their behavior. Each adapter can declare
/// its intents and level filtering requirements.
///
/// Example:
/// ```dart
/// class MyAdapter extends PVLogAdapter with Action {
///   @override
///   List<AdapterIntent> get intents => [AdapterIntent.print];
///
///   @override
///   int? get levelFilter => 3; // Only process level 3 and above
///
///   @override
///   void action(PVLogEvent event) {
///     // Custom logging logic
///   }
/// }
/// ```
class PVLogAdapter {
  /// The types of operations this adapter can perform.
  ///
  /// Override this getter to declare what the adapter does. This can be used
  /// for optimization and filtering purposes.
  List<AdapterIntent> get intents => [];

  /// The minimum level required for events to be processed by this adapter.
  ///
  /// If null, all events are processed regardless of level. If set to a value,
  /// only events with level >= [levelFilter] will be processed.
  int? get levelFilter => null;
}

/// Mixin for adapters that modify or enhance event data before processing.
///
/// EventBuilder adapters are called during the event creation phase and can
/// modify the [PreEventContext] to add formatted data, enrich information,
/// or perform preprocessing.
///
/// Example:
/// ```dart
/// class TimestampBuilder extends PVLogAdapter with EventBuilder {
///   @override
///   void buildEvent(PreEventContext context, List<PVLogAdapter> upcomingAdapters) {
///     context.extra['timestamp_formatted'] = {
///       'iso': context.timestamp.toIso8601String(),
///       'local': context.timestamp.toLocal().toString(),
///     };
///   }
/// }
/// ```
mixin EventBuilder on PVLogAdapter {
  @override
  List<AdapterIntent> get intents => [AdapterIntent.buildEvent];

  /// Modifies the event context before the final event is created.
  ///
  /// This method is called during event building and allows the adapter to:
  /// - Add or modify data in [context.extra]
  /// - Inspect [upcomingAdapters] to optimize processing
  /// - Perform any preprocessing needed for later adapters
  ///
  /// Parameters:
  /// - [context]: The mutable pre-event context
  /// - [upcomingAdapters]: List of adapters that will process this event
  void buildEvent(PreEventContext context, List<PVLogAdapter> upcomingAdapters);
}

/// Mixin for adapters that perform actions on log events.
///
/// Action adapters are the primary processors of log events. They handle
/// the final processing such as writing to files, sending to servers,
/// printing to console, etc.
///
/// Example:
/// ```dart
/// class FileWriterAdapter extends PVLogAdapter with Action {
///   @override
///   bool get isAsync => true;
///
///   @override
///   void action(PVLogEvent event) {
///     throw UnimplementedError('Use actionAsync for file operations');
///   }
///
///   @override
///   Future<void> actionAsync(PVLogEvent event) async {
///     await File('app.log').writeAsString('${event.raw}\n', mode: FileMode.append);
///   }
/// }
/// ```
mixin Action on PVLogAdapter {
  @override
  List<AdapterIntent> get intents => [AdapterIntent.action];

  /// Whether this adapter requires async processing.
  ///
  /// If true, only [actionAsync] will be called. If false, only [action]
  /// will be called. Sync logging calls will skip async adapters unless
  /// explicitly configured otherwise.
  bool get isAsync => false;

  /// Synchronously processes a log event.
  ///
  /// This method is called for sync logging operations when [isAsync] is false.
  /// Implement the main logic for handling the log event here.
  void action(PVLogEvent event);

  /// Asynchronously processes a log event.
  ///
  /// This method is called for async logging operations when [isAsync] is true,
  /// or for all Action adapters during async logging calls.
  Future<void> actionAsync(PVLogEvent event);
}

/// Mixin for adapters that filter log events based on criteria.
///
/// Filter adapters determine whether an event should be processed by
/// subsequent adapters in the pipeline. They are called early in the
/// processing chain.
///
/// Example:
/// ```dart
/// class ScopeFilter extends PVLogAdapter with Filter {
///   final List<String> allowedScopes;
///
///   ScopeFilter(this.allowedScopes);
///
///   @override
///   bool filter(PreEventContext context) {
///     return context.scopes.any((scope) => allowedScopes.contains(scope));
///   }
/// }
/// ```
mixin Filter on PVLogAdapter {
  @override
  List<AdapterIntent> get intents => [AdapterIntent.filter];

  /// Determines whether the event should be processed.
  ///
  /// Return true to allow the event to continue through the pipeline,
  /// or false to stop processing for this event.
  ///
  /// Parameters:
  /// - [context]: The pre-event context to evaluate
  ///
  /// Returns true if the event should be processed, false otherwise.
  bool filter(PreEventContext context);
}
