import 'package:pv_crosstab/src/payload.dart';

/// Registry item for subscribing to specific types of cross-tab payloads
///
/// This class defines matching criteria for payloads and provides a callback
/// function to handle matching payloads. Use this to create targeted
/// subscriptions for different message types, security levels, or content.
///
/// String matching fields support glob patterns:
/// - `*` matches any sequence of characters
/// - `?` matches any single character
/// - Exact string matching when no wildcards are used
class CrosstabRegistry {
  /// Match payloads with this specific type (supports glob patterns)
  /// Examples: 'notification', 'user-*', 'command?'
  String? typeMatch;

  /// Match payloads with this specific channel ID (supports glob patterns)
  /// Examples: 'main-app', 'chat-*', 'room-??'
  String? channelIdMatch;

  /// Match payloads that use encryption (true) or don't use encryption (false)
  /// Leave null to match both encrypted and unencrypted payloads
  bool? useEncryption;

  /// Match payloads that use signatures (true) or don't use signatures (false)
  /// Leave null to match both signed and unsigned payloads
  bool? useSignature;

  /// Match payloads that use locking (true) or don't use locking (false)
  /// Leave null to match both locked and unlocked payloads
  bool? useLock;

  /// Match payloads with this specific version (supports glob patterns)
  /// Examples: '1', '2.*', '1.?'
  String? versionMatch;

  /// Match payloads that contain all of these fields in their data
  /// All specified fields must be present for a match
  List<String>? fieldsMatch;

  /// Custom matching function that takes a payload and returns bool
  /// This allows for complex custom matching logic beyond the built-in criteria
  Function(CrosstabPayload)? matchFunction;

  /// Callback function that gets called when a payload matches this registry
  /// This is where you handle the matched payload
  Function(CrosstabPayload) callback;

  CrosstabRegistry({
    this.typeMatch,
    this.channelIdMatch,
    this.useEncryption,
    this.useSignature,
    this.useLock,
    this.versionMatch,
    this.fieldsMatch,
    this.matchFunction,
    required this.callback,
  });

  /// Checks if the given payload matches this registry's criteria
  ///
  /// Returns true if ALL specified criteria match, false otherwise.
  /// If no criteria are specified, matches all payloads.
  ///
  /// String matching supports glob patterns:
  /// - `*` matches any sequence of characters
  /// - `?` matches any single character
  ///
  /// Matching logic:
  /// 1. Check type match (if specified, supports glob patterns)
  /// 2. Check channel ID match (if specified, supports glob patterns)
  /// 3. Check security flags (encryption, signature, lock)
  /// 4. Check version match (if specified, supports glob patterns)
  /// 5. Check required fields presence (if specified)
  /// 6. Run custom match function (if specified)
  ///
  /// Example:
  /// ```dart
  /// final registry = CrosstabRegistry(
  ///   typeMatch: 'notification*',
  ///   channelIdMatch: 'user-?',
  ///   useEncryption: false,
  ///   fieldsMatch: ['message', 'priority'],
  ///   callback: (payload) => print('Got notification: ${payload.data}'),
  /// );
  ///
  /// final matches = registry.match(payload); // true if all criteria match
  /// ```
  Future<bool> match(CrosstabPayload payload) async {
    // Check type match with glob pattern support
    if (typeMatch != null &&
        !_matchesGlobPattern(payload.header.type, typeMatch!)) {
      return false;
    }

    // Check channel ID match with glob pattern support
    if (channelIdMatch != null &&
        !_matchesGlobPattern(payload.header.channelId, channelIdMatch!)) {
      return false;
    }

    // Check encryption requirement
    if (useEncryption != null &&
        payload.header.useEncryption != useEncryption) {
      return false;
    }

    // Check signature requirement
    if (useSignature != null && payload.header.useSignature != useSignature) {
      return false;
    }

    // Check lock requirement
    if (useLock != null && payload.header.useLock != useLock) {
      return false;
    }

    // Check version match with glob pattern support
    if (versionMatch != null &&
        !_matchesGlobPattern(
          payload.header.version.toString(),
          versionMatch!,
        )) {
      return false;
    }

    // Check required fields presence
    if (fieldsMatch != null && fieldsMatch!.isNotEmpty) {
      // Get the usable data (handles encryption automatically)
      Map<String, dynamic> dataToCheck;
      try {
        dataToCheck = await payload.getData();

        // Check if all required fields are present
        for (final field in fieldsMatch!) {
          if (!dataToCheck.containsKey(field)) {
            return false;
          }
        }
      } catch (e) {
        // If we can't access the data for field checking, consider it a non-match
        return false;
      }
    }

    // Run custom match function if provided
    if (matchFunction != null) {
      try {
        return matchFunction!(payload);
      } catch (e) {
        // If custom function throws, consider it a non-match
        return false;
      }
    }

    // If we get here, all specified criteria matched (or no criteria were specified)
    return true;
  }

  /// Checks if a string matches a glob pattern
  ///
  /// Supports:
  /// - `*` matches any sequence of characters (including empty)
  /// - `?` matches any single character
  /// - Literal characters match exactly
  ///
  /// Examples:
  /// - `notification*` matches `notification`, `notification-urgent`, `notification123`
  /// - `user-?` matches `user-1`, `user-a`, but not `user-12` or `user-`
  /// - `exact` matches only `exact`
  bool _matchesGlobPattern(String input, String pattern) {
    // If no wildcards, do exact match
    if (!pattern.contains('*') && !pattern.contains('?')) {
      return input == pattern;
    }

    // Convert glob pattern to regex
    String regexPattern = pattern
        .replaceAll(
          RegExp(r'[.+^${}()|[\]\\]'),
          r'\$&',
        ) // Escape regex special chars
        .replaceAll('*', '.*') // * becomes .*
        .replaceAll('?', '.'); // ? becomes .

    final regex = RegExp('^$regexPattern\$');
    return regex.hasMatch(input);
  }
}
