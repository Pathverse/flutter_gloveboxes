import 'dart:convert';
import 'package:test/test.dart';
import 'package:pvlogger/pvlogger.dart';

void main() {
  group('Event Serialization Tests', () {
    test('PreEventContext toJson works correctly', () {
      final context = PreEventContext(
        raw: {
          'message': 'test',
          'data': [1, 2, 3],
        },
        namespace: 'test.app',
        extra: {
          'formatter': {'formatted': 'json data'},
          'metadata': {'processed': true},
          'tracking': {'id': 'abc123'},
        },
        scopes: ['auth', 'user'],
        runtimeArgs: {'userId': 123},
        asyncCall: true,
        level: 3,
      );

      // Test with all extra keys (default)
      final jsonAll = context.toJson();
      expect(jsonAll['extra'], hasLength(3));
      expect(jsonAll['extra']['formatter'], equals({'formatted': 'json data'}));
      expect(jsonAll['extra']['metadata'], equals({'processed': true}));
      expect(jsonAll['extra']['tracking'], equals({'id': 'abc123'}));

      // Test with selective extra keys
      final jsonSelective = context.toJson(['formatter', 'tracking']);
      expect(jsonSelective['extra'], hasLength(2));
      expect(
        jsonSelective['extra']['formatter'],
        equals({'formatted': 'json data'}),
      );
      expect(jsonSelective['extra']['tracking'], equals({'id': 'abc123'}));
      expect(jsonSelective['extra'], isNot(contains('metadata')));

      // Test toJsonString with selective keys
      final jsonString = context.toJsonString(['formatter']);
      expect(jsonString, contains('formatter'));
      expect(jsonString, isNot(contains('metadata')));
      expect(jsonString, isNot(contains('tracking')));
    });

    test('PVLogEvent toJson works correctly', () {
      final event = PVLogEvent(
        namespace: 'app.module',
        raw: 'Simple message',
        extra: {
          'formatted': {'content': 'processed message'},
          'tracking': {'id': 'abc123'},
          'metrics': {'duration': 150},
        },
        scopes: ['production', 'critical'],
        runtimeArgs: {'source': 'api'},
        asyncCall: false,
        level: 5,
      );

      // Test with all extra keys (default)
      final jsonAll = event.toJson();
      expect(jsonAll['extra'], hasLength(3));
      expect(
        jsonAll['extra']['formatted'],
        equals({'content': 'processed message'}),
      );
      expect(jsonAll['extra']['tracking'], equals({'id': 'abc123'}));
      expect(jsonAll['extra']['metrics'], equals({'duration': 150}));

      // Test with selective extra keys
      final jsonSelective = event.toJson(['tracking']);
      expect(jsonSelective['extra'], hasLength(1));
      expect(jsonSelective['extra']['tracking'], equals({'id': 'abc123'}));
      expect(jsonSelective['extra'], isNot(contains('formatted')));
      expect(jsonSelective['extra'], isNot(contains('metrics')));

      // Test toJsonString with no extra keys (empty list)
      final jsonEmpty = event.toJson([]);
      expect(jsonEmpty['extra'], isEmpty);

      // Test toJsonString method
      final jsonString = event.toJsonString(['formatted', 'metrics']);
      expect(jsonString, contains('formatted'));
      expect(jsonString, contains('metrics'));
      expect(jsonString, isNot(contains('tracking')));
    });

    test('PVLogEvent with stack trace serializes correctly', () async {
      // Create a logger and capture an actual event to get stack trace
      final testAdapter = TestCaptureAdapter();
      final logger = PVLogger('test');
      PVLogger.registerAdapter(testAdapter);

      await logger.log('Test with stack trace');

      expect(testAdapter.capturedEvents.length, equals(1));
      final event = testAdapter.capturedEvents.first;
      final json = event.toJson();

      expect(json['trigger'], isA<String>());
      expect(json['trigger'], isNotNull);

      // Verify the complete JSON can be encoded
      final jsonString = jsonEncode(json);
      expect(jsonString, contains('trigger'));
    });

    test('JSON serialization handles complex nested data', () {
      final complexData = {
        'users': [
          {
            'id': 1,
            'name': 'Alice',
            'roles': ['admin', 'user'],
          },
          {
            'id': 2,
            'name': 'Bob',
            'roles': ['user'],
          },
        ],
        'metadata': {
          'version': '1.0.0',
          'features': {'auth': true, 'logging': true},
        },
      };

      final event = PVLogEvent(
        namespace: 'complex.test',
        raw: complexData,
        extra: {
          'processing': {'time': 150, 'success': true},
        },
        level: 2,
      );

      final json = event.toJson();
      final jsonString = jsonEncode(json);

      // Verify complex nested structure is preserved
      expect(jsonString, contains('Alice'));
      expect(jsonString, contains('roles'));
      expect(jsonString, contains('features'));

      // Verify it can be decoded back
      final decoded = jsonDecode(jsonString);
      expect(decoded['raw']['users'][0]['name'], equals('Alice'));
      expect(decoded['namespace'], equals('complex.test'));
    });
  });
}

/// Test adapter that captures events for testing
class TestCaptureAdapter extends PVLogAdapter with Action {
  final List<PVLogEvent> capturedEvents = [];

  @override
  List<AdapterIntent> get intents => [AdapterIntent.action];

  @override
  void action(PVLogEvent event) {
    capturedEvents.add(event);
  }

  @override
  Future<void> actionAsync(PVLogEvent event) async {
    capturedEvents.add(event);
  }
}
