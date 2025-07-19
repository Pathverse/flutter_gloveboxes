/// Custom loaders for configuration files (JSON, YAML)
library;

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Parse and validate configuration files
Future<ConfigData> parseConfig(String assetPath) async {
  debugPrint('⚙️ Parsing config file: $assetPath');

  try {
    final String content = await rootBundle.loadString(assetPath);
    final extension = assetPath.split('.').last.toLowerCase();

    return ConfigData(
      path: assetPath,
      type: _getConfigType(extension),
      rawContent: content,
      parsedData: _parseConfigContent(content, extension),
      isValid: true,
    );
  } catch (e) {
    debugPrint('❌ Failed to parse config: $assetPath - $e');
    return ConfigData(
      path: assetPath,
      type: ConfigType.unknown,
      rawContent: '',
      parsedData: {},
      isValid: false,
      error: e.toString(),
    );
  }
}

/// Load JSON configuration with validation
Future<Map<String, dynamic>> loadJsonConfig(String assetPath) async {
  debugPrint('📋 Loading JSON config: $assetPath');

  final content = await rootBundle.loadString(assetPath);
  try {
    final Map<String, dynamic> data = json.decode(content);
    return _validateJsonConfig(data);
  } catch (e) {
    debugPrint('❌ Invalid JSON in $assetPath: $e');
    rethrow;
  }
}

/// Load application settings
Future<AppSettings> loadAppSettings(String assetPath) async {
  debugPrint('🔧 Loading app settings: $assetPath');

  final configData = await parseConfig(assetPath);

  if (!configData.isValid) {
    throw Exception('Invalid config file: ${configData.error}');
  }

  return AppSettings.fromMap(configData.parsedData);
}

ConfigType _getConfigType(String extension) {
  switch (extension) {
    case 'json':
      return ConfigType.json;
    case 'yaml':
    case 'yml':
      return ConfigType.yaml;
    default:
      return ConfigType.unknown;
  }
}

Map<String, dynamic> _parseConfigContent(String content, String extension) {
  switch (extension) {
    case 'json':
      return json.decode(content) as Map<String, dynamic>;
    case 'yaml':
    case 'yml':
      // Simple YAML parsing for demo (in real app, use yaml package)
      return _parseSimpleYaml(content);
    default:
      return {'content': content};
  }
}

Map<String, dynamic> _parseSimpleYaml(String yaml) {
  // Very basic YAML parsing for demonstration
  // In a real app, use the yaml package
  final Map<String, dynamic> result = {};
  final lines = yaml.split('\n');

  for (final line in lines) {
    final trimmed = line.trim();
    if (trimmed.isEmpty || trimmed.startsWith('#')) continue;

    if (trimmed.contains(':')) {
      final parts = trimmed.split(':');
      if (parts.length >= 2) {
        final key = parts[0].trim();
        final value = parts.sublist(1).join(':').trim();

        // Try to parse as number or boolean
        if (value == 'true') {
          result[key] = true;
        } else if (value == 'false') {
          result[key] = false;
        } else if (RegExp(r'^\d+$').hasMatch(value)) {
          result[key] = int.parse(value);
        } else if (RegExp(r'^\d+\.\d+$').hasMatch(value)) {
          result[key] = double.parse(value);
        } else {
          // Remove surrounding quotes
          String cleanValue = value;
          if ((cleanValue.startsWith('"') && cleanValue.endsWith('"')) ||
              (cleanValue.startsWith("'") && cleanValue.endsWith("'"))) {
            cleanValue = cleanValue.substring(1, cleanValue.length - 1);
          }
          result[key] = cleanValue;
        }
      }
    }
  }

  return result;
}

Map<String, dynamic> _validateJsonConfig(Map<String, dynamic> data) {
  // Add validation logic here
  if (data.containsKey('version')) {
    final version = data['version'];
    if (version is! String && version is! num) {
      throw FormatException('Invalid version format in config');
    }
  }

  return data;
}

/// Configuration data with metadata
class ConfigData {
  final String path;
  final ConfigType type;
  final String rawContent;
  final Map<String, dynamic> parsedData;
  final bool isValid;
  final String? error;

  const ConfigData({
    required this.path,
    required this.type,
    required this.rawContent,
    required this.parsedData,
    required this.isValid,
    this.error,
  });

  T? getValue<T>(String key) => parsedData[key] as T?;

  @override
  String toString() => 'ConfigData(path: $path, type: $type, valid: $isValid)';
}

/// Application settings parsed from config
class AppSettings {
  final String? appName;
  final String? version;
  final bool debugMode;
  final Map<String, dynamic> features;

  const AppSettings({
    this.appName,
    this.version,
    this.debugMode = false,
    this.features = const {},
  });

  factory AppSettings.fromMap(Map<String, dynamic> data) {
    return AppSettings(
      appName: data['app_name'] as String? ?? data['appName'] as String?,
      version: data['version']?.toString(),
      debugMode:
          data['debug_mode'] as bool? ?? data['debugMode'] as bool? ?? false,
      features: data['features'] as Map<String, dynamic>? ?? {},
    );
  }

  @override
  String toString() =>
      'AppSettings(name: $appName, version: $version, debug: $debugMode)';
}

enum ConfigType { json, yaml, unknown }
