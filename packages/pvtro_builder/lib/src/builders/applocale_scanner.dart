import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:build/build.dart';
import 'package:path/path.dart' as p;
import 'package:yaml/yaml.dart';

/// Scans packages for slang-generated AppLocale enums and LocaleSettings
class AppLocaleScanner {
  /// Scan all packages for slang translations
  Future<List<SlangPackage>> scanForSlangPackages() async {
    final packages = <SlangPackage>[];

    // Get package configuration
    final packageConfig = await _getPackageConfig();

    // Scan current package
    final currentPackage = await _scanPackageForSlang('.');
    if (currentPackage != null) {
      packages.add(currentPackage);
    }

    // Scan all dependencies
    for (final packageInfo in packageConfig) {
      if (packageInfo.name != 'pvtro' && packageInfo.name != 'pvtro_builder') {
        final slangPackage = await _scanPackageForSlang(packageInfo.rootPath);
        if (slangPackage != null) {
          packages.add(slangPackage);
        }
      }
    }

    return packages;
  }

  Future<List<PackageInfo>> _getPackageConfig() async {
    final packages = <PackageInfo>[];

    try {
      final packageConfigFile = File('.dart_tool/package_config.json');
      if (await packageConfigFile.exists()) {
        final content = await packageConfigFile.readAsString();
        final config = jsonDecode(content) as Map<String, dynamic>;

        final packageList = config['packages'] as List<dynamic>;
        final packageConfigDir = packageConfigFile
            .parent
            .parent
            .path; // Go up from .dart_tool to root

        for (final package in packageList) {
          final packageMap = package as Map<String, dynamic>;
          final name = packageMap['name'] as String;
          final rootUri = packageMap['rootUri'] as String;

          // Convert relative URIs to absolute paths
          String rootPath;
          if (rootUri.startsWith('file:///')) {
            // Absolute file URI
            rootPath = Uri.parse(rootUri).toFilePath();
          } else {
            // Relative path - resolve relative to package config directory
            rootPath = p.normalize(p.join(packageConfigDir, rootUri));

            // Check if this resolved path exists, if not try adjusting the relative path
            if (!await Directory(rootPath).exists()) {
              // Try removing one ../ level (common issue with package config generation)
              final adjustedUri = rootUri.replaceFirst('../', '');
              final adjustedPath = p.normalize(
                p.join(packageConfigDir, adjustedUri),
              );
              if (await Directory(adjustedPath).exists()) {
                log.info('Adjusted path for $name: $rootUri -> $adjustedUri');
                rootPath = adjustedPath;
              }
            }
          }

          log.info('Found package: $name at $rootPath');
          packages.add(PackageInfo(name: name, rootPath: rootPath));
        }
      }
    } catch (e) {
      log.warning('Could not read package config: $e');
    }

    return packages;
  }

  Future<SlangPackage?> _scanPackageForSlang(String packagePath) async {
    try {
      // Check if package has slang configuration
      final pubspecFile = File(p.join(packagePath, 'pubspec.yaml'));
      if (!await pubspecFile.exists()) return null;

      final content = await pubspecFile.readAsString();
      final pubspec = loadYaml(content) as Map<dynamic, dynamic>?;

      // Look for slang in dependencies or slang configuration
      final dependencies = pubspec?['dependencies'] as Map<dynamic, dynamic>?;
      final devDependencies =
          pubspec?['dev_dependencies'] as Map<dynamic, dynamic>?;
      final slangConfig = pubspec?['slang'] as Map<dynamic, dynamic>?;

      // First, try to find the generated strings.g.dart file
      final stringsFile = await _findStringsFile(packagePath);
      if (stringsFile == null) {
        // No strings.g.dart found, not a slang package
        log.info('Package ${p.basename(packagePath)}: No strings.g.dart found');
        return null;
      }

      // If we found strings.g.dart, it's likely a slang package
      // Let's also verify it has slang dependencies for extra safety
      final hasSlangDependency =
          dependencies?.containsKey('slang') == true ||
          dependencies?.containsKey('slang_flutter') == true ||
          devDependencies?.containsKey('slang') == true ||
          devDependencies?.containsKey('slang_flutter') == true ||
          slangConfig != null;

      // Log what we found for debugging
      log.info(
        'Package ${p.basename(packagePath)}: found strings.g.dart at ${stringsFile.path}, '
        'has slang dependency: $hasSlangDependency',
      );

      // Analyze the strings file to extract AppLocale enum and LocaleSettings
      final analysis = await _analyzeStringsFile(stringsFile);
      if (analysis == null) {
        log.warning(
          'Failed to analyze strings file for ${p.basename(packagePath)}',
        );
        return null;
      }

      final packageName =
          pubspec?['name'] as String? ?? p.basename(packagePath);

      return SlangPackage(
        name: packageName,
        path: packagePath,
        stringsFilePath: stringsFile.path,
        appLocaleEnum: analysis.appLocaleEnum,
        localeSettingsClass: analysis.localeSettingsClass,
        availableLocales: analysis.availableLocales,
        importPath: _generateImportPath(stringsFile.path, packageName),
      );
    } catch (e) {
      log.warning('Error scanning package $packagePath for slang: $e');
      return null;
    }
  }

  Future<File?> _findStringsFile(String packagePath) async {
    final libDir = Directory(p.join(packagePath, 'lib'));
    if (!await libDir.exists()) return null;

    // Common slang generated file patterns
    final patterns = [
      'i18n/strings.g.dart',
      'l10n/strings.g.dart',
      'translations/strings.g.dart',
      'strings.g.dart',
    ];

    for (final pattern in patterns) {
      final file = File(p.join(libDir.path, pattern));
      if (await file.exists()) {
        return file;
      }
    }

    // Fallback: search recursively for any strings.g.dart
    await for (final entity in libDir.list(recursive: true)) {
      if (entity is File && entity.path.endsWith('strings.g.dart')) {
        return entity;
      }
    }

    return null;
  }

  Future<SlangAnalysis?> _analyzeStringsFile(File stringsFile) async {
    try {
      final content = await stringsFile.readAsString();
      log.info(
        'Analyzing ${stringsFile.path}, content length: ${content.length}',
      );

      // Extract AppLocale enum (handle both simple and complex enum declarations)
      final appLocaleMatch = RegExp(
        r'enum\s+AppLocale\s+.*?\{([^}]+)\}',
        multiLine: true,
        dotAll: true,
      ).firstMatch(content);

      if (appLocaleMatch == null) {
        log.warning('No AppLocale enum found in ${stringsFile.path}');
        return null;
      }

      final enumContent = appLocaleMatch.group(1)!;
      final locales = <String>[];

      // Extract locale values from enum - look for enum values like "en(languageCode: 'en'),"
      final localeMatches = RegExp(
        r'^\s*(\w+)\s*\(', // Match word followed by opening parenthesis at start of line
        multiLine: true,
      ).allMatches(enumContent);

      // Also try simpler pattern for enums without parameters
      if (localeMatches.isEmpty) {
        final simpleMatches = RegExp(
          r'^\s*(\w+)\s*,', // Match word followed by comma at start of line
          multiLine: true,
        ).allMatches(enumContent);
        for (final match in simpleMatches) {
          locales.add(match.group(1)!);
        }
      }
      for (final match in localeMatches) {
        final locale = match.group(1)!;
        // Filter out obvious non-language-code keywords
        if (!_isLanguageCode(locale)) continue;
        locales.add(locale);
      }

      // Check for LocaleSettings class
      final hasLocaleSettings = content.contains('class LocaleSettings');

      return SlangAnalysis(
        appLocaleEnum: 'AppLocale',
        localeSettingsClass: hasLocaleSettings ? 'LocaleSettings' : null,
        availableLocales: locales,
      );
    } catch (e) {
      log.warning('Error analyzing strings file ${stringsFile.path}: $e');
      return null;
    }
  }

  String _generateImportPath(String filePath, String packageName) {
    final parts = filePath.split(Platform.pathSeparator);
    final libIndex = parts.lastIndexOf('lib');

    if (libIndex >= 0 && libIndex < parts.length - 1) {
      final relativePath = parts.sublist(libIndex + 1).join('/');
      return 'package:$packageName/$relativePath';
    }

    return filePath;
  }

  /// Check if a string looks like a language code rather than a Dart keyword
  bool _isLanguageCode(String token) {
    // Filter out obvious Dart keywords and syntax elements
    const dartKeywords = {
      'const',
      'required',
      'this',
      'AppLocale',
      'languageCode',
      'scriptCode',
      'countryCode',
      'ignore',
      'unused_element',
      'unused_element_parameter',
      'final',
      'String',
      'override',
      'BaseAppLocale',
      'Translations',
      'Map',
      'dynamic',
      'Node',
      'overrides',
      'cardinalResolver',
      'ordinalResolver',
      'meta',
    };

    // Check if it's a known Dart keyword
    if (dartKeywords.contains(token)) return false;

    // Check if it looks like a language code (2-5 characters, mostly lowercase)
    if (token.length < 2 || token.length > 8) return false;

    // Language codes are typically lowercase with possible camelCase for variants
    final hasValidPattern = RegExp(
      r'^[a-z]{2,3}([A-Z][a-z]*)?$',
    ).hasMatch(token);

    return hasValidPattern;
  }
}

class PackageInfo {
  final String name;
  final String rootPath;

  PackageInfo({required this.name, required this.rootPath});
}

class SlangPackage {
  final String name;
  final String path;
  final String stringsFilePath;
  final String appLocaleEnum;
  final String? localeSettingsClass;
  final List<String> availableLocales;
  final String importPath;

  SlangPackage({
    required this.name,
    required this.path,
    required this.stringsFilePath,
    required this.appLocaleEnum,
    required this.localeSettingsClass,
    required this.availableLocales,
    required this.importPath,
  });

  @override
  String toString() => 'SlangPackage(name: $name, locales: $availableLocales)';
}

class SlangAnalysis {
  final String appLocaleEnum;
  final String? localeSettingsClass;
  final List<String> availableLocales;

  SlangAnalysis({
    required this.appLocaleEnum,
    required this.localeSettingsClass,
    required this.availableLocales,
  });
}
