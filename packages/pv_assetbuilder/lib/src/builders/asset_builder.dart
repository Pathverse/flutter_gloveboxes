/// Build_runner integration for pv_assetbuilder
// ignore_for_file: avoid_print

library;

import 'dart:async';
import 'dart:io';
import 'package:build/build.dart';
import '../config/config_parser.dart';
import '../config/signature_config.dart';
import '../scanner/asset_scanner.dart';
import '../generators/asset_generator.dart';
import '../resolvers/method_resolver.dart';

/// Builder that generates asset classes from file system scanning
class AssetBuilder implements Builder {
  final BuilderOptions options;
  late PVAssetBuilderConfig config;

  AssetBuilder(this.options);

  @override
  Map<String, List<String>> get buildExtensions => {
    r'$lib$': ['generated/pap.dart', 'generated/assets.md'],
  };

  @override
  Future<void> build(BuildStep buildStep) async {
    try {
      await _buildAssets(buildStep);
    } catch (e, stackTrace) {
      log.severe('Asset building failed: $e', e, stackTrace);
    }
  }

  /// Load configuration from pv_asset_config.yaml or use defaults
  Future<PVAssetBuilderConfig> _loadConfiguration(BuildStep buildStep) async {
    // Try to read pv_asset_config.yaml from the package root
    try {
      final configYamlId = AssetId(
        buildStep.inputId.package,
        'pv_asset_config.yaml',
      );
      if (await buildStep.canRead(configYamlId)) {
        final yamlContent = await buildStep.readAsString(configYamlId);
        log.info('✅ FOUND pv_asset_config.yaml (${yamlContent.length} chars)');
        try {
          final config = ConfigParser.parseString(yamlContent);
          log.info(
            '✅ PARSED: ${config.customPaths.length} paths, ${config.signatures.signatures.length} sigs',
          );
          return config;
        } catch (parseError) {
          log.severe('❌ PARSE ERROR in pv_asset_config.yaml: $parseError');
        }
      } else {
        log.info('❌ Cannot read pv_asset_config.yaml');
      }
    } catch (e) {
      log.severe('❌ Error accessing pv_asset_config.yaml: $e');
    }

    // Fallback to build.yaml
    try {
      final buildYamlId = AssetId(buildStep.inputId.package, 'build.yaml');
      if (await buildStep.canRead(buildYamlId)) {
        final yamlContent = await buildStep.readAsString(buildYamlId);
        return ConfigParser.parseString(yamlContent);
      }
    } catch (e) {
      log.info('Could not read build.yaml, using defaults: $e');
    }

    // Return default configuration
    return PVAssetBuilderConfig(
      target: 'lib/generated',
      customPaths: const [],
      defaultConfig: const DefaultConfig(provider: true),
      signatures: SignatureConfigCollection.fromYaml(null),
    );
  }

  /// Load configuration directly from filesystem
  Future<PVAssetBuilderConfig> _loadConfigFromFileSystem(
    String packagePath,
  ) async {
    try {
      final configFile = File('$packagePath/pv_asset_config.yaml');
      if (await configFile.exists()) {
        final yamlContent = await configFile.readAsString();
        log.info('✅ FOUND pv_asset_config.yaml (${yamlContent.length} chars)');
        final config = ConfigParser.parseString(yamlContent);
        log.info(
          '✅ PARSED: ${config.customPaths.length} paths, ${config.signatures.signatures.length} sigs',
        );
        return config;
      } else {
        log.info('❌ pv_asset_config.yaml not found, using defaults');
      }
    } catch (e) {
      log.severe('❌ Error reading pv_asset_config.yaml: $e');
    }

    // Return default configuration
    return PVAssetBuilderConfig(
      target: 'lib/generated',
      customPaths: const [],
      defaultConfig: const DefaultConfig(provider: true),
      signatures: SignatureConfigCollection.fromYaml(null),
    );
  }

  /// Main asset building process
  Future<void> _buildAssets(BuildStep buildStep) async {
    final packagePath = await _getPackagePath(buildStep);

    // Try to load config from filesystem directly
    config = await _loadConfigFromFileSystem(packagePath);

    // Validate configuration
    final configErrors = ConfigParser.validateConfig(config);
    if (configErrors.isNotEmpty) {
      log.severe('Configuration validation failed:');
      for (final error in configErrors) {
        log.severe('  - $error');
      }
      return;
    }

    log.info('Starting asset build for package: ${buildStep.inputId.package}');
    log.info('Package path: $packagePath');
    log.info('Target directory: ${config.target}');

    // Initialize components
    final methodResolver = MethodResolver(packagePath);
    final scanner = AssetScanner(packagePath, config);
    final generator = AssetGenerator(config, methodResolver, packagePath);

    // Validate custom methods if signatures are configured
    if (config.signatures.hasCustomSignatures) {
      log.info('Validating custom methods...');
      final methodErrors = await methodResolver.validateMethods(
        config.signatures,
      );
      if (methodErrors.isNotEmpty) {
        log.warning('Custom method validation warnings:');
        for (final error in methodErrors) {
          log.warning('  - $error');
        }
      }
    }

    // Validate asset paths
    final pathErrors = await scanner.validatePaths();
    if (pathErrors.isNotEmpty) {
      log.warning('Path validation warnings:');
      for (final error in pathErrors) {
        log.warning('  - $error');
      }
    }

    // Scan assets
    log.info('Scanning assets...');
    final rootDirectory = await scanner.scanAssets();
    final stats = await scanner.getStatistics();

    log.info('Asset scan completed:');
    log.info('  - ${stats.totalAssets} assets found');
    log.info('  - ${stats.totalDirectories} directories processed');

    if (stats.signatureCount.isNotEmpty) {
      log.info('  - Assets by signature:');
      for (final entry in stats.signatureCount.entries) {
        log.info('    - ${entry.key}: ${entry.value}');
      }
    }

    // Validate generated code
    final codeErrors = generator.validateGeneratedCode(rootDirectory);
    if (codeErrors.isNotEmpty) {
      log.severe('Code generation validation failed:');
      for (final error in codeErrors) {
        log.severe('  - $error');
      }
      return;
    }

    // Generate Dart code
    log.info('Generating Dart code...');
    final dartCode = await generator.generateAssetFile(rootDirectory);

    // Write generated assets file
    final assetsOutputId = AssetId(
      buildStep.inputId.package,
      '${config.target}/pap.dart',
    );
    await buildStep.writeAsString(assetsOutputId, dartCode);
    log.info('Generated assets file: ${assetsOutputId.path}');

    // Generate documentation
    final documentation = generator.generateDocumentation(rootDirectory, stats);
    final docsOutputId = AssetId(
      buildStep.inputId.package,
      '${config.target}/assets.md',
    );
    await buildStep.writeAsString(docsOutputId, documentation);
    log.info('Generated documentation: ${docsOutputId.path}');

    log.info('Asset build completed successfully');
  }

  /// Get the physical path of the package being built
  Future<String> _getPackagePath(BuildStep buildStep) async {
    // This is a simplified approach - in a real implementation,
    // we might need to use the build system's resolver
    return Directory.current.path;
  }
}

/// Builder specifically for manual/CLI builds
class ManualAssetBuilder {
  final String projectRoot;

  ManualAssetBuilder(this.projectRoot);

  /// Run the asset building process manually
  Future<BuildResult> build() async {
    final stopwatch = Stopwatch()..start();

    try {
      // Load configuration
      final config = await ConfigParser.findAndParse(projectRoot);

      // Validate configuration
      final configErrors = ConfigParser.validateConfig(config);
      if (configErrors.isNotEmpty) {
        return BuildResult.failure(
          'Configuration validation failed: ${configErrors.join(', ')}',
          duration: stopwatch.elapsed,
        );
      }

      // Initialize components
      final methodResolver = MethodResolver(projectRoot);
      final scanner = AssetScanner(projectRoot, config);
      final generator = AssetGenerator(config, methodResolver, projectRoot);

      // Validate custom methods
      if (config.signatures.hasCustomSignatures) {
        final methodErrors = await methodResolver.validateMethods(
          config.signatures,
        );
        if (methodErrors.isNotEmpty) {
          print('Warning: Custom method validation issues:');
          for (final error in methodErrors) {
            print('  - $error');
          }
        }
      }

      // Scan and generate
      final rootDirectory = await scanner.scanAssets();
      final stats = await scanner.getStatistics();

      print(
        'Asset scan completed: ${stats.totalAssets} assets, ${stats.totalDirectories} directories',
      );

      // Generate code
      final dartCode = await generator.generateAssetFile(rootDirectory);
      final documentation = generator.generateDocumentation(
        rootDirectory,
        stats,
      );

      // Write files
      final targetDir = Directory('$projectRoot/${config.target}');
      if (!await targetDir.exists()) {
        await targetDir.create(recursive: true);
      }

      final assetsFile = File('${targetDir.path}/pap.dart');
      await assetsFile.writeAsString(dartCode);

      final docsFile = File('${targetDir.path}/assets.md');
      await docsFile.writeAsString(documentation);

      stopwatch.stop();

      return BuildResult.success(
        assetsGenerated: stats.totalAssets,
        directoriesProcessed: stats.totalDirectories,
        outputFiles: [assetsFile.path, docsFile.path],
        duration: stopwatch.elapsed,
        statistics: stats,
      );
    } catch (e, stackTrace) {
      stopwatch.stop();
      return BuildResult.failure(
        'Build failed: $e',
        duration: stopwatch.elapsed,
        error: e,
        stackTrace: stackTrace,
      );
    }
  }
}

/// Result of a build operation
abstract class BuildResult {
  final Duration duration;
  final String message;

  const BuildResult(this.duration, this.message);

  bool get isSuccess;

  factory BuildResult.success({
    required int assetsGenerated,
    required int directoriesProcessed,
    required List<String> outputFiles,
    required Duration duration,
    required ScanStatistics statistics,
  }) = BuildSuccess;

  factory BuildResult.failure(
    String message, {
    required Duration duration,
    Object? error,
    StackTrace? stackTrace,
  }) = BuildFailure;
}

class BuildSuccess extends BuildResult {
  final int assetsGenerated;
  final int directoriesProcessed;
  final List<String> outputFiles;
  final ScanStatistics statistics;

  const BuildSuccess({
    required this.assetsGenerated,
    required this.directoriesProcessed,
    required this.outputFiles,
    required Duration duration,
    required this.statistics,
  }) : super(duration, 'Build completed successfully');

  @override
  bool get isSuccess => true;

  @override
  String toString() {
    final buffer = StringBuffer();
    buffer.writeln('Build Success!');
    buffer.writeln('  Assets Generated: $assetsGenerated');
    buffer.writeln('  Directories Processed: $directoriesProcessed');
    buffer.writeln('  Duration: ${duration.inMilliseconds}ms');
    buffer.writeln('  Output Files:');
    for (final file in outputFiles) {
      buffer.writeln('    - $file');
    }
    return buffer.toString();
  }
}

class BuildFailure extends BuildResult {
  final Object? error;
  final StackTrace? stackTrace;

  const BuildFailure(
    String message, {
    required Duration duration,
    this.error,
    this.stackTrace,
  }) : super(duration, message);

  @override
  bool get isSuccess => false;

  @override
  String toString() {
    final buffer = StringBuffer();
    buffer.writeln('Build Failed!');
    buffer.writeln('  Message: $message');
    buffer.writeln('  Duration: ${duration.inMilliseconds}ms');
    if (error != null) {
      buffer.writeln('  Error: $error');
    }
    return buffer.toString();
  }
}
