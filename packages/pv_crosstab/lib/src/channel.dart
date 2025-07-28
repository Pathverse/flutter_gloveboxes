import 'dart:async';
import 'dart:convert';
import 'dart:js_interop';
import 'dart:math' as math;
import 'package:flutter/foundation.dart';
import 'package:web/web.dart' as web;
import 'payload.dart';
import 'registry.dart';

/// Cross-tab communication channel using BroadcastChannel API
///
/// This class manages secure communication between browser tabs using
/// registry-based message routing. It automatically matches incoming
/// messages against registered criteria and triggers appropriate callbacks.
///
/// Example usage:
/// ```dart
/// final channel = CrosstabChannel('my-app-channel');
///
/// // Register for notifications
/// channel.register(CrosstabRegistry(
///   typeMatch: 'notification',
///   callback: (payload) => showNotification(payload.data),
/// ));
///
/// // Send a notification to all tabs
/// await channel.send(await CrosstabPayload.unencrypted(
///   data: {'message': 'Hello from another tab!'},
///   type: 'notification',
/// ));
/// ```
class CrosstabChannel {
  /// The name/topic of the broadcast channel
  final String channelName;

  /// List of registry items for message matching and handling
  final List<CrosstabRegistry> _registries = [];

  /// The underlying BroadcastChannel instance
  late final web.BroadcastChannel _channel;

  /// Stream controller for raw message events (for debugging/monitoring)
  final StreamController<String> _messageStreamController =
      StreamController.broadcast();

  /// Stream controller for error events
  final StreamController<String> _errorStreamController =
      StreamController.broadcast();

  /// Random instance for generating unique message IDs
  final math.Random _random = math.Random();

  /// Whether the channel is currently active
  bool _isActive = false;

  /// Creates a new cross-tab communication channel
  ///
  /// [channelName] - The name of the BroadcastChannel (all tabs must use the same name)
  CrosstabChannel(this.channelName);

  /// Initializes the broadcast channel and starts listening for messages
  ///
  /// Must be called before sending or receiving messages.
  /// Safe to call multiple times - will only initialize once.
  void initialize() {
    if (_isActive) return;

    try {
      _channel = web.BroadcastChannel(channelName);
      _channel.addEventListener('message', _onMessage.toJS);
      _isActive = true;

      if (kDebugMode) {
        print('CrosstabChannel initialized: $channelName');
      }
    } catch (e) {
      _errorStreamController.add('Failed to initialize channel: $e');
      throw Exception('Failed to initialize BroadcastChannel: $e');
    }
  }

  /// Registers a new registry item for message handling
  ///
  /// When incoming messages match the registry criteria, the callback will be triggered.
  /// Multiple registries can be added for different message types or criteria.
  ///
  /// Example:
  /// ```dart
  /// channel.register(CrosstabRegistry(
  ///   typeMatch: 'user-action',
  ///   useSignature: true,
  ///   callback: (payload) => handleUserAction(payload),
  /// ));
  /// ```
  void register(CrosstabRegistry registry) {
    _registries.add(registry);

    if (kDebugMode) {
      print('Registered new handler for type: ${registry.typeMatch ?? "any"}');
    }
  }

  /// Registers multiple registry items for message handling
  ///
  /// Convenience method for registering multiple registries at once.
  /// Useful with preset functions that return lists of registries.
  ///
  /// Example:
  /// ```dart
  /// final syncPair = createSyncPair(
  ///   requestType: 'get-data',
  ///   responseType: 'data-response',
  ///   onRequest: handleRequest,
  ///   onResponse: handleResponse,
  /// );
  /// channel.registerMultiple(syncPair);
  /// ```
  void registerMultiple(List<CrosstabRegistry> registries) {
    _registries.addAll(registries);

    if (kDebugMode) {
      print('Registered ${registries.length} handlers');
    }
  }

  /// Removes a registry item from message handling
  ///
  /// Returns true if the registry was found and removed, false otherwise.
  bool unregister(CrosstabRegistry registry) {
    final removed = _registries.remove(registry);

    if (kDebugMode && removed) {
      debugPrint('Unregistered handler for type: ${registry.typeMatch ?? "any"}');
    }

    return removed;
  }

  /// Removes all registry items matching the given type
  ///
  /// Returns the number of registries removed.
  int unregisterByType(String type) {
    final initialCount = _registries.length;
    _registries.removeWhere((registry) => registry.typeMatch == type);
    final removedCount = initialCount - _registries.length;

    if (kDebugMode && removedCount > 0) {
      debugPrint('Unregistered $removedCount handlers for type: $type');
    }

    return removedCount;
  }

  /// Sends a payload to all other tabs listening on this channel
  ///
  /// The payload will be serialized to JSON and sent via BroadcastChannel.
  /// Other tabs with matching registries will receive and process the message.
  ///
  /// Example:
  /// ```dart
  /// final payload = await CrosstabPayload.signed(
  ///   data: {'action': 'logout', 'userId': '123'},
  ///   type: 'command',
  /// );
  /// await channel.send(payload);
  /// ```
  Future<void> send(CrosstabPayload payload) async {
    if (!_isActive) {
      throw Exception('Channel not initialized. Call initialize() first.');
    }

    try {
      // Add a unique message ID for tracking/debugging
      final payloadMap = await payload.getMap();
      payloadMap['_messageId'] = _generateMessageId();

      final jsonMessage = jsonEncode(payloadMap);
      _channel.postMessage(jsonMessage.toJS);

      if (kDebugMode) {
        print(
          'Sent ${payload.header.type} payload (${jsonMessage.length} bytes)',
        );
      }
    } catch (e) {
      _errorStreamController.add('Failed to send message: $e');
      throw Exception('Failed to send payload: $e');
    }
  }

  /// Internal message handler for BroadcastChannel events
  void _onMessage(web.Event event) {
    final messageEvent = event as web.MessageEvent;
    _handleIncomingMessage(messageEvent.data);
  }

  /// Processes incoming messages and triggers matching registry callbacks
  Future<void> _handleIncomingMessage(JSAny? data) async {
    try {
      // Convert JS data to Dart string
      final messageData = (data as JSString).toDart;
      _messageStreamController.add(messageData);

      if (kDebugMode) {
        print('Received message: ${messageData.length} bytes');
      }

      // Parse JSON to payload
      final payloadMap = jsonDecode(messageData) as Map<String, dynamic>;
      final payload = CrosstabPayload.fromMap(payloadMap);

      if (kDebugMode) {
        print(
          'Parsed ${payload.header.type} payload, checking ${_registries.length} registries',
        );
      }

      // Check each registry for matches
      int matchCount = 0;
      for (final registry in _registries) {
        try {
          final matches = await registry.match(payload);
          if (matches) {
            matchCount++;

            if (kDebugMode) {
              print(
                'Registry matched, triggering callback for ${payload.header.type}',
              );
            }

            // Trigger the callback
            registry.callback(payload);
          }
        } catch (e) {
          _errorStreamController.add('Registry callback error: $e');

          if (kDebugMode) {
            print('Error in registry callback: $e');
          }
        }
      }

      if (kDebugMode) {
        print(
          'Message processed: $matchCount/${_registries.length} registries matched',
        );
      }
    } catch (e) {
      _errorStreamController.add('Failed to process incoming message: $e');

      if (kDebugMode) {
        print('Error processing message: $e');
      }
    }
  }

  /// Generates a unique message ID for tracking
  String _generateMessageId() {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final random = _random.nextInt(999999).toString().padLeft(6, '0');
    return '${timestamp}_$random';
  }

  /// Stream of raw incoming messages (for debugging/monitoring)
  Stream<String> get messageStream => _messageStreamController.stream;

  /// Stream of error messages
  Stream<String> get errorStream => _errorStreamController.stream;

  /// Number of currently registered handlers
  int get registryCount => _registries.length;

  /// Whether the channel is currently active and listening
  bool get isActive => _isActive;

  /// Closes the channel and cleans up resources
  ///
  /// After calling this, you'll need to call initialize() again to resume communication.
  void close() {
    if (!_isActive) return;

    try {
      _channel.removeEventListener('message', _onMessage.toJS);
      _channel.close();
      _isActive = false;

      _messageStreamController.close();
      _errorStreamController.close();

      if (kDebugMode) {
        print('CrosstabChannel closed: $channelName');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error closing channel: $e');
      }
    }
  }
}
