import 'package:flutter/material.dart';
import 'channel.dart';
import 'registry.dart';
import 'payload.dart';

/// Interface for widgets that can send and receive cross-tab messages
///
/// This interface provides a standard way for widgets to interact with
/// the cross-tab communication system. Implementing widgets can:
/// - Send messages to other tabs
/// - Register for specific message types
/// - Handle incoming messages automatically
abstract class CrosstabInterface {
  /// The CrosstabChannel instance for communication
  CrosstabChannel get channel;

  /// Sends a payload to other tabs via the channel
  ///
  /// This is a convenience method that widgets can use to send messages
  /// without directly accessing the channel.
  Future<void> sendMessage(CrosstabPayload payload);

  /// Registers a handler for incoming messages
  ///
  /// Widgets should call this to set up message handling for specific
  /// message types or criteria. Multiple registries can be added.
  void registerHandler(CrosstabRegistry registry);

  /// Unregisters a specific handler
  ///
  /// Returns true if the handler was found and removed.
  bool unregisterHandler(CrosstabRegistry registry);

  /// Unregisters all handlers for a specific message type
  ///
  /// Returns the number of handlers removed.
  int unregisterHandlersByType(String type);

  /// Called when the widget receives a matching message
  ///
  /// Widgets should override this to handle incoming messages.
  /// This method is called automatically when registered criteria match.
  void onCrosstabMessage(CrosstabPayload payload);

  /// Called when there's an error in cross-tab communication
  ///
  /// Widgets can override this to handle communication errors.
  void onCrosstabError(String error) {
    debugPrint('Crosstab error: $error');
  }
}

/// Stateless widget with cross-tab communication capabilities
///
/// This widget provides a base class for stateless widgets that need to
/// communicate across browser tabs. It handles channel initialization,
/// message sending, and automatic message routing.
///
/// Example usage:
/// ```dart
/// class NotificationWidget extends CrosstabStatelessWidget {
///   const NotificationWidget({super.key, required super.channelName});
///
///   @override
///   void initializeHandlers() {
///     registerHandler(CrosstabRegistry(
///       typeMatch: 'notification',
///       callback: (payload) => onCrosstabMessage(payload),
///     ));
///   }
///
///   @override
///   void onCrosstabMessage(CrosstabPayload payload) {
///     // Handle incoming notifications
///     showDialog(/* show notification dialog */);
///   }
///
///   @override
///   Widget build(BuildContext context) {
///     return ElevatedButton(
///       onPressed: () => sendNotification(),
///       child: Text('Send Notification'),
///     );
///   }
///
///   Future<void> sendNotification() async {
///     final payload = await CrosstabPayload.unencrypted(
///       data: {'message': 'Hello from widget!'},
///       type: 'notification',
///     );
///     await sendMessage(payload);
///   }
/// }
/// ```
abstract class CrosstabStatelessWidget extends StatelessWidget
    implements CrosstabInterface {
  /// The name of the broadcast channel to use
  final String channelName;

  /// The CrosstabChannel instance for this widget
  late final CrosstabChannel _channel;

  CrosstabStatelessWidget({super.key, required this.channelName}) {
    _channel = CrosstabChannel(channelName);
    _initializeChannel();
  }

  @override
  CrosstabChannel get channel => _channel;

  /// Initializes the channel and sets up error handling
  void _initializeChannel() {
    try {
      _channel.initialize();

      // Listen for errors
      _channel.errorStream.listen(onCrosstabError);

      // Let the widget set up its message handlers
      initializeHandlers();
    } catch (e) {
      onCrosstabError('Failed to initialize channel: $e');
    }
  }

  /// Override this method to register message handlers
  ///
  /// This is called automatically during widget initialization.
  /// Use `registerHandler()` to set up message handling.
  ///
  /// Example:
  /// ```dart
  /// @override
  /// void initializeHandlers() {
  ///   registerHandler(CrosstabRegistry(
  ///     typeMatch: 'my-message-type',
  ///     callback: (payload) => onCrosstabMessage(payload),
  ///   ));
  /// }
  /// ```
  void initializeHandlers();

  @override
  Future<void> sendMessage(CrosstabPayload payload) async {
    try {
      await _channel.send(payload);
    } catch (e) {
      onCrosstabError('Failed to send message: $e');
    }
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
  void onCrosstabMessage(CrosstabPayload payload);
}

/// Stateful widget with cross-tab communication capabilities
///
/// This widget provides a base class for stateful widgets that need to
/// communicate across browser tabs. It handles channel initialization,
/// lifecycle management, message sending, and automatic message routing.
///
/// The channel is automatically cleaned up when the widget is disposed.
///
/// Example usage:
/// ```dart
/// class ChatWidget extends CrosstabStatefulWidget {
///   const ChatWidget({super.key, required super.channelName});
///
///   @override
///   State<ChatWidget> createState() => _ChatWidgetState();
/// }
///
/// class _ChatWidgetState extends CrosstabStatefulWidgetState<ChatWidget> {
///   List<String> messages = [];
///
///   @override
///   void initializeHandlers() {
///     registerHandler(CrosstabRegistry(
///       typeMatch: 'chat-message',
///       channelIdMatch: 'room-*',
///       callback: (payload) => onCrosstabMessage(payload),
///     ));
///   }
///
///   @override
///   void onCrosstabMessage(CrosstabPayload payload) {
///     setState(() {
///       messages.add(payload.data['content']);
///     });
///   }
///
///   @override
///   Widget build(BuildContext context) {
///     return Column(
///       children: [
///         ...messages.map((msg) => Text(msg)),
///         ElevatedButton(
///           onPressed: sendChatMessage,
///           child: Text('Send Message'),
///         ),
///       ],
///     );
///   }
///
///   Future<void> sendChatMessage() async {
///     final payload = await CrosstabPayload.signed(
///       data: {'content': 'Hello chat!', 'sender': 'user123'},
///       type: 'chat-message',
///       channelId: 'room-general',
///     );
///     await sendMessage(payload);
///   }
/// }
/// ```
abstract class CrosstabStatefulWidget extends StatefulWidget {
  /// The name of the broadcast channel to use
  final String channelName;

  const CrosstabStatefulWidget({super.key, required this.channelName});
}

/// State class for CrosstabStatefulWidget with channel integration
///
/// This state class handles the channel lifecycle and provides the same
/// interface as CrosstabStatelessWidget for cross-tab communication.
abstract class CrosstabStatefulWidgetState<T extends CrosstabStatefulWidget>
    extends State<T>
    implements CrosstabInterface {
  /// The CrosstabChannel instance for this widget
  late final CrosstabChannel _channel;

  /// Whether the channel has been initialized
  bool _isChannelInitialized = false;

  @override
  CrosstabChannel get channel => _channel;

  @override
  void initState() {
    super.initState();
    _channel = CrosstabChannel(widget.channelName);
    _initializeChannel();
  }

  @override
  void dispose() {
    // Clean up the channel when the widget is disposed
    if (_isChannelInitialized) {
      _channel.close();
    }
    super.dispose();
  }

  /// Initializes the channel and sets up error handling
  void _initializeChannel() {
    try {
      _channel.initialize();
      _isChannelInitialized = true;

      // Listen for errors
      _channel.errorStream.listen(onCrosstabError);

      // Let the widget set up its message handlers
      initializeHandlers();
    } catch (e) {
      onCrosstabError('Failed to initialize channel: $e');
    }
  }

  /// Override this method to register message handlers
  ///
  /// This is called automatically during widget initialization.
  /// Use `registerHandler()` to set up message handling.
  ///
  /// Example:
  /// ```dart
  /// @override
  /// void initializeHandlers() {
  ///   registerHandler(CrosstabRegistry(
  ///     typeMatch: 'my-message-type',
  ///     callback: (payload) => onCrosstabMessage(payload),
  ///   ));
  /// }
  /// ```
  void initializeHandlers();

  @override
  Future<void> sendMessage(CrosstabPayload payload) async {
    if (!_isChannelInitialized) {
      onCrosstabError('Cannot send message: channel not initialized');
      return;
    }

    try {
      await _channel.send(payload);
    } catch (e) {
      onCrosstabError('Failed to send message: $e');
    }
  }

  @override
  void registerHandler(CrosstabRegistry registry) {
    if (_isChannelInitialized) {
      _channel.register(registry);
    } else {
      onCrosstabError('Cannot register handler: channel not initialized');
    }
  }

  @override
  bool unregisterHandler(CrosstabRegistry registry) {
    if (_isChannelInitialized) {
      return _channel.unregister(registry);
    }
    return false;
  }

  @override
  int unregisterHandlersByType(String type) {
    if (_isChannelInitialized) {
      return _channel.unregisterByType(type);
    }
    return 0;
  }

  @override
  void onCrosstabMessage(CrosstabPayload payload);

  @override
  void onCrosstabError(String error) {
    debugPrint('Crosstab error in ${widget.runtimeType}: $error');
  }
}
