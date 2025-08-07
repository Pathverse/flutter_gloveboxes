import 'package:flutter/foundation.dart';
import 'package:logger/web.dart';

class _DebugOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    if (PVLogger.forwardChannels.isNotEmpty) {
      for (var channel in PVLogger.forwardChannels) {
        channel.send(event);
      }
      return;
    }

    assert(() {
      for (var line in event.lines) {
        // ignore: avoid_print
        print(line);
      }
      return true;
    }());
  }
}

mixin ForwardChannel {
  void send(OutputEvent event) {
    // Implement your forwarding logic here
  }
}

class _DebugFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    if (!kDebugMode) {
      return false;
    }

    final stackTraceString = event.stackTrace?.toString() ?? '';

    // analyze the stack trace to determine log's package
    final pathParts = stackTraceString.split('/');
    final package = pathParts.length > 1 ? pathParts[1] : '';
    if (PVLogger.disabledPackages.contains(package)) {
      return false;
    }

    // analyze the stack trace to determine log's file
    final fileParts = stackTraceString.split('(');
    final file = fileParts.isNotEmpty ? fileParts[0] : '';
    if (PVLogger.disabledFiles.contains(file)) {
      return false;
    }

    return true;
  }
}



class PVLogger {
  static Logger debugLogger = Logger(filter: _DebugFilter());
  static Logger stdLogger = Logger(output: _DebugOutput());

  static List<ForwardChannel> forwardChannels = [];

  static List<String> disabledPackages = [];
  static List<String> disabledFiles = [];

  static StackTrace createCurrentStack({bool one = true}) {
    // create stack trace
    var stackTrace = StackTrace.current;
    // pop the first level
    var stackRealStr = stackTrace.toString();
    stackRealStr = stackRealStr.replaceAll('<anonymous closure>', '<a>');

    var stackReal = stackRealStr.split('\n');

    // remove 2 levels
    StackTrace stackTrace2 = StackTrace.fromString(
      stackReal.sublist(one ? 1 : 2).join('\n'),
    );
    return stackTrace2;
  }

  static void log(
    dynamic message, {
    Level level = Level.debug,
    StackTrace? stack,
  }) {
    stack ??= createCurrentStack(one: false);
    stdLogger.log(level, message, stackTrace: stack);
  }

  static void debug(dynamic message, {StackTrace? stack}) {
    stack ??= createCurrentStack(one: false);
    debugLogger.log(Level.debug, message, stackTrace: stack);
  }
}
