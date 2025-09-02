import 'package:pvcacher/src/adapter.dart';
import 'package:pvcacher/src/ctx.dart';

/// Adapter that handles cache expiration based on options/metadata
///
/// Supports multiple expiry formats in options:
/// - 'expiry': Duration in seconds from now
/// - 'expiryTime': Specific UTC timestamp (ISO8601 string)
/// - 'ttl': Time-to-live in seconds (alias for 'expiry')
/// - 'expires': Specific UTC timestamp (alias for 'expiryTime')
class ExpiredAdapter extends PVCacheAdapter
    with PVPreset, PVPreHandlerOperation, PVPostSet {
  static const String _expiryKey = '_pvcache_expiry_utc';

  /// Processes expiry options during set operations.
  ///
  /// Calculates the absolute expiry timestamp from various user-provided
  /// formats and stores it in the context options for metadata persistence.
  ///
  /// [ctx] - Context containing the operation details and options
  @override
  Future<void> preSet(PVCacheCtx ctx) async {
    final expiryTime = _calculateExpiryTime(ctx.options);
    if (expiryTime != null) {
      // Store the expiry time in options so StdHandler can save it as metadata
      ctx.options[_expiryKey] = expiryTime.toIso8601String();
    }
  }

  /// Cleans up user-facing expiry options after set operation.
  ///
  /// Removes the original expiry options from context to keep only
  /// the internal normalized expiry timestamp for metadata storage.
  ///
  /// [ctx] - Context containing the operation details and options
  @override
  Future<void> postSet(PVCacheCtx ctx) async {
    // Remove user-facing expiry options but keep our internal expiry key
    ctx.options.remove('expiry');
    ctx.options.remove('expiryTime');
    ctx.options.remove('ttl');
    ctx.options.remove('expires');
  }

  /// Checks for expired items during get operations.
  ///
  /// This hook runs after metadata has been loaded, allowing access to
  /// stored expiry timestamps. If an item has expired, it's automatically
  /// removed and the get operation is aborted.
  ///
  /// [ctx] - Context containing the operation details and loaded metadata
  @override
  Future<void> preHandlerOperation(PVCacheCtx ctx) async {
    // Only check expiry on get operations
    if (ctx.callingFunc != 'get') return;

    // Check if the item has expired by looking at stored metadata
    final expiryString = await _getExpiryFromStorage(ctx);

    if (expiryString != null) {
      final expiryTime = DateTime.parse(expiryString);
      final now = DateTime.now().toUtc();

      if (now.isAfter(expiryTime)) {
        // Item has expired - trigger removal and abort the get operation
        await _removeExpiredItem(ctx);
        ctx.flags.abort = true;
        ctx.result = null;
      }
    }
  }

  /// Calculates absolute expiry timestamp from various option formats.
  ///
  /// Supports multiple input formats:
  /// - 'expiry'/'ttl': Duration in seconds from current time
  /// - 'expiryTime'/'expires': Absolute UTC timestamp as ISO8601 string
  ///
  /// Returns null if no expiry options are provided.
  ///
  /// [options] - Map containing expiry configuration
  DateTime? _calculateExpiryTime(Map<String, dynamic> options) {
    final now = DateTime.now().toUtc();

    // Check for 'expiry' or 'ttl' (seconds from now)
    final expiry = options['expiry'] ?? options['ttl'];
    if (expiry != null) {
      if (expiry is int) {
        return now.add(Duration(seconds: expiry));
      } else if (expiry is Duration) {
        return now.add(expiry);
      }
    }

    // Check for 'expiryTime' or 'expires' (specific timestamp)
    final expiryTime = options['expiryTime'] ?? options['expires'];
    if (expiryTime != null) {
      if (expiryTime is String) {
        try {
          return DateTime.parse(expiryTime).toUtc();
        } catch (e) {
          // Invalid timestamp format, ignore
        }
      } else if (expiryTime is DateTime) {
        return expiryTime.toUtc();
      }
    }

    return null;
  }

  /// Retrieves stored expiry timestamp from cache metadata.
  ///
  /// Accesses the expiry timestamp that was saved during the set operation.
  /// The StdHandler automatically loads metadata into ctx.options during
  /// beforeAnything, making it available for expiry checks.
  ///
  /// [ctx] - Context containing loaded metadata in options
  /// Returns ISO8601 timestamp string or null if no expiry is set
  Future<String?> _getExpiryFromStorage(PVCacheCtx ctx) async {
    // StdHandler automatically populates ctx.options with metadata
    // Return the expiry timestamp stored in options (ISO8601 string)
    return ctx.options[_expiryKey] as String?;
  }

  /// Removes an expired item from storage.
  ///
  /// Creates a separate context for the removal operation to avoid
  /// interfering with the current get operation. Handles removal
  /// failures gracefully by logging warnings rather than throwing.
  ///
  /// [ctx] - Context containing the key to remove
  Future<void> _removeExpiredItem(PVCacheCtx ctx) async {
    try {
      // Create a new context for the remove operation
      final removeCtx = PVCacheCtx(
        callingFunc: 'remove',
        options: {},
        key: ctx.key,
        value: null,
        handle: ctx.handle,
        cacher: ctx.cacher,
      );

      // Trigger the removal through the handler
      await ctx.handle.remove(removeCtx);
    } catch (e) {
      // If removal fails, log but don't throw - the main operation should still abort
      print('WARNING: Failed to remove expired item ${ctx.key}: $e');
    }
  }
}

/// Enhanced expiry adapter with detailed logging capabilities.
///
/// Extends [ExpiredAdapter] with comprehensive logging for debugging
/// and monitoring expiry behavior. Logs all expiry-related operations
/// including set operations, expiry checks, and removal actions.
class VerboseExpiredAdapter extends ExpiredAdapter with PVPreHandlerOperation {
  /// Prefix for all log messages to distinguish from other output
  final String prefix;

  /// Creates a verbose expiry adapter with customizable log prefix.
  ///
  /// [prefix] - String prefix for all log messages (default: 'EXPIRY')
  VerboseExpiredAdapter({this.prefix = 'EXPIRY'});

  /// Internal logging method with consistent formatting.
  ///
  /// [message] - Message to log with the configured prefix
  void _log(String message) {
    print('$prefix: $message');
  }

  /// Logs expiry information when setting values with expiry options.
  ///
  /// Calls parent preSet method and then logs the calculated expiry time
  /// if an expiry option was provided. Helps debug expiry configuration issues.
  ///
  /// [ctx] - Context containing set operation details and expiry options
  @override
  Future<void> preSet(PVCacheCtx ctx) async {
    await super.preSet(ctx);

    if (ctx.contexts.containsKey(ExpiredAdapter._expiryKey)) {
      final expiryTime = ctx.contexts[ExpiredAdapter._expiryKey];
      _log('Set expiry for key ${ctx.key}: $expiryTime');
    }
  }

  /// Provides detailed logging for expiry checks during get operations.
  ///
  /// Logs the expiry checking process including:
  /// - When expiry checks are performed
  /// - Retrieved expiry timestamps
  /// - Expiry status decisions
  /// - Time remaining for valid items
  /// - Expired item removal actions
  ///
  /// [ctx] - Context containing get operation details and loaded metadata
  @override
  Future<void> preHandlerOperation(PVCacheCtx ctx) async {
    // Only check expiry on get operations
    if (ctx.callingFunc != 'get') return;

    _log('preHandlerOperation called for key ${ctx.key}');

    final expiryString = await _getExpiryFromStorage(ctx);
    _log('Retrieved expiry string: $expiryString from options: ${ctx.options}');

    if (expiryString != null) {
      final expiryTime = DateTime.parse(expiryString);
      final now = DateTime.now().toUtc();

      _log(
        'Checking expiry for key ${ctx.key}: expires at $expiryTime, now is $now',
      );

      if (now.isAfter(expiryTime)) {
        _log('Key ${ctx.key} has expired, removing and aborting get');
        await _removeExpiredItem(ctx);
        ctx.flags.abort = true;
        ctx.result = null;
      } else {
        final remaining = expiryTime.difference(now);
        _log('Key ${ctx.key} is valid for ${remaining.inSeconds} more seconds');
      }
    } else {
      _log('No expiry found for key ${ctx.key}');
    }
  }
}

/// Utility class providing convenient methods for creating expiry options.
///
/// Offers static methods to easily create expiry configuration maps
/// for common time durations and specific timestamps.
class ExpiryUtils {
  /// Creates expiry options for a duration in seconds.
  ///
  /// [seconds] - Number of seconds from now until expiry
  /// Returns map suitable for cache set operations
  static Map<String, dynamic> seconds(int seconds) => {'expiry': seconds};

  /// Creates expiry options for a duration in minutes.
  ///
  /// [minutes] - Number of minutes from now until expiry
  /// Returns map suitable for cache set operations
  static Map<String, dynamic> minutes(int minutes) => {'expiry': minutes * 60};

  /// Creates expiry options for a duration in hours.
  ///
  /// [hours] - Number of hours from now until expiry
  /// Returns map suitable for cache set operations
  static Map<String, dynamic> hours(int hours) => {'expiry': hours * 3600};

  /// Creates expiry options for a duration in days.
  ///
  /// [days] - Number of days from now until expiry
  /// Returns map suitable for cache set operations
  static Map<String, dynamic> days(int days) => {'expiry': days * 86400};

  /// Creates expiry options for a specific timestamp.
  ///
  /// [dateTime] - Absolute expiry time (will be converted to UTC)
  /// Returns map suitable for cache set operations
  static Map<String, dynamic> at(DateTime dateTime) => {
    'expiryTime': dateTime.toUtc().toIso8601String(),
  };

  /// Creates expiry options for a duration from now.
  ///
  /// [duration] - Duration from now until expiry
  /// Returns map suitable for cache set operations
  static Map<String, dynamic> duration(Duration duration) => {
    'expiry': duration.inSeconds,
  };
}
