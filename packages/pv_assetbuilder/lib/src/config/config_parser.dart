/// Configuration parser for build.yaml files with signature support
library;

import 'dart:io';
import 'package:yaml/yaml.dart';
import 'signature_config.dart';

/// Main configuration for pv_assetbuilder
class PVAssetBuilderConfig {
  final String target;
  final List<CustomPathConfig> customPaths;
  final DefaultConfig defaultConfig;
  final SignatureConfigCollection signatures;

  const PVAssetBuilderConfig({
    required this.target,
    required this.customPaths,
    required this.defaultConfig,
    required this.signatures,
  });

  factory PVAssetBuilderConfig.fromYaml(Map<String, dynamic> yaml) {
    final pvConfig = yaml['pv_assetprovider'] as Map<String, dynamic>? ?? {};

    return PVAssetBuilderConfig(
      target: pvConfig['target'] as String? ?? 'lib/generated',
      customPaths: _parseCustomPaths(pvConfig['custom'] as List?),
      defaultConfig: DefaultConfig.fromYaml(
        pvConfig['default'] as Map<String, dynamic>?,
      ),
      signatures: SignatureConfigCollection.fromYaml(
        yaml['signature'] as Map<String, dynamic>?,
      ),
    );
  }

  static List<CustomPathConfig> _parseCustomPaths(List? customList) {
    if (customList == null) return [];

    return customList
        .cast<Map<String, dynamic>>()
        .map((config) => CustomPathConfig.fromYaml(config))
        .toList();
  }
}

/// Configuration for custom path patterns
class CustomPathConfig {
  final String path;
  final bool provider;
  final bool objectmap;

  const CustomPathConfig({
    required this.path,
    required this.provider,
    required this.objectmap,
  });

  factory CustomPathConfig.fromYaml(Map<String, dynamic> yaml) {
    return CustomPathConfig(
      path: yaml['path'] as String,
      provider: yaml['provider'] as bool? ?? false,
      objectmap: yaml['objectmap'] as bool? ?? false,
    );
  }
}

/// Default configuration options
class DefaultConfig {
  final bool provider;

  const DefaultConfig({required this.provider});

  factory DefaultConfig.fromYaml(Map<String, dynamic>? yaml) {
    return DefaultConfig(provider: yaml?['provider'] as bool? ?? true);
  }
}

/// Configuration parser that reads and validates build.yaml files
class ConfigParser {
  /// Parse configuration from a build.yaml file
  static Future<PVAssetBuilderConfig> parseFile(String filePath) async {
    final file = File(filePath);
    if (!await file.exists()) {
      throw ConfigParseException('Configuration file not found: $filePath');
    }

    final contents = await file.readAsString();
    return parseString(contents);
  }

  /// Parse configuration from yaml string content
  static PVAssetBuilderConfig parseString(String yamlContent) {
    try {
      final yamlMap = loadYaml(yamlContent);
      final yaml = _convertYamlToMap(yamlMap);
      return PVAssetBuilderConfig.fromYaml(yaml);
    } catch (e) {
      throw ConfigParseException('Failed to parse YAML configuration: $e');
    }
  }

  /// Recursively convert YamlMap to Map<String, dynamic>
  static dynamic _convertYamlToMap(dynamic value) {
    if (value is YamlMap) {
      return Map<String, dynamic>.fromEntries(
        value.entries.map(
          (entry) =>
              MapEntry(entry.key.toString(), _convertYamlToMap(entry.value)),
        ),
      );
    } else if (value is YamlList) {
      return value.map(_convertYamlToMap).toList();
    } else {
      return value;
    }
  }

  /// Find and parse build.yaml from project root
  static Future<PVAssetBuilderConfig> findAndParse([
    String? projectRoot,
  ]) async {
    projectRoot ??= Directory.current.path;
    final buildYamlPath = '$projectRoot/build.yaml';

    if (!await File(buildYamlPath).exists()) {
      // Return default configuration if no build.yaml found
      return const PVAssetBuilderConfig(
        target: 'lib/generated',
        customPaths: [],
        defaultConfig: DefaultConfig(provider: true),
        signatures: SignatureConfigCollection({}),
      );
    }

    return parseFile(buildYamlPath);
  }

  /// Validate configuration and return any errors
  static List<String> validateConfig(PVAssetBuilderConfig config) {
    final errors = <String>[];

    // Validate target directory
    if (config.target.isEmpty) {
      errors.add('Target directory cannot be empty');
    }

    // Validate custom paths
    for (final customPath in config.customPaths) {
      if (customPath.path.isEmpty) {
        errors.add('Custom path cannot be empty');
      }
      if (!customPath.provider && !customPath.objectmap) {
        errors.add(
          'Custom path "${customPath.path}" must enable either provider or objectmap',
        );
      }
    }

    // Validate signatures
    for (final signature in config.signatures.signatures.values) {
      if (signature.matchConfig != null && !signature.matchConfig!.isValid) {
        errors.add(
          'Signature "${signature.name}" has invalid match configuration',
        );
      }
    }

    return errors;
  }
}

/// Exception thrown when configuration parsing fails
class ConfigParseException implements Exception {
  final String message;

  const ConfigParseException(this.message);

  @override
  String toString() => 'ConfigParseException: $message';
}
