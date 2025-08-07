import 'package:flutter/foundation.dart';

class PVCacheLogger {
  static bool enabled = true;

  static Map<String, String> iconMap = {
    'info': 'ℹ️',
    'warn': '⚠️',
    'error': '❌',
    'debug': '🐛',
    'success': '✅',
    'cache': '🗄️',
    'storage': '💾',
    'adapter': '🔌',
    'config': '⚙️',
    'network': '🌐',
    'performance': '🚀',
    'security': '🔒',
    'user': '👤',
    'system': '🖥️',
    'database': '🗃️',
    'file': '📁',
    'memory': '🧠',
    'time': '⏰',
    'data': '📊',
    'process': '🔄',
  };

  static List<String> filterScopes = [];

  static void log(String message) {
    if (!enabled) return;

    assert(() {
      if (filterScopes.isNotEmpty) {
        // scope will be at the front (xxx) format
        // check if scope matched, if match, no log
        bool matched = false;
        for (var scope in filterScopes) {
          if (message.startsWith('($scope)')) {
            matched = true;
            break;
          }
        }
        if (matched) {
          return true;
        }
      }

      // check if has icon or not
      bool noIcon = !message.contains("[");
      if (noIcon) {
        message = "ℹ️ $message";
      }

      // replace any [icon] in message with icon from iconMap
      iconMap.forEach((key, value) {
        message = message.replaceAll('[$key]', value);
      });

      debugPrint(message);
      return true;
    }());
  }

  static void logWithScope(String scope, String message){
    log("($scope) $message");
  }
}
