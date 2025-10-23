import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:build/build.dart';
import 'package:glob/glob.dart';
import 'package:path/path.dart' as p;
import 'package:yaml/yaml.dart';

class TranslationScannerBuilder implements Builder {
  final BuilderOptions options;

  TranslationScannerBuilder(this.options);

  @override
  Map<String, List<String>> get buildExtensions => {
    '.dart': ['.pvtro.dart'],
  };

  @override
  Future<void> build(BuildStep buildStep) async {
    // Only process the main library file to avoid duplicate generation
    if (!buildStep.inputId.path.endsWith('lib/pvtro.dart')) {
      return;
    }

    log.info('🔍 Scanning for slang translation providers...');

    try {
      final translationProviders = await _scanForTranslationProviders(
        buildStep,
      );

      if (translationProviders.isNotEmpty) {
        final generatedCode = _generateMergedTranslationProvider(
          translationProviders,
        );

        final outputId = buildStep.inputId.changeExtension('.pvtro.dart');
        await buildStep.writeAsString(outputId, generatedCode);

        log.info(
          '✅ Generated merged translation provider with ${translationProviders.length} providers',
        );
      } else {
        log.info('ℹ️ No slang translation providers found');
      }
    } catch (e, stackTrace) {
      log.severe('❌ Error scanning for translation providers: $e');
      log.severe('Stack trace: $stackTrace');
    }
  }

  Future<List<TranslationProvider>> _scanForTranslationProviders(
    BuildStep buildStep,
  ) async {
    final providers = <TranslationProvider>[];

    // Get the package config to find all dependencies
    final packageConfig = await _getPackageConfig();

    // Scan current package
    providers.addAll(await _scanPackageForTranslations('.'));

    // Scan all dependencies if enabled
    if (options.config['scan_packages'] == true) {
      for (final package in packageConfig) {
        if (package.name != 'pvtro' && package.name != 'pvtro_builder') {
          providers.addAll(await _scanPackageForTranslations(package.rootPath));
        }
      }
    }

    return providers;
  }

  Future<List<PackageInfo>> _getPackageConfig() async {
    final packages = <PackageInfo>[];

    try {
      final packageConfigFile = File('.dart_tool/package_config.json');
      if (await packageConfigFile.exists()) {
        final content = await packageConfigFile.readAsString();
        final config = jsonDecode(content) as Map<String, dynamic>;

        final packageList = config['packages'] as List<dynamic>;

        for (final package in packageList) {
          final packageMap = package as Map<String, dynamic>;
          final name = packageMap['name'] as String;
          final rootUri = packageMap['rootUri'] as String;

          // Convert relative URIs to absolute paths
          final rootPath = Uri.parse(rootUri).toFilePath();

          packages.add(PackageInfo(name: name, rootPath: rootPath));
        }
      }
    } catch (e) {
      log.warning('Could not read package config: $e');
    }

    return packages;
  }

  Future<List<TranslationProvider>> _scanPackageForTranslations(
    String packagePath,
  ) async {
    final providers = <TranslationProvider>[];

    try {
      // Look for common slang patterns
      final patterns = [
        '**/*_translations.dart',
        '**/translations.dart',
        '**/i18n/*.dart',
        '**/l10n/*.dart',
        '**/*_i18n.dart',
        '**/*_l10n.dart',
        '**/*_gen.dart', // slang generated files
      ];

      for (final pattern in patterns) {
        final glob = Glob(pattern);
        final libDir = Directory(p.join(packagePath, 'lib'));

        if (await libDir.exists()) {
          await for (final entity in libDir.list(recursive: true)) {
            if (entity is File &&
                entity.path.endsWith('.dart') &&
                glob.matches(p.relative(entity.path, from: libDir.path))) {
              final provider = await _analyzeTranslationFile(entity);
              if (provider != null) {
                providers.add(provider);
              }
            }
          }
        }
      }

      // Also check pubspec.yaml for slang configuration
      final pubspecFile = File(p.join(packagePath, 'pubspec.yaml'));
      if (await pubspecFile.exists()) {
        final content = await pubspecFile.readAsString();
        final pubspec = loadYaml(content) as Map<dynamic, dynamic>?;

        if (pubspec?.containsKey('slang') == true) {
          log.info('Found slang configuration in ${p.basename(packagePath)}');
          // Additional scanning based on slang config could be added here
        }
      }
    } catch (e) {
      log.warning('Error scanning package $packagePath: $e');
    }

    return providers;
  }

  Future<TranslationProvider?> _analyzeTranslationFile(File file) async {
    try {
      final content = await file.readAsString();

      // Look for common slang patterns
      if (_containsSlangPatterns(content)) {
        final className = _extractTranslationClassName(content, file);
        final packageName = _extractPackageName(file.path);

        if (className != null) {
          return TranslationProvider(
            className: className,
            filePath: file.path,
            packageName: packageName,
            importPath: _generateImportPath(file.path, packageName),
          );
        }
      }
    } catch (e) {
      log.warning('Error analyzing file ${file.path}: $e');
    }

    return null;
  }

  bool _containsSlangPatterns(String content) {
    final patterns = [
      RegExp(r'class\s+\w*Translations?\s*{'),
      RegExp(r'LocaleSettings'),
      RegExp(r'AppLocale'),
      RegExp(r'@GenerateLocalizationVariants'),
      RegExp(r'SlangGeneratedLocalization'),
      RegExp(r'extends\s+BaseTranslations'),
    ];

    return patterns.any((pattern) => pattern.hasMatch(content));
  }

  String? _extractTranslationClassName(String content, File file) {
    // Look for main translation class
    final classPattern = RegExp(r'class\s+(\w*Translations?)\s*(?:extends|{)');
    final match = classPattern.firstMatch(content);

    if (match != null) {
      return match.group(1);
    }

    // Fallback: try to infer from filename
    final basename = p.basenameWithoutExtension(file.path);
    if (basename.contains('translation') ||
        basename.contains('i18n') ||
        basename.contains('l10n')) {
      final className = basename
          .replaceAll('_', '')
          .split('')
          .asMap()
          .map((i, c) => MapEntry(i, i == 0 ? c.toUpperCase() : c))
          .values
          .join('');

      return '${className}Translations';
    }

    return null;
  }

  String? _extractPackageName(String filePath) {
    final parts = filePath.split(Platform.pathSeparator);
    final libIndex = parts.lastIndexOf('lib');

    if (libIndex > 0) {
      return parts[libIndex - 1];
    }

    return null;
  }

  String _generateImportPath(String filePath, String? packageName) {
    if (packageName != null) {
      final parts = filePath.split(Platform.pathSeparator);
      final libIndex = parts.lastIndexOf('lib');

      if (libIndex >= 0 && libIndex < parts.length - 1) {
        final relativePath = parts.sublist(libIndex + 1).join('/');
        return 'package:$packageName/$relativePath';
      }
    }

    // Fallback to relative path
    return filePath;
  }

  String _generateMergedTranslationProvider(
    List<TranslationProvider> providers,
  ) {
    final buffer = StringBuffer();

    // Generate file header
    buffer.writeln('// GENERATED CODE - DO NOT MODIFY BY HAND');
    buffer.writeln('// Generated by pvtro_builder');
    buffer.writeln();

    // Generate imports
    buffer.writeln("import 'package:flutter/material.dart';");
    buffer.writeln("import 'package:pvtro/provider.dart';");
    buffer.writeln();

    for (final provider in providers) {
      buffer.writeln("import '${provider.importPath}';");
    }
    buffer.writeln();

    // Generate the merged provider class
    buffer.writeln(
      'class GeneratedTranslationProvider extends StatelessWidget {',
    );
    buffer.writeln('  final Widget child;');
    buffer.writeln();
    buffer.writeln('  const GeneratedTranslationProvider({');
    buffer.writeln('    super.key,');
    buffer.writeln('    required this.child,');
    buffer.writeln('  });');
    buffer.writeln();
    buffer.writeln('  @override');
    buffer.writeln('  Widget build(BuildContext context) {');
    buffer.writeln('    return MultiTranslationProvider(');
    buffer.writeln('      providers: [');

    for (final provider in providers) {
      buffer.writeln(
        '        // Provider from ${provider.packageName ?? 'unknown'}',
      );
      buffer.writeln(
        '        (child) => ${provider.className}Provider(child: child),',
      );
    }

    buffer.writeln('      ],');
    buffer.writeln('      child: child,');
    buffer.writeln('    );');
    buffer.writeln('  }');
    buffer.writeln('}');
    buffer.writeln();

    // Generate convenience function
    buffer.writeln(
      '/// Convenience function to wrap your app with all translation providers',
    );
    buffer.writeln('Widget withAllTranslations(Widget child) {');
    buffer.writeln('  return GeneratedTranslationProvider(child: child);');
    buffer.writeln('}');

    return buffer.toString();
  }
}

class PackageInfo {
  final String name;
  final String rootPath;

  PackageInfo({required this.name, required this.rootPath});
}

class TranslationProvider {
  final String className;
  final String filePath;
  final String? packageName;
  final String importPath;

  TranslationProvider({
    required this.className,
    required this.filePath,
    required this.packageName,
    required this.importPath,
  });

  @override
  String toString() {
    return 'TranslationProvider(className: $className, packageName: $packageName)';
  }
}
