#!/usr/bin/env dart
// ignore_for_file: avoid_print

/// Command-line tool for pv_assetbuilder
/// Simple two-step process: Update pubspec.yaml assets → Run build_runner
library;

import 'dart:io';
import 'dart:convert';
import 'package:pv_assetbuilder/lib.dart';

Future<void> main(List<String> arguments) async {
  final cli = PVAssetBuilderCLI();
  final exitCode = await cli.run(arguments);
  exit(exitCode);
}

/// Simple CLI for pv_assetbuilder
class PVAssetBuilderCLI {
  /// Run the CLI with the given arguments
  Future<int> run(List<String> arguments) async {
    try {
      // Parse command line arguments
      final options = _parseArguments(arguments);

      if (options.showHelp) {
        _printHelp();
        return 0;
      }

      if (options.showVersion) {
        _printVersion();
        return 0;
      }

      // Run the two-step process
      return await _runBuild(options);
    } catch (e) {
      print('Error: $e');
      return 1;
    }
  }

  /// Parse command line arguments (simplified)
  CLIOptions _parseArguments(List<String> arguments) {
    var projectRoot = Directory.current.path;
    var verbose = false;
    var showHelp = false;
    var showVersion = false;

    for (int i = 0; i < arguments.length; i++) {
      final arg = arguments[i];

      switch (arg) {
        case '--help':
        case '-h':
          showHelp = true;
          break;
        case '--version':
        case '-v':
          showVersion = true;
          break;
        case '--verbose':
          verbose = true;
          break;
        case '--project':
        case '-p':
          if (i + 1 < arguments.length) {
            projectRoot = arguments[++i];
          } else {
            throw ArgumentError('Missing value for $arg');
          }
          break;
        default:
          if (arg.startsWith('-')) {
            throw ArgumentError('Unknown option: $arg');
          }
          projectRoot = arg;
      }
    }

    return CLIOptions(
      projectRoot: projectRoot,
      verbose: verbose,
      showHelp: showHelp,
      showVersion: showVersion,
    );
  }

  /// Run the two-step build process
  Future<int> _runBuild(CLIOptions options) async {
    if (options.verbose) {
      print('PV Asset Builder - Two Step Process');
      print('Project Root: ${options.projectRoot}');
      print('');
    }

    // Validate project directory
    final projectDir = Directory(options.projectRoot);
    if (!await projectDir.exists()) {
      print('Error: Project directory does not exist: ${options.projectRoot}');
      return 1;
    }

    try {
      // Step 1: Update pubspec.yaml with asset directories
      print(
        'Step 1: Updating pubspec.yaml with discovered asset directories...',
      );
      final assetDirectories = await _discoverAssetPaths(options);
      await _updatePubspecAssets(
        options.projectRoot,
        assetDirectories,
        options.verbose,
      );
      print(
        '✅ pubspec.yaml updated with ${assetDirectories.length} asset directories',
      );

      // Step 2: Run build_runner
      print('\nStep 2: Running build_runner...');
      final buildResult = await _runBuildRunner(
        options.projectRoot,
        options.verbose,
      );

      if (buildResult == 0) {
        print('✅ Build runner completed successfully');
        print('\n🎉 Asset building completed!');
        return 0;
      } else {
        print('❌ Build runner failed');
        return 1;
      }
    } catch (e) {
      print('❌ Build process failed: $e');
      return 1;
    }
  }

  /// Discover all asset directories from configuration
  Future<List<String>> _discoverAssetPaths(CLIOptions options) async {
    final assetDirectories = <String>{};

    try {
      // Load configuration
      final config = await ConfigParser.findAndParse(options.projectRoot);

      if (options.verbose) {
        print(
          'Found configuration with ${config.customPaths.length} custom paths',
        );
      }

      // Scan all asset directories
      final scanner = AssetScanner(options.projectRoot, config);
      final rootDirectory = await scanner.scanAssets();

      // Collect all directories that contain assets
      _collectAssetDirectories(
        rootDirectory,
        assetDirectories,
        options.projectRoot,
      );

      if (options.verbose) {
        print('Discovered ${assetDirectories.length} asset directories');
      }
    } catch (e) {
      if (options.verbose) {
        print(
          'Warning: Could not load configuration, scanning default assets/ directory',
        );
      }

      // Fallback: add assets directory if it exists
      final assetsDir = Directory('${options.projectRoot}/assets');
      if (await assetsDir.exists()) {
        assetDirectories.add('assets/');
      }
    }

    return assetDirectories.toList()..sort();
  }

  /// Recursively collect asset directories from AssetDirectory
  void _collectAssetDirectories(
    AssetDirectory directory,
    Set<String> assetDirectories,
    String projectRoot,
  ) {
    // If this directory has assets, add the directory path
    if (directory.assets.isNotEmpty) {
      // Get the full path by examining the first asset
      final firstAsset = directory.assets.first;
      final assetPath = firstAsset.relativePath.replaceAll('\\', '/');

      // Extract directory path from asset path
      final pathParts = assetPath.split('/');
      if (pathParts.length > 1) {
        // Remove filename to get directory path
        var directoryPath =
            '${pathParts.sublist(0, pathParts.length - 1).join('/')}/';

        // Check if this directory exists at project root or under assets/
        if (!Directory('$projectRoot/$directoryPath').existsSync() &&
            Directory('$projectRoot/assets/$directoryPath').existsSync()) {
          directoryPath = 'assets/$directoryPath';
        }

        assetDirectories.add(directoryPath);
      }
    }

    // Recursively process subdirectories
    for (final subdir in directory.subdirectories) {
      _collectAssetDirectories(subdir, assetDirectories, projectRoot);
    }
  }

  /// Update pubspec.yaml with discovered asset directories
  Future<void> _updatePubspecAssets(
    String projectRoot,
    List<String> assetDirectories,
    bool verbose,
  ) async {
    final pubspecFile = File('$projectRoot/pubspec.yaml');

    if (!await pubspecFile.exists()) {
      throw Exception('pubspec.yaml not found in project root');
    }

    // Read current pubspec.yaml
    final pubspecContent = await pubspecFile.readAsString();
    final lines = pubspecContent.split('\n');

    // Find flutter: section and assets: subsection
    int flutterIndex = -1;
    int assetsIndex = -1;
    int assetsIndent = 0;

    for (int i = 0; i < lines.length; i++) {
      final line = lines[i];

      if (line.trimLeft().startsWith('flutter:')) {
        flutterIndex = i;
        continue;
      }

      if (flutterIndex != -1 && line.trimLeft().startsWith('assets:')) {
        assetsIndex = i;
        assetsIndent = line.length - line.trimLeft().length;
        break;
      }
    }

    // Prepare asset entries with proper indentation
    final assetIndent = ' ' * (assetsIndent + 2);
    final assetEntries = assetDirectories
        .map((path) => '$assetIndent- $path')
        .toList();

    if (assetsIndex != -1) {
      // Replace existing assets section
      if (verbose) {
        print('Replacing existing assets section');
      }

      // Find end of current assets section
      int assetsEndIndex = assetsIndex + 1;
      final baseIndent = assetsIndent;

      while (assetsEndIndex < lines.length) {
        final line = lines[assetsEndIndex];
        if (line.trim().isEmpty) {
          assetsEndIndex++;
          continue;
        }

        final lineIndent = line.length - line.trimLeft().length;
        if (lineIndent <= baseIndent && line.trim().isNotEmpty) {
          break;
        }
        assetsEndIndex++;
      }

      // Replace the assets section
      lines.replaceRange(assetsIndex + 1, assetsEndIndex, assetEntries);
    } else if (flutterIndex != -1) {
      // Add assets section to existing flutter: section
      if (verbose) {
        print('Adding assets section to existing flutter: block');
      }

      final flutterIndent =
          lines[flutterIndex].length - lines[flutterIndex].trimLeft().length;
      final assetsHeader = '${' ' * (flutterIndent + 2)}assets:';

      // Find where to insert (after flutter: line)
      int insertIndex = flutterIndex + 1;
      lines.insert(insertIndex, assetsHeader);
      lines.insertAll(insertIndex + 1, assetEntries);
    } else {
      // Add flutter: section with assets
      if (verbose) {
        print('Adding flutter: section with assets');
      }

      lines.addAll(['', 'flutter:', '  assets:', ...assetEntries]);
    }

    // Write updated pubspec.yaml
    await pubspecFile.writeAsString(lines.join('\n'));
  }

  /// Run build_runner build command
  Future<int> _runBuildRunner(String projectRoot, bool verbose) async {
    final process = await Process.start('dart', [
      'run',
      'build_runner',
      'build',
      '--delete-conflicting-outputs',
    ], workingDirectory: projectRoot);

    // Stream output if verbose
    if (verbose) {
      process.stdout.transform(utf8.decoder).forEach(print);
      process.stderr.transform(utf8.decoder).forEach(print);
    }

    return await process.exitCode;
  }

  /// Print help information
  void _printHelp() {
    print('''
PV Asset Builder - Simple two-step asset management

Usage: pvasbuild [options] [project_path]

Process:
  1. Discovers all asset files from configuration
  2. Updates pubspec.yaml flutter: assets: section  
  3. Runs build_runner to generate asset classes

Options:
  -h, --help           Show this help message
  -v, --version        Show version information  
  -p, --project        Specify project root directory (default: current directory)
      --verbose        Enable verbose output

Examples:
  pvasbuild                          # Process assets in current directory
  pvasbuild /path/to/project         # Process assets in specified directory
  pvasbuild --verbose                # Show detailed output

Configuration:
  Place configuration in pv_asset_config.yaml:
  
  pv_assetprovider:
    target: lib/generated
    custom:
      - path: assets/images
        provider: true
        objectmap: false
      - path: assets/config  
        provider: true
        objectmap: true
    default:
      provider: true

  signatures:
    image:
      loader: custom_loaders:loadCachedImage
    web:
      match_via:
        extensions: ['.html', '.css', '.js']
      loader: web_loaders:loadWebContent
''');
  }

  /// Print version information
  void _printVersion() {
    print('PV Asset Builder v0.1.0');
    print('Simple asset management for Flutter projects');
  }
}

/// Options parsed from command line arguments
class CLIOptions {
  final String projectRoot;
  final bool verbose;
  final bool showHelp;
  final bool showVersion;

  const CLIOptions({
    required this.projectRoot,
    required this.verbose,
    required this.showHelp,
    required this.showVersion,
  });
}
