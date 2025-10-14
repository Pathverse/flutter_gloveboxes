import 'dart:io';
import 'package:build/build.dart';
import 'package:yaml/yaml.dart';
import 'package:path/path.dart' as p;

import 'file_system.dart';
import 'string_utils.dart';

/// Information about a slang package
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

/// Analysis result from a strings.g.dart file
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

/// Utilities for analyzing slang packages
class SlangAnalysisUtils {
  /// Check if a package has slang configuration or dependencies
  static Future<bool> hasSlangSupport(String packagePath) async {
    try {
      final pubspecFile = File(p.join(packagePath, 'pubspec.yaml'));
      if (!await pubspecFile.exists()) return false;

      final content = await pubspecFile.readAsString();
      final pubspec = loadYaml(content) as Map<dynamic, dynamic>?;

      final dependencies = pubspec?['dependencies'] as Map<dynamic, dynamic>?;
      final devDependencies =
          pubspec?['dev_dependencies'] as Map<dynamic, dynamic>?;
      final slangConfig = pubspec?['slang'] as Map<dynamic, dynamic>?;

      return dependencies?.containsKey('slang') == true ||
          dependencies?.containsKey('slang_flutter') == true ||
          devDependencies?.containsKey('slang') == true ||
          devDependencies?.containsKey('slang_flutter') == true ||
          slangConfig != null;
    } catch (e) {
      log.warning('Error checking slang support for $packagePath: $e');
      return false;
    }
  }

  /// Scan a package for slang configuration and generate SlangPackage info
  static Future<SlangPackage?> scanPackageForSlang(String packagePath) async {
    try {
      // Check if package has slang configuration
      final pubspecFile = File(p.join(packagePath, 'pubspec.yaml'));
      if (!await pubspecFile.exists()) return null;

      final content = await pubspecFile.readAsString();
      final pubspec = loadYaml(content) as Map<dynamic, dynamic>?;

      // First, try to find the generated strings.g.dart file
      final stringsFile = await FileSystemUtils.findStringsFile(packagePath);
      if (stringsFile == null) {
        log.info('Package ${p.basename(packagePath)}: No strings.g.dart found');
        return null;
      }

      // Verify it has slang dependencies for extra safety
      final hasSlangDependency = await hasSlangSupport(packagePath);

      log.info(
        'Package ${p.basename(packagePath)}: found strings.g.dart at ${stringsFile.path}, '
        'has slang dependency: $hasSlangDependency',
      );

      // Analyze the strings file to extract AppLocale enum and LocaleSettings
      final analysis = await analyzeStringsFile(stringsFile);
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
        importPath: FileSystemUtils.generateImportPath(
          stringsFile.path,
          packageName,
        ),
      );
    } catch (e) {
      log.warning('Error scanning package $packagePath for slang: $e');
      return null;
    }
  }

  /// Analyze a strings.g.dart file to extract AppLocale enum and locales
  static Future<SlangAnalysis?> analyzeStringsFile(File stringsFile) async {
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
      final locales = extractLocalesFromEnum(enumContent);

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

  /// Extract locale codes from AppLocale enum content
  static List<String> extractLocalesFromEnum(String enumContent) {
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
        final locale = match.group(1)!;
        if (StringUtils.isLanguageCode(locale)) {
          locales.add(locale);
        }
      }
    } else {
      for (final match in localeMatches) {
        final locale = match.group(1)!;
        if (StringUtils.isLanguageCode(locale)) {
          locales.add(locale);
        }
      }
    }

    return locales;
  }

  /// Get all unique locales from multiple slang packages
  static Set<String> getAllUniqueLocales(List<SlangPackage> packages) {
    final allLocales = <String>{};
    for (final package in packages) {
      allLocales.addAll(package.availableLocales);
    }
    return allLocales;
  }

  /// Filter packages that have LocaleSettings class
  static List<SlangPackage> getPackagesWithLocaleSettings(
    List<SlangPackage> packages,
  ) {
    return packages.where((p) => p.localeSettingsClass != null).toList();
  }
}
