import 'package:flutter/services.dart' show rootBundle;
import 'parsers/base.dart';
import 'parsers/env.dart';
import 'parsers/json.dart';
import 'parsers/toml.dart';

class ENV {
  static ENV? _instance;
  final Map<String, dynamic> _env = {};

  ENV._internal();

  static ENV get instance {
    _instance ??= ENV._internal();
    return _instance!;
  }

  /// Reset the singleton instance for testing purposes
  static void reset() {
    if (_instance != null) {
      _instance!._env.clear();
    }
    _instance = null;
  }

  Future<void> init() async {
    _env.clear();

    // Load root.env
    final rootEnv = await _loadFile('root.env');
    _mergeEnv(rootEnv);

    // Process {{file}} and <<file>> patterns in root.env values
    await _processFileReferences();
  }

  Future<void> _processFileReferences() async {
    final keys = _env.keys.toList();
    for (final key in keys) {
      final value = _env[key];
      if (value is String) {
        // Handle {{file}} pattern - direct merge
        if (value.startsWith('{{') && value.endsWith('}}')) {
          final fileName = value.substring(2, value.length - 2);
          try {
            final fileEnv = await _loadFile(fileName);
            _mergeEnv(fileEnv);
            // Remove the file reference key after successful loading
            _env.remove(key);
          } catch (e) {
            // Ignore if file doesn't exist, keep the original {{file}} value
          }
        }
        // Handle <<file>> pattern - prefixed merge
        else if (value.startsWith('<<') && value.endsWith('>>')) {
          final fileName = value.substring(2, value.length - 2);
          try {
            final fileEnv = await _loadFile(fileName);
            _mergePrefixedEnv(fileEnv, '${key}_');
            // Remove the file reference key after successful loading
            _env.remove(key);
          } catch (e) {
            // Ignore if file doesn't exist, keep the original <<file>> value
          }
        }
      }
    }
  }

  Future<Map<String, dynamic>> _loadFile(String fileName) async {
    final content = await rootBundle.loadString('envs/$fileName');
    final lines = content.split('\n');

    PVEnvBaseParser parser;
    if (fileName.endsWith('.env')) {
      parser = ENVParser();
    } else if (fileName.endsWith('.json')) {
      parser = JSONParser();
    } else if (fileName.endsWith('.toml')) {
      parser = TOMLParser();
    } else {
      throw Exception('Unsupported file format: $fileName');
    }

    return parser.parse(lines);
  }

  void _mergeEnv(Map<String, dynamic> env) {
    void merge(Map<String, dynamic> target, Map<String, dynamic> source) {
      source.forEach((key, value) {
        if (target[key] is Map && value is Map) {
          merge(
            target[key] as Map<String, dynamic>,
            value as Map<String, dynamic>,
          );
        } else {
          target[key] = value;
        }
      });
    }

    merge(_env, env);
  }

  void _mergePrefixedEnv(Map<String, dynamic> env, String prefix) {
    void mergePrefixed(
      Map<String, dynamic> target,
      Map<String, dynamic> source,
      String currentPrefix,
    ) {
      source.forEach((key, value) {
        final prefixedKey = '$currentPrefix$key';
        if (value is Map<String, dynamic>) {
          // For nested maps, create a nested structure with prefix
          target[prefixedKey] = <String, dynamic>{};
          mergePrefixed(target[prefixedKey] as Map<String, dynamic>, value, '');
        } else {
          target[prefixedKey] = value;
        }
      });
    }

    mergePrefixed(_env, env, prefix);
  }

  String? operator [](String key) {
    return _env[key]?.toString();
  }

  Map<String, dynamic> get env => Map.unmodifiable(_env);
}

// Global instance for easy access
ENV get env => ENV.instance;
