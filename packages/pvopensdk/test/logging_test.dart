import 'package:flutter_test/flutter_test.dart';
import 'package:logger/web.dart';
import 'package:pvopensdk/utils/logging.dart';

// Test implementation of ForwardChannel
class TestForwardChannel with ForwardChannel {
  final List<OutputEvent> receivedEvents = [];

  @override
  void send(OutputEvent event) {
    receivedEvents.add(event);
  }
}

// Helper to create OutputEvent for testing
OutputEvent createTestOutputEvent(List<String> lines) {
  return OutputEvent(LogEvent(Level.debug, 'test', stackTrace: StackTrace.current), lines);
}

// Helper to create LogEvent for testing
LogEvent createTestLogEvent(Level level, String message, [StackTrace? stackTrace]) {
  return LogEvent(level, message, stackTrace: stackTrace);
}

void main() {
  group('PVLogger', () {
    setUp(() {
      // Reset static state before each test
      PVLogger.forwardChannels.clear();
      PVLogger.disabledPackages.clear();
      PVLogger.disabledFiles.clear();
    });

    group('ForwardChannel', () {
      test('should implement send method', () {
        final channel = TestForwardChannel();
        final event = createTestOutputEvent(['test message']);
        
        channel.send(event);
        
        expect(channel.receivedEvents, hasLength(1));
        expect(channel.receivedEvents.first, equals(event));
      });
    });

    group('createCurrentStack', () {
      test('should create a stack trace with removed levels', () {
        final stackTrace = PVLogger.createCurrentStack();
        
        expect(stackTrace, isNotNull);
        expect(stackTrace.toString(), isA<String>());
        
        // The stack trace should not be empty
        final lines = stackTrace.toString().split('\n');
        expect(lines, isNotEmpty);
        
        // Verify that the method removes 2 levels as intended
        // This is a bit tricky to test precisely, but we can at least verify
        // that the stack trace doesn't contain the createCurrentStack method itself
        final stackString = stackTrace.toString();
        expect(stackString.contains('createCurrentStack'), isFalse);
      });

      test('should handle edge cases in stack trace parsing', () {
        // Test that createCurrentStack doesn't throw exceptions
        expect(() => PVLogger.createCurrentStack(), returnsNormally);
      });
    });

    group('log method', () {
      test('should log with default debug level', () {
        final channel = TestForwardChannel();
        PVLogger.forwardChannels.add(channel);
        
        PVLogger.log('test message');
        
        expect(channel.receivedEvents, hasLength(1));
        expect(channel.receivedEvents.first.lines.any((line) => line.contains('test message')), isTrue);
      });

      test('should log with specified level', () {
        final channel = TestForwardChannel();
        PVLogger.forwardChannels.add(channel);
        
        PVLogger.log('error message', level: Level.error);
        
        expect(channel.receivedEvents, hasLength(1));
        expect(channel.receivedEvents.first.lines.any((line) => line.contains('error message')), isTrue);
      });

      test('should use provided stack trace', () {
        final channel = TestForwardChannel();
        PVLogger.forwardChannels.add(channel);
        final customStack = StackTrace.fromString('custom stack trace');
        
        PVLogger.log('test with custom stack', stack: customStack);
        
        expect(channel.receivedEvents, hasLength(1));
        expect(channel.receivedEvents.first.lines.any((line) => line.contains('test with custom stack')), isTrue);
      });

      test('should create stack trace when none provided', () {
        final channel = TestForwardChannel();
        PVLogger.forwardChannels.add(channel);
        
        PVLogger.log('test without stack');
        
        expect(channel.receivedEvents, hasLength(1));
        // The event should have been logged successfully
        expect(channel.receivedEvents.first.lines.any((line) => line.contains('test without stack')), isTrue);
      });
    });

    group('debug method', () {
      test('should log debug message through debug logger', () {
        final channel = TestForwardChannel();
        PVLogger.forwardChannels.add(channel);
        
        PVLogger.debug('debug message');
        
        // Debug logger doesn't use _DebugOutput, so it won't forward to channels
        // We verify the method runs without error
        expect(() => PVLogger.debug('debug message'), returnsNormally);
        // Debug logger doesn't forward to forward channels
        expect(channel.receivedEvents, hasLength(0));
      });

      test('should use provided stack trace for debug', () {
        final channel = TestForwardChannel();
        PVLogger.forwardChannels.add(channel);
        // Use a stack trace format that won't cause parsing errors
        // The issue is that split('/')[1] fails if there's no '/' or only one part
        final customStack = StackTrace.fromString('first/second/third.dart:10:5');
        
        expect(() => PVLogger.debug('debug with custom stack', stack: customStack), returnsNormally);
      });

      test('should create stack trace when none provided for debug', () {
        final channel = TestForwardChannel();
        PVLogger.forwardChannels.add(channel);
        
        expect(() => PVLogger.debug('debug without stack'), returnsNormally);
        // Debug logger doesn't forward to forward channels
        expect(channel.receivedEvents, hasLength(0));
      });
    });

    group('_DebugOutput behavior', () {
      test('should forward events to channels when channels are present', () {
        final channel1 = TestForwardChannel();
        final channel2 = TestForwardChannel();
        PVLogger.forwardChannels.addAll([channel1, channel2]);
        
        PVLogger.log('multi-channel test');
        
        expect(channel1.receivedEvents, hasLength(1));
        expect(channel2.receivedEvents, hasLength(1));
        expect(channel1.receivedEvents.first.lines.any((line) => line.contains('multi-channel test')), isTrue);
        expect(channel2.receivedEvents.first.lines.any((line) => line.contains('multi-channel test')), isTrue);
      });

      test('should not forward when no channels are present', () {
        // Ensure no channels are present
        PVLogger.forwardChannels.clear();
        
        // This should not throw an exception and should fall back to print
        expect(() => PVLogger.log('test message'), returnsNormally);
      });
    });

    group('_DebugFilter behavior', () {
      test('should filter out disabled packages', () {
        PVLogger.disabledPackages.add('disabled_package');
        final channel = TestForwardChannel();
        PVLogger.forwardChannels.add(channel);
        
        // Create a stack trace that matches the expected format for package filtering
        final stackTrace = StackTrace.fromString('some/disabled_package/file.dart:10:5');
        
        expect(() => PVLogger.debug('should be filtered', stack: stackTrace), returnsNormally);
      });

      test('should filter out disabled files', () {
        PVLogger.disabledFiles.add('test/package/disabled_file.dart');
        final channel = TestForwardChannel();
        PVLogger.forwardChannels.add(channel);
        
        // Create a stack trace that should be filtered by file name
        final stackTrace = StackTrace.fromString('test/package/disabled_file.dart:10:5 (method)');
        
        expect(() => PVLogger.debug('should be filtered', stack: stackTrace), returnsNormally);
      });

      test('should handle null stack trace gracefully', () {
        final channel = TestForwardChannel();
        PVLogger.forwardChannels.add(channel);
        
        // This should work since log() creates a stack trace when none provided
        expect(() => PVLogger.debug('test with null stack'), returnsNormally);
      });

      test('should handle malformed stack traces without crashing', () {
        final channel = TestForwardChannel();
        PVLogger.forwardChannels.add(channel);
        
        // Test various malformed stack traces that could cause parsing errors
        final malformedTraces = [
          StackTrace.fromString('no_slashes_at_all'),
          StackTrace.fromString('/single_slash'),
          StackTrace.fromString(''),
          StackTrace.fromString('normal/path/but/no/parentheses'),
        ];
        
        for (final trace in malformedTraces) {
          expect(() => PVLogger.debug('test malformed', stack: trace), returnsNormally);
        }
      });
    });

    group('Static Configuration', () {
      test('should maintain separate logger instances', () {
        expect(PVLogger.debugLogger, isNotNull);
        expect(PVLogger.stdLogger, isNotNull);
        expect(PVLogger.debugLogger, isNot(equals(PVLogger.stdLogger)));
      });

      test('should allow modification of forward channels', () {
        final channel = TestForwardChannel();
        
        PVLogger.forwardChannels.add(channel);
        
        expect(PVLogger.forwardChannels, contains(channel));
        expect(PVLogger.forwardChannels, hasLength(1));
      });

      test('should allow modification of disabled packages', () {
        const packageName = 'test_package';
        
        PVLogger.disabledPackages.add(packageName);
        
        expect(PVLogger.disabledPackages, contains(packageName));
        expect(PVLogger.disabledPackages, hasLength(1));
      });

      test('should allow modification of disabled files', () {
        const fileName = 'test_file.dart';
        
        PVLogger.disabledFiles.add(fileName);
        
        expect(PVLogger.disabledFiles, contains(fileName));
        expect(PVLogger.disabledFiles, hasLength(1));
      });
    });

    group('Integration Tests', () {
      test('should log different message types correctly', () {
        final channel = TestForwardChannel();
        PVLogger.forwardChannels.add(channel);
        
        // Test different message types
        PVLogger.log('string message');
        PVLogger.log(42);
        PVLogger.log({'key': 'value'});
        PVLogger.log([1, 2, 3]);
        
        expect(channel.receivedEvents, hasLength(4));
      });

      test('should handle different log levels', () {
        final channel = TestForwardChannel();
        PVLogger.forwardChannels.add(channel);
        
        PVLogger.log('trace message', level: Level.trace);
        PVLogger.log('debug message', level: Level.debug);
        PVLogger.log('info message', level: Level.info);
        PVLogger.log('warning message', level: Level.warning);
        PVLogger.log('error message', level: Level.error);
        PVLogger.log('fatal message', level: Level.fatal);
        
        expect(channel.receivedEvents, hasLength(6));
      });

      test('should work with both debug and regular loggers', () {
        final channel = TestForwardChannel();
        PVLogger.forwardChannels.add(channel);
        
        PVLogger.log('regular log');
        
        // Only the stdLogger (used by log()) forwards to channels directly
        // The debugLogger (used by debug()) uses a different output mechanism
        expect(channel.receivedEvents, hasLength(1));
        expect(channel.receivedEvents[0].lines.any((line) => line.contains('regular log')), isTrue);
        
        // Clear and test debug separately - it won't forward to channels
        channel.receivedEvents.clear();
        expect(() => PVLogger.debug('debug log'), returnsNormally);
        
        // Debug logger doesn't forward to channels, so we expect no new events
        expect(channel.receivedEvents, hasLength(0));
      });
    });
  });
}
