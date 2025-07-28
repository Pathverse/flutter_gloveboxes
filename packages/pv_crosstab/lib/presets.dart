import 'src/payload.dart';
import 'src/registry.dart';

/// Preset functions for common CrosstabRegistry use cases
///
/// These functions make it easy to create registries for typical scenarios
/// without manually specifying all the matching criteria.

/// Auto-generates a registry that matches the given payload exactly
///
/// Creates a registry with matching criteria based on the payload's header.
/// Useful for creating responses or related message handlers.
///
/// Example:
/// ```dart
/// final payload = await CrosstabPayload.signed(
///   data: {'action': 'login'},
///   type: 'auth-request',
///   channelId: 'user-session'
/// );
///
/// final registry = autoRegistry(
///   payload,
///   callback: (p) => print('Matched: ${p.data}')
/// );
/// // Creates registry that matches: type='auth-request', channelId='user-session', useSignature=true
/// ```
CrosstabRegistry autoRegistry(
  CrosstabPayload payload, {
  required Function(CrosstabPayload) callback,
  List<String>? fieldsMatch,
  Function(CrosstabPayload)? matchFunction,
}) {
  return CrosstabRegistry(
    typeMatch: payload.header.type,
    channelIdMatch: payload.header.channelId,
    useEncryption: payload.header.useEncryption,
    useSignature: payload.header.useSignature,
    useLock: payload.header.useLock,
    versionMatch: payload.header.version.toString(),
    fieldsMatch: fieldsMatch,
    matchFunction: matchFunction,
    callback: callback,
  );
}

/// Creates a registry that matches any payload of the specified type
///
/// Useful for broad message type handlers that don't care about security level
/// or channel specifics.
///
/// Example:
/// ```dart
/// final registry = broadcastRegistry(
///   'notification',
///   callback: (payload) => showNotification(payload.data),
/// );
/// // Matches any notification, regardless of encryption or channel
/// ```
CrosstabRegistry broadcastRegistry(
  String type, {
  required Function(CrosstabPayload) callback,
  List<String>? fieldsMatch,
  Function(CrosstabPayload)? matchFunction,
}) {
  return CrosstabRegistry(
    typeMatch: type,
    fieldsMatch: fieldsMatch,
    matchFunction: matchFunction,
    callback: callback,
  );
}

/// Creates a registry that only matches secure (encrypted + signed) payloads
///
/// Use this for sensitive operations that require maximum security.
///
/// Example:
/// ```dart
/// final registry = secureRegistry(
///   'payment-data',
///   callback: (payload) => processPayment(payload.data),
/// );
/// // Only matches encrypted AND signed payment-data messages
/// ```
CrosstabRegistry secureRegistry(
  String type, {
  required Function(CrosstabPayload) callback,
  String? channelIdMatch,
  List<String>? fieldsMatch,
  Function(CrosstabPayload)? matchFunction,
}) {
  return CrosstabRegistry(
    typeMatch: type,
    channelIdMatch: channelIdMatch,
    useEncryption: true,
    useSignature: true,
    fieldsMatch: fieldsMatch,
    matchFunction: matchFunction,
    callback: callback,
  );
}

/// Creates a registry that matches all messages on a specific channel
///
/// Useful for channel-specific handlers that process any message type.
///
/// Example:
/// ```dart
/// final registry = channelRegistry(
///   'admin-panel',
///   callback: (payload) => logAdminAction(payload.data),
/// );
/// // Matches any message sent to the admin-panel channel
/// ```
CrosstabRegistry channelRegistry(
  String channelId, {
  required Function(CrosstabPayload) callback,
  String? typeMatch,
  bool? useEncryption,
  bool? useSignature,
  List<String>? fieldsMatch,
  Function(CrosstabPayload)? matchFunction,
}) {
  return CrosstabRegistry(
    typeMatch: typeMatch,
    channelIdMatch: channelId,
    useEncryption: useEncryption,
    useSignature: useSignature,
    fieldsMatch: fieldsMatch,
    matchFunction: matchFunction,
    callback: callback,
  );
}

/// Creates multiple registries for different security levels of the same message type
///
/// Useful when you want to handle the same message type differently based on
/// its security level (e.g., public vs private notifications).
///
/// Example:
/// ```dart
/// final registries = multiSecurityRegistry(
///   type: 'user-update',
///   unencryptedCallback: (p) => updatePublicProfile(p.data),
///   encryptedCallback: (p) => updatePrivateData(p.data),
///   channelIdMatch: 'user-*',
/// );
/// // Returns list of 2 registries: one for encrypted, one for unencrypted
/// ```
List<CrosstabRegistry> multiSecurityRegistry({
  required String type,
  Function(CrosstabPayload)? unencryptedCallback,
  Function(CrosstabPayload)? encryptedCallback,
  Function(CrosstabPayload)? signedCallback,
  String? channelIdMatch,
  List<String>? fieldsMatch,
}) {
  final registries = <CrosstabRegistry>[];

  if (unencryptedCallback != null) {
    registries.add(
      CrosstabRegistry(
        typeMatch: type,
        channelIdMatch: channelIdMatch,
        useEncryption: false,
        useSignature: false,
        fieldsMatch: fieldsMatch,
        callback: unencryptedCallback,
      ),
    );
  }

  if (signedCallback != null) {
    registries.add(
      CrosstabRegistry(
        typeMatch: type,
        channelIdMatch: channelIdMatch,
        useEncryption: false,
        useSignature: true,
        fieldsMatch: fieldsMatch,
        callback: signedCallback,
      ),
    );
  }

  if (encryptedCallback != null) {
    registries.add(
      CrosstabRegistry(
        typeMatch: type,
        channelIdMatch: channelIdMatch,
        useEncryption: true,
        useSignature: true,
        fieldsMatch: fieldsMatch,
        callback: encryptedCallback,
      ),
    );
  }

  return registries;
}

/// Creates a pair of registries for two-way communication
///
/// Useful for request-response patterns where you send one type of message
/// and expect a specific response type.
///
/// Example:
/// ```dart
/// final syncPair = createSyncPair(
///   requestType: 'get-user-data',
///   responseType: 'user-data-response',
///   channelId: 'user-sync',
///   onRequest: (payload) => handleUserDataRequest(payload.data),
///   onResponse: (payload) => updateLocalUserData(payload.data),
///   useEncryption: true,
/// );
///
/// // Register both
/// channel.registerMultiple(syncPair);
/// ```
List<CrosstabRegistry> createSyncPair({
  required String requestType,
  required String responseType,
  required Function(CrosstabPayload) onRequest,
  required Function(CrosstabPayload) onResponse,
  String? channelId,
  bool? useEncryption,
  bool? useSignature,
  List<String>? requestFieldsMatch,
  List<String>? responseFieldsMatch,

}) {
  return [
    CrosstabRegistry(
      typeMatch: requestType,
      channelIdMatch: channelId,
      useEncryption: useEncryption,
      useSignature: useSignature,
      fieldsMatch: requestFieldsMatch,
      callback: onRequest,
    ),
    CrosstabRegistry(
      typeMatch: responseType,
      channelIdMatch: channelId,
      useEncryption: useEncryption,
      useSignature: useSignature,
      fieldsMatch: responseFieldsMatch,
      callback: onResponse,
    ),
  ];
}

/// Creates registries for field-specific handlers
///
/// Useful when you want different handlers based on which fields are present
/// in the payload data.
///
/// Example:
/// ```dart
/// final registries = fieldBasedRegistries(
///   type: 'user-action',
///   fieldHandlers: {
///     ['loginData']: (p) => handleLogin(p.data),
///     ['logoutData']: (p) => handleLogout(p.data),
///     ['profileData', 'preferences']: (p) => handleProfileUpdate(p.data),
///   },
///   channelId: 'user-events',
/// );
/// ```
List<CrosstabRegistry> fieldBasedRegistries({
  required String type,
  required Map<List<String>, Function(CrosstabPayload)> fieldHandlers,
  String? channelId,
  bool? useEncryption,
  bool? useSignature,
}) {
  final registries = <CrosstabRegistry>[];

  for (final entry in fieldHandlers.entries) {
    registries.add(
      CrosstabRegistry(
        typeMatch: type,
        channelIdMatch: channelId,
        useEncryption: useEncryption,
        useSignature: useSignature,
        fieldsMatch: entry.key,
        callback: entry.value,
      ),
    );
  }

  return registries;
}

/// Creates a registry with wildcard patterns for flexible matching
///
/// Useful for creating broad handlers that match multiple related message types.
///
/// Example:
/// ```dart
/// final registry = wildcardRegistry(
///   typePattern: 'notification-*',     // Matches notification-urgent, notification-info, etc.
///   channelPattern: 'user-?',          // Matches user-1, user-a, etc.
///   callback: (payload) => handleAnyNotification(payload.data),
/// );
/// ```
CrosstabRegistry wildcardRegistry({
  String? typePattern,
  String? channelPattern,
  required Function(CrosstabPayload) callback,
  bool? useEncryption,
  bool? useSignature,
  bool? useLock,
  List<String>? fieldsMatch,
  Function(CrosstabPayload)? matchFunction,
}) {
  return CrosstabRegistry(
    typeMatch: typePattern,
    channelIdMatch: channelPattern,
    useEncryption: useEncryption,
    useSignature: useSignature,
    useLock: useLock,
    fieldsMatch: fieldsMatch,
    matchFunction: matchFunction,
    callback: callback,
  );
}

/// Creates registries for common application patterns
///
/// Provides pre-configured registries for typical app scenarios.
///
/// Example:
/// ```dart
/// final authRegistries = appPatternRegistries(
///   pattern: AppPattern.authentication,
///   onLogin: (p) => handleLogin(p.data),
///   onLogout: (p) => handleLogout(p.data),
///   onSessionUpdate: (p) => updateSession(p.data),
/// );
/// ```
enum AppPattern { authentication, realTimeChat, sharedState, notifications }

List<CrosstabRegistry> appPatternRegistries({
  required AppPattern pattern,
  Function(CrosstabPayload)? onLogin,
  Function(CrosstabPayload)? onLogout,
  Function(CrosstabPayload)? onSessionUpdate,
  Function(CrosstabPayload)? onMessage,
  Function(CrosstabPayload)? onStateChange,
  Function(CrosstabPayload)? onNotification,
  String? channelId,
}) {
  switch (pattern) {
    case AppPattern.authentication:
      return _createAuthPatternRegistries(
        onLogin: onLogin,
        onLogout: onLogout,
        onSessionUpdate: onSessionUpdate,
        channelId: channelId,
      );
    case AppPattern.realTimeChat:
      return _createChatPatternRegistries(
        onMessage: onMessage,
        channelId: channelId,
      );
    case AppPattern.sharedState:
      return _createStatePatternRegistries(
        onStateChange: onStateChange,
        channelId: channelId,
      );
    case AppPattern.notifications:
      return _createNotificationPatternRegistries(
        onNotification: onNotification,
        channelId: channelId,
      );
  }
}

// Private helper functions for app patterns

List<CrosstabRegistry> _createAuthPatternRegistries({
  Function(CrosstabPayload)? onLogin,
  Function(CrosstabPayload)? onLogout,
  Function(CrosstabPayload)? onSessionUpdate,
  String? channelId,
}) {
  final registries = <CrosstabRegistry>[];

  if (onLogin != null) {
    registries.add(
      secureRegistry(
        'auth-login',
        callback: onLogin,
        channelIdMatch: channelId,
        fieldsMatch: ['credentials'],
      ),
    );
  }

  if (onLogout != null) {
    registries.add(
      secureRegistry(
        'auth-logout',
        callback: onLogout,
        channelIdMatch: channelId,
      ),
    );
  }

  if (onSessionUpdate != null) {
    registries.add(
      secureRegistry(
        'auth-session-update',
        callback: onSessionUpdate,
        channelIdMatch: channelId,
        fieldsMatch: ['sessionData'],
      ),
    );
  }

  return registries;
}

List<CrosstabRegistry> _createChatPatternRegistries({
  Function(CrosstabPayload)? onMessage,
  String? channelId,
}) {
  final registries = <CrosstabRegistry>[];

  if (onMessage != null) {
    registries.add(
      broadcastRegistry(
        'chat-message',
        callback: onMessage,
        fieldsMatch: ['message', 'sender'],
      ),
    );
  }

  return registries;
}

List<CrosstabRegistry> _createStatePatternRegistries({
  Function(CrosstabPayload)? onStateChange,
  String? channelId,
}) {
  final registries = <CrosstabRegistry>[];

  if (onStateChange != null) {
    registries.add(
      channelRegistry(
        channelId ?? 'shared-state',
        callback: onStateChange,
        typeMatch: 'state-*',
        fieldsMatch: ['stateData'],
      ),
    );
  }

  return registries;
}

List<CrosstabRegistry> _createNotificationPatternRegistries({
  Function(CrosstabPayload)? onNotification,
  String? channelId,
}) {
  final registries = <CrosstabRegistry>[];

  if (onNotification != null) {
    registries.add(
      wildcardRegistry(
        typePattern: 'notification-*',
        channelPattern: channelId,
        callback: onNotification,
        fieldsMatch: ['message'],
      ),
    );
  }

  return registries;
}
