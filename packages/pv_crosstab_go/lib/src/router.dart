import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pv_crosstab/pv_crosstab.dart';
import 'package:pv_crosstab/presets.dart';

/// Navigation patterns for common app scenarios
enum AppNavigationPattern {
  authentication,
  deepLinking,
  tabSync,
  modalNavigation,
}

/// A wrapper around GoRouter that implements CrosstabInterface for cross-tab navigation
///
/// This class enables cross-tab navigation by listening to messages from other tabs
/// and automatically triggering navigation actions like redirects, pushes, and refreshes
/// based on the received payload and channel patterns.
///
/// Example usage:
/// ```dart
/// final router = CrosstabGoRouter(
///   channelName: 'navigation-channel',
///   routes: [
///     GoRoute(path: '/', builder: (context, state) => HomePage()),
///     GoRoute(path: '/profile', builder: (context, state) => ProfilePage()),
///   ],
/// );
///
/// // Register for navigation commands from other tabs
/// router.registerNavigationHandler('redirect-*', (payload) {
///   // Handle redirect commands
/// });
///
/// // In another tab, trigger navigation
/// await router.sendNavigationCommand(
///   command: 'redirect',
///   path: '/profile',
///   channelId: 'redirect-main',
/// );
/// ```
class CrosstabGoRouter implements CrosstabInterface {
  final GoRouter _goRouter;
  final CrosstabChannel _channel;
  final GlobalKey<NavigatorState>? navigatorKey;
  final String _internalPrefix;

  static int _currentCounter = 0;

  /// Creates a CrosstabGoRouter with cross-tab navigation capabilities
  ///
  /// [channelName] - The cross-tab communication channel name
  /// [routes] - GoRouter routes configuration
  /// [navigatorKey] - Optional navigator key for advanced navigation control
  /// [initialLocation] - Initial route location
  /// [redirect] - Global redirect function (will be enhanced with cross-tab capabilities)
  /// [errorBuilder] - Error page builder
  /// [refreshListenable] - Listenable for automatic route refresh
  CrosstabGoRouter({
    required String channelName,
    required List<RouteBase> routes,
    this.navigatorKey,
    String? initialLocation,
    GoRouterRedirect? redirect,
    GoRouterWidgetBuilder? errorBuilder,
    Listenable? refreshListenable,
    int redirectLimit = 5,
  }) : _channel = CrosstabChannel(channelName),
       _internalPrefix = 'crosstab_router_x_${++_currentCounter}',
       _goRouter = GoRouter(
         routes: routes,
         navigatorKey: navigatorKey,
         initialLocation: initialLocation,
         redirect: redirect,
         errorBuilder: errorBuilder,
         refreshListenable: refreshListenable,
         redirectLimit: redirectLimit,
       ) {
    _initializeChannel();
  }

  /// The underlying GoRouter instance for direct access if needed
  GoRouter get goRouter => _goRouter;

  @override
  CrosstabChannel get channel => _channel;

  /// Initializes the cross-tab channel and sets up basic navigation handlers
  void _initializeChannel() {
    _channel.initialize();

    // Register default navigation command handler
    registerHandler(
      CrosstabRegistry(
        typeMatch: 'navigation',
        callback: _handleNavigationCommand,
      ),
    );

    // Register for page refresh commands
    registerHandler(
      CrosstabRegistry(typeMatch: 'refresh', callback: _handleRefreshCommand),
    );

    // Listen to errors for debugging
    _channel.errorStream.listen((error) {
      onCrosstabError('Navigation channel error: $error');
    });
  }

  /// Handles incoming navigation commands from other tabs
  void _handleNavigationCommand(CrosstabPayload payload) {
    try {
      final data = payload.data;
      final command = data['command'] as String?;
      final path = data['path'] as String?;
      final extra = data['extra'];
      //final replace = data['replace'] as bool? ?? false;

      if (command == null || path == null) {
        onCrosstabError('Invalid navigation command: missing command or path');
        return;
      }

      switch (command) {
        case 'go':
          _goRouter.go(path, extra: extra);
          break;
        case 'push':
          _goRouter.push(path, extra: extra);
          break;
        case 'pushReplacement':
          _goRouter.pushReplacement(path, extra: extra);
          break;
        case 'pop':
          if (_goRouter.canPop()) {
            _goRouter.pop(extra);
          }
          break;
        case 'goNamed':
          final name = data['name'] as String?;
          final pathParameters =
              data['pathParameters'] as Map<String, String>? ?? {};
          final queryParameters =
              data['queryParameters'] as Map<String, dynamic>? ?? {};
          if (name != null) {
            _goRouter.goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );
          }
          break;
        case 'pushNamed':
          final name = data['name'] as String?;
          final pathParameters =
              data['pathParameters'] as Map<String, String>? ?? {};
          final queryParameters =
              data['queryParameters'] as Map<String, dynamic>? ?? {};
          if (name != null) {
            _goRouter.pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );
          }
          break;
        default:
          onCrosstabError('Unknown navigation command: $command');
      }

      onCrosstabMessage(payload);
    } catch (e) {
      onCrosstabError('Error handling navigation command: $e');
    }
  }

  /// Handles page refresh commands from other tabs
  void _handleRefreshCommand(CrosstabPayload payload) {
    try {
      final data = payload.data;
      final forceRefresh = data['force'] as bool? ?? false;

      if (forceRefresh) {
        // Force refresh by navigating to current location
        final currentLocation =
            _goRouter.routerDelegate.currentConfiguration.fullPath;
        _goRouter.go(currentLocation);
      } else {
        // Trigger any refresh listenable if available
        _goRouter.refresh();
      }

      onCrosstabMessage(payload);
    } catch (e) {
      onCrosstabError('Error handling refresh command: $e');
    }
  }

  /// Sends a navigation command to other tabs
  ///
  /// [command] - Navigation command ('go', 'push', 'pushReplacement', 'pop', etc.)
  /// [path] - Target path (required for most commands)
  /// [channelId] - Channel ID for targeted routing
  /// [extra] - Extra data to pass with navigation
  /// [replace] - Whether to replace current route
  /// [useEncryption] - Whether to encrypt the command
  /// [name] - Route name for named navigation
  /// [pathParameters] - Path parameters for named routes
  /// [queryParameters] - Query parameters for named routes
  Future<void> sendNavigationCommand({
    required String command,
    String? path,
    String channelId = '',
    Object? extra,
    bool replace = false,
    bool useEncryption = false,
    String? name,
    Map<String, String>? pathParameters,
    Map<String, dynamic>? queryParameters,
  }) async {
    final data = <String, dynamic>{
      'command': command,
      if (path != null) 'path': path,
      if (extra != null) 'extra': extra,
      'replace': replace,
      if (name != null) 'name': name,
      if (pathParameters != null) 'pathParameters': pathParameters,
      if (queryParameters != null) 'queryParameters': queryParameters,
    };

    final fullChannelId = channelId.isNotEmpty
        ? '$_internalPrefix:$channelId'
        : _internalPrefix;

    final payload = useEncryption
        ? await CrosstabPayload.encrypted(
            data: data,
            type: 'navigation',
            channelId: fullChannelId,
          )
        : await CrosstabPayload.unencrypted(
            data: data,
            type: 'navigation',
            channelId: fullChannelId,
          );

    await sendMessage(payload);
  }

  /// Sends a refresh command to other tabs
  ///
  /// [force] - Whether to force a complete page refresh
  /// [channelId] - Channel ID for targeted routing
  /// [useEncryption] - Whether to encrypt the command
  Future<void> sendRefreshCommand({
    bool force = false,
    String channelId = '',
    bool useEncryption = false,
  }) async {
    final data = <String, dynamic>{'force': force};

    final fullChannelId = channelId.isNotEmpty
        ? '$_internalPrefix:$channelId'
        : _internalPrefix;

    final payload = useEncryption
        ? await CrosstabPayload.encrypted(
            data: data,
            type: 'refresh',
            channelId: fullChannelId,
          )
        : await CrosstabPayload.unencrypted(
            data: data,
            type: 'refresh',
            channelId: fullChannelId,
          );

    await sendMessage(payload);
  }

  /// Registers a navigation handler for specific patterns
  ///
  /// [pattern] - Channel ID pattern to match (supports glob patterns)
  /// [callback] - Function to call when navigation commands match
  /// [commandFilter] - Optional filter for specific navigation commands
  void registerNavigationHandler(
    String pattern,
    Function(CrosstabPayload) callback, {
    String? commandFilter,
  }) {
    registerHandler(
      CrosstabRegistry(
        typeMatch: 'navigation',
        channelIdMatch: pattern,
        fieldsMatch: commandFilter != null ? ['command'] : null,
        matchFunction: commandFilter != null
            ? (payload) {
                final command = payload.data['command'] as String?;
                return command == commandFilter;
              }
            : null,
        callback: callback,
      ),
    );
  }

  /// Registers a refresh handler for specific patterns
  ///
  /// [pattern] - Channel ID pattern to match (supports glob patterns)
  /// [callback] - Function to call when refresh commands match
  void registerRefreshHandler(
    String pattern,
    Function(CrosstabPayload) callback,
  ) {
    registerHandler(
      CrosstabRegistry(
        typeMatch: 'refresh',
        channelIdMatch: pattern,
        callback: callback,
      ),
    );
  }

  // Router-specific preset methods

  /// Registers navigation handlers for different security levels
  ///
  /// Useful when you want to handle navigation commands differently based on
  /// their security level (e.g., admin routes require encryption).
  ///
  /// Example:
  /// ```dart
  /// router.registerSecurityNavigationHandlers(
  ///   unencryptedHandler: (payload) => handlePublicNavigation(payload),
  ///   encryptedHandler: (payload) => handleSecureNavigation(payload),
  ///   channelPattern: 'admin-*',
  /// );
  /// ```
  void registerSecurityNavigationHandlers({
    Function(CrosstabPayload)? unencryptedHandler,
    Function(CrosstabPayload)? encryptedHandler,
    Function(CrosstabPayload)? signedHandler,
    String? channelPattern,
  }) {
    final registries = multiSecurityRegistry(
      type: 'navigation',
      unencryptedCallback: unencryptedHandler,
      encryptedCallback: encryptedHandler,
      signedCallback: signedHandler,
      channelIdMatch: channelPattern,
      fieldsMatch: ['command', 'path'],
    );

    _channel.registerMultiple(registries);
  }

  /// Creates a two-way navigation sync between tabs
  ///
  /// Useful for request-response navigation patterns where one tab requests
  /// navigation and another confirms or provides the result.
  ///
  /// Example:
  /// ```dart
  /// router.createNavigationSync(
  ///   requestPattern: 'nav-request-*',
  ///   responsePattern: 'nav-response-*',
  ///   onRequest: (payload) {
  ///     // Handle navigation request
  ///     final path = payload.data['path'];
  ///     router.go(path);
  ///
  ///     // Send confirmation
  ///     router.sendNavigationResponse(
  ///       originalPayload: payload,
  ///       success: true,
  ///     );
  ///   },
  ///   onResponse: (payload) => handleNavigationResult(payload),
  ///   useEncryption: true,
  /// );
  /// ```
  void createNavigationSync({
    required String requestPattern,
    required String responsePattern,
    required Function(CrosstabPayload) onRequest,
    required Function(CrosstabPayload) onResponse,
    bool useEncryption = false,
  }) {
    final syncPair = createSyncPair(
      requestType: 'navigation',
      responseType: 'navigation-response',
      onRequest: onRequest,
      onResponse: onResponse,
      useEncryption: useEncryption,
    );

    // Update patterns to match the router's requirements
    syncPair[0].channelIdMatch = requestPattern;
    syncPair[1].channelIdMatch = responsePattern;

    _channel.registerMultiple(syncPair);
  }

  /// Registers handlers for common app navigation patterns
  ///
  /// Provides pre-configured handlers for typical navigation scenarios.
  ///
  /// Example:
  /// ```dart
  /// router.registerAppNavigationPattern(
  ///   pattern: AppNavigationPattern.authentication,
  ///   onLogin: (payload) => router.go('/dashboard'),
  ///   onLogout: (payload) => router.go('/login'),
  ///   onSessionExpired: (payload) => router.go('/login?expired=true'),
  ///   channelId: 'auth-nav',
  /// );
  /// ```
  void registerAppNavigationPattern({
    required AppNavigationPattern pattern,
    Function(CrosstabPayload)? onLogin,
    Function(CrosstabPayload)? onLogout,
    Function(CrosstabPayload)? onSessionExpired,
    Function(CrosstabPayload)? onRoleChange,
    Function(CrosstabPayload)? onDeepLink,
    Function(CrosstabPayload)? onTabSync,
    Function(CrosstabPayload)? onModalNavigation,
    String? channelId,
  }) {
    List<CrosstabRegistry> registries;

    switch (pattern) {
      case AppNavigationPattern.authentication:
        registries = _createAuthNavigationHandlers(
          onLogin: onLogin,
          onLogout: onLogout,
          onSessionExpired: onSessionExpired,
          onRoleChange: onRoleChange,
          channelId: channelId,
        );
        break;
      case AppNavigationPattern.deepLinking:
        registries = _createDeepLinkHandlers(
          onDeepLink: onDeepLink,
          channelId: channelId,
        );
        break;
      case AppNavigationPattern.tabSync:
        registries = _createTabSyncHandlers(
          onTabSync: onTabSync,
          channelId: channelId,
        );
        break;
      case AppNavigationPattern.modalNavigation:
        registries = _createModalNavigationHandlers(
          onModalNavigation: onModalNavigation,
          channelId: channelId,
        );
        break;
    }

    _channel.registerMultiple(registries);
  }

  /// Registers wildcard navigation handlers for flexible route matching
  ///
  /// Useful for handling multiple related navigation patterns with a single handler.
  ///
  /// Example:
  /// ```dart
  /// router.registerWildcardNavigation(
  ///   commandPattern: 'go*',           // Matches 'go', 'goNamed', etc.
  ///   channelPattern: 'user-*',        // Matches 'user-1', 'user-admin', etc.
  ///   callback: (payload) => handleUserNavigation(payload),
  ///   requireEncryption: true,
  /// );
  /// ```
  void registerWildcardNavigation({
    String? commandPattern,
    String? channelPattern,
    required Function(CrosstabPayload) callback,
    bool? requireEncryption,
    bool? requireSignature,
  }) {
    registerHandler(
      wildcardRegistry(
        typePattern: 'navigation',
        channelPattern: channelPattern,
        useEncryption: requireEncryption,
        useSignature: requireSignature,
        fieldsMatch: ['command', 'path'],
        matchFunction: commandPattern != null
            ? (payload) {
                final command = payload.data['command'] as String?;
                if (command == null) return false;
                // Simple pattern matching: support * at end only
                if (commandPattern.endsWith('*')) {
                  final prefix = commandPattern.substring(
                    0,
                    commandPattern.length - 1,
                  );
                  return command.startsWith(prefix);
                }
                return command == commandPattern;
              }
            : null,
        callback: callback,
      ),
    );
  }

  /// Registers field-based navigation handlers
  ///
  /// Creates different handlers based on which fields are present in the navigation command.
  ///
  /// Example:
  /// ```dart
  /// router.registerFieldBasedNavigation(
  ///   fieldHandlers: {
  ///     ['path']: (p) => handleSimpleNavigation(p),
  ///     ['name', 'pathParameters']: (p) => handleNamedNavigation(p),
  ///     ['path', 'extra', 'authToken']: (p) => handleAuthenticatedNavigation(p),
  ///   },
  ///   channelId: 'main-nav',
  /// );
  /// ```
  void registerFieldBasedNavigation({
    required Map<List<String>, Function(CrosstabPayload)> fieldHandlers,
    String? channelId,
    bool? useEncryption,
  }) {
    final registries = fieldBasedRegistries(
      type: 'navigation',
      fieldHandlers: fieldHandlers,
      channelId: channelId,
      useEncryption: useEncryption,
    );

    _channel.registerMultiple(registries);
  }

  /// Auto-registers a handler based on an existing navigation payload
  ///
  /// Creates a registry that matches navigation commands with the same
  /// characteristics as the provided payload.
  ///
  /// Example:
  /// ```dart
  /// // Create a navigation command
  /// await router.sendNavigationCommand(
  ///   command: 'go',
  ///   path: '/profile',
  ///   channelId: 'user-profile',
  ///   useEncryption: true,
  /// );
  ///
  /// // Later, auto-register for similar commands
  /// router.autoRegisterNavigation(
  ///   existingPayload,
  ///   callback: (payload) => handleSimilarNavigation(payload),
  /// );
  /// ```
  void autoRegisterNavigation(
    CrosstabPayload navigationPayload, {
    required Function(CrosstabPayload) callback,
    List<String>? additionalFields,
  }) {
    registerHandler(
      autoRegistry(
        navigationPayload,
        callback: callback,
        fieldsMatch: ['command', 'path', ...?additionalFields],
      ),
    );
  }

  /// Sends a navigation response for request-response patterns
  ///
  /// Convenience method for responding to navigation requests in sync patterns.
  ///
  /// Example:
  /// ```dart
  /// router.createNavigationSync(
  ///   requestPattern: 'nav-request',
  ///   responsePattern: 'nav-response',
  ///   onRequest: (payload) async {
  ///     try {
  ///       router.go(payload.data['path']);
  ///       await router.sendNavigationResponse(
  ///         originalPayload: payload,
  ///         success: true,
  ///         resultData: {'currentPath': router.location},
  ///       );
  ///     } catch (e) {
  ///       await router.sendNavigationResponse(
  ///         originalPayload: payload,
  ///         success: false,
  ///         error: e.toString(),
  ///       );
  ///     }
  ///   },
  ///   onResponse: handleNavigationResult,
  /// );
  /// ```
  Future<void> sendNavigationResponse({
    required CrosstabPayload originalPayload,
    required bool success,
    Map<String, dynamic>? resultData,
    String? error,
    bool useEncryption = false,
  }) async {
    final responseData = <String, dynamic>{
      'success': success,
      'originalCommand': originalPayload.data['command'],
      'originalPath': originalPayload.data['path'],
      if (resultData != null) ...resultData,
      if (error != null) 'error': error,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
    };

    // Create response channel ID based on original
    final originalChannelId = originalPayload.header.channelId;
    final responseChannelId = originalChannelId.replaceFirst(
      'request',
      'response',
    );

    final payload = useEncryption
        ? await CrosstabPayload.encrypted(
            data: responseData,
            type: 'navigation-response',
            channelId: responseChannelId,
          )
        : await CrosstabPayload.unencrypted(
            data: responseData,
            type: 'navigation-response',
            channelId: responseChannelId,
          );

    await sendMessage(payload);
  }

  // Private helper methods and enums for navigation patterns

  /// Creates authentication-related navigation handlers
  List<CrosstabRegistry> _createAuthNavigationHandlers({
    Function(CrosstabPayload)? onLogin,
    Function(CrosstabPayload)? onLogout,
    Function(CrosstabPayload)? onSessionExpired,
    Function(CrosstabPayload)? onRoleChange,
    String? channelId,
  }) {
    final registries = <CrosstabRegistry>[];

    if (onLogin != null) {
      registries.add(
        secureRegistry(
          'navigation',
          callback: onLogin,
          channelIdMatch: channelId,
          fieldsMatch: ['command', 'authAction'],
          matchFunction: (payload) => payload.data['authAction'] == 'login',
        ),
      );
    }

    if (onLogout != null) {
      registries.add(
        secureRegistry(
          'navigation',
          callback: onLogout,
          channelIdMatch: channelId,
          fieldsMatch: ['command', 'authAction'],
          matchFunction: (payload) => payload.data['authAction'] == 'logout',
        ),
      );
    }

    if (onSessionExpired != null) {
      registries.add(
        secureRegistry(
          'navigation',
          callback: onSessionExpired,
          channelIdMatch: channelId,
          fieldsMatch: ['command', 'authAction'],
          matchFunction: (payload) =>
              payload.data['authAction'] == 'sessionExpired',
        ),
      );
    }

    if (onRoleChange != null) {
      registries.add(
        secureRegistry(
          'navigation',
          callback: onRoleChange,
          channelIdMatch: channelId,
          fieldsMatch: ['command', 'authAction'],
          matchFunction: (payload) =>
              payload.data['authAction'] == 'roleChange',
        ),
      );
    }

    return registries;
  }

  /// Creates deep linking navigation handlers
  List<CrosstabRegistry> _createDeepLinkHandlers({
    Function(CrosstabPayload)? onDeepLink,
    String? channelId,
  }) {
    final registries = <CrosstabRegistry>[];

    if (onDeepLink != null) {
      registries.add(
        broadcastRegistry(
          'navigation',
          callback: onDeepLink,
          fieldsMatch: ['command', 'deepLink', 'path'],
          matchFunction: (payload) => payload.data['deepLink'] == true,
        ),
      );
    }

    return registries;
  }

  /// Creates tab synchronization navigation handlers
  List<CrosstabRegistry> _createTabSyncHandlers({
    Function(CrosstabPayload)? onTabSync,
    String? channelId,
  }) {
    final registries = <CrosstabRegistry>[];

    if (onTabSync != null) {
      registries.add(
        channelRegistry(
          channelId ?? 'tab-sync',
          callback: onTabSync,
          typeMatch: 'navigation',
          fieldsMatch: ['command', 'syncAction'],
        ),
      );
    }

    return registries;
  }

  /// Creates modal navigation handlers
  List<CrosstabRegistry> _createModalNavigationHandlers({
    Function(CrosstabPayload)? onModalNavigation,
    String? channelId,
  }) {
    final registries = <CrosstabRegistry>[];

    if (onModalNavigation != null) {
      registries.add(
        broadcastRegistry(
          'navigation',
          callback: onModalNavigation,
          fieldsMatch: ['command', 'modalAction'],
          matchFunction: (payload) => payload.data.containsKey('modalAction'),
        ),
      );
    }

    return registries;
  }

  // CrosstabInterface implementation
  @override
  Future<void> sendMessage(CrosstabPayload payload) async {
    await _channel.send(payload);
  }

  @override
  void registerHandler(CrosstabRegistry registry) {
    _channel.register(registry);
  }

  @override
  bool unregisterHandler(CrosstabRegistry registry) {
    return _channel.unregister(registry);
  }

  @override
  int unregisterHandlersByType(String type) {
    return _channel.unregisterByType(type);
  }

  @override
  void onCrosstabMessage(CrosstabPayload payload) {
    // Override this method for custom message handling
    debugPrint(
      'CrosstabGoRouter received message: ${payload.header.type} from channel ${payload.header.channelId}',
    );
  }

  @override
  void onCrosstabError(String error) {
    debugPrint('CrosstabGoRouter error: $error');
  }

  /// Closes the cross-tab channel and cleans up resources
  void dispose() {
    _channel.close();
  }

  // GoRouter delegation methods for convenience
  String get location => _goRouter.routerDelegate.currentConfiguration.fullPath;
  bool canPop() => _goRouter.canPop();
  void go(String location, {Object? extra}) =>
      _goRouter.go(location, extra: extra);
  Future<T?> push<T extends Object?>(String location, {Object? extra}) =>
      _goRouter.push<T>(location, extra: extra);
  void pushReplacement(String location, {Object? extra}) =>
      _goRouter.pushReplacement(location, extra: extra);
  void pop<T extends Object?>([T? result]) => _goRouter.pop<T>(result);
  void goNamed(
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) => _goRouter.goNamed(
    name,
    pathParameters: pathParameters,
    queryParameters: queryParameters,
    extra: extra,
  );
  Future<T?> pushNamed<T extends Object?>(
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) => _goRouter.pushNamed<T>(
    name,
    pathParameters: pathParameters,
    queryParameters: queryParameters,
    extra: extra,
  );
  void refresh() => _goRouter.refresh();
}
