/// Asset scanner for discovering and categorizing assets based on configuration
library;

import 'dart:io';
import 'package:glob/glob.dart';
import '../config/config_parser.dart';
import '../config/signature_config.dart';

/// Represents a discovered asset with its signature
class Asset {
  final String path;
  final String relativePath;
  final String? signature;
  final bool needsLoadSignature;

  const Asset({
    required this.path,
    required this.relativePath,
    this.signature,
    required this.needsLoadSignature,
  });

  /// Generate a valid Dart identifier from the asset path
  String get dartIdentifier {
    final name = relativePath
        .replaceAll('\\', '_') // Handle Windows paths
        .replaceAll('/', '_')
        .replaceAll('.', '_')
        .replaceAll('-', '_')
        .replaceAll(' ', '_')
        .replaceAll(
          RegExp(r'[^a-zA-Z0-9_]'),
          '_',
        ); // Replace any other invalid characters

    // Ensure it starts with a letter or underscore
    if (RegExp(r'^[0-9]').hasMatch(name)) {
      return '_$name';
    }
    return name;
  }

  /// Get the file extension
  String get extension => '.' + path.split('.').last;

  /// Get the directory path relative to assets root
  String get directoryPath {
    // Handle both Windows (\) and Unix (/) path separators
    final normalizedPath = relativePath.replaceAll('\\', '/');
    final parts = normalizedPath.split('/');
    if (parts.length <= 1) return '';
    return parts.sublist(0, parts.length - 1).join('/');
  }

  /// Get just the filename without extension
  String get baseName {
    final name = path.split('/').last;
    final lastDot = name.lastIndexOf('.');
    return lastDot > 0 ? name.substring(0, lastDot) : name;
  }
}

/// Represents a directory in the asset tree
class AssetDirectory {
  final String path;
  final String relativePath;
  final List<Asset> assets;
  final List<AssetDirectory> subdirectories;
  final bool generateProvider;
  final bool generateObjectMap;

  const AssetDirectory({
    required this.path,
    required this.relativePath,
    required this.assets,
    required this.subdirectories,
    required this.generateProvider,
    required this.generateObjectMap,
  });

  /// Generate a valid Dart class name from the directory path
  String get dartClassName {
    if (relativePath.isEmpty) return '_Assets';

    final name = relativePath
        .split('/')
        .map((part) => part.replaceAll(RegExp(r'[^a-zA-Z0-9]'), ''))
        .where((part) => part.isNotEmpty)
        .join('_');

    return '_${name.isNotEmpty ? name : 'Assets'}';
  }

  /// Generate anonymous class name with hash
  String get anonymousClassName {
    final hash = (relativePath.hashCode & 0x7FFFFFFF).toString();
    return '_i$hash';
  }
}

/// Asset scanner that discovers and categorizes assets
class AssetScanner {
  final String projectRoot;
  final PVAssetBuilderConfig config;

  AssetScanner(this.projectRoot, this.config);

  /// Scan all assets based on configuration
  Future<AssetDirectory> scanAssets() async {
    final rootAssets = <Asset>[];
    final subdirectories = <AssetDirectory>[];

    // Process custom path configurations
    for (final customPath in config.customPaths) {
      final directory = await _scanPath(
        customPath.path,
        customPath.provider,
        customPath.objectmap,
      );
      if (directory != null) {
        subdirectories.add(directory);
      }
    }

    // Scan remaining assets with default configuration
    final defaultDirectories = await _scanDefaultPaths();
    subdirectories.addAll(defaultDirectories);

    return AssetDirectory(
      path: projectRoot,
      relativePath: '',
      assets: rootAssets,
      subdirectories: subdirectories,
      generateProvider: config.defaultConfig.provider,
      generateObjectMap: true,
    );
  }

  /// Scan a specific path with configuration
  Future<AssetDirectory?> _scanPath(
    String pathPattern,
    bool generateProvider,
    bool generateObjectMap,
  ) async {
    final assets = <Asset>[];
    final subdirMap = <String, List<Asset>>{};

    // For now, use simple directory scanning
    // TODO: Implement proper glob pattern matching later
    final baseDir = Directory('$projectRoot/$pathPattern');
    if (!await baseDir.exists()) return null;

    await for (final entity in baseDir.list(recursive: true)) {
      if (entity is File) {
        final asset = await _createAssetFromFile(entity, pathPattern);
        if (asset != null) {
          final dirPath = asset.directoryPath;
          if (dirPath.isEmpty) {
            assets.add(asset);
          } else {
            subdirMap.putIfAbsent(dirPath, () => <Asset>[]).add(asset);
          }
        }
      }
    }

    if (assets.isEmpty && subdirMap.isEmpty) return null;

    // Create subdirectories
    final subdirectories = subdirMap.entries.map((entry) {
      return AssetDirectory(
        path: '$projectRoot/${entry.key}',
        relativePath: entry.key,
        assets: entry.value,
        subdirectories: [],
        generateProvider: generateProvider,
        generateObjectMap: generateObjectMap,
      );
    }).toList();

    return AssetDirectory(
      path: '$projectRoot/$pathPattern',
      relativePath: pathPattern,
      assets: assets,
      subdirectories: subdirectories,
      generateProvider: generateProvider,
      generateObjectMap: generateObjectMap,
    );
  }

  /// Create an Asset from a file with signature matching
  Future<Asset?> _createAssetFromFile(File file, String basePath) async {
    final relativePath = _getRelativePath(file.path, basePath);
    if (relativePath == null) return null;

    final signature = _matchSignature(file.path, relativePath);
    final needsLoadSignature =
        signature != null && config.signatures.hasCustomSignatures;

    return Asset(
      path: file.path,
      relativePath: relativePath,
      signature: signature,
      needsLoadSignature: needsLoadSignature,
    );
  }

  /// Match a file to a signature based on configuration
  String? _matchSignature(String filePath, String relativePath) {
    for (final signature in config.signatures.signatures.values) {
      if (signature.matchConfig == null) continue;

      final matchConfig = signature.matchConfig!;

      switch (matchConfig.strategy) {
        case MatchStrategy.path:
          // Simple pattern matching for now
          // TODO: Implement proper glob pattern matching
          final pattern = matchConfig.pathPattern!;
          if (relativePath.contains(
            pattern.replaceAll('**/', '').replaceAll('*', ''),
          )) {
            return signature.name;
          }
          break;

        case MatchStrategy.extension:
          final extension = '.' + filePath.split('.').last;
          if (matchConfig.extensions!.contains(extension)) {
            return signature.name;
          }
          break;

        case MatchStrategy.custom:
          // Custom matching would need to be resolved at runtime
          // For build-time, we can't execute the custom matcher
          // This would need special handling in the generated code
          break;
      }
    }

    return null;
  }

  /// Get relative path from base path
  String? _getRelativePath(String filePath, String basePath) {
    final baseDir = Directory('$projectRoot/$basePath');
    if (!filePath.startsWith(baseDir.path)) return null;

    return filePath.substring(baseDir.path.length + 1);
  }

  /// Scan default asset paths
  Future<List<AssetDirectory>> _scanDefaultPaths() async {
    // Common asset directories
    final defaultPaths = ['assets', 'images', 'fonts', 'data'];
    final directories = <AssetDirectory>[];

    for (final path in defaultPaths) {
      final directory = await _scanPath(
        path,
        config.defaultConfig.provider,
        true, // Always generate object maps for defaults
      );
      if (directory != null) {
        directories.add(directory);
      }
    }

    return directories;
  }

  /// Validate that all required asset paths exist
  Future<List<String>> validatePaths() async {
    final errors = <String>[];

    for (final customPath in config.customPaths) {
      final dir = Directory('$projectRoot/${customPath.path}');
      if (!await dir.exists()) {
        errors.add('Custom path does not exist: ${customPath.path}');
      }
    }

    return errors;
  }

  /// Get statistics about scanned assets
  Future<ScanStatistics> getStatistics() async {
    final rootDirectory = await scanAssets();
    return _calculateStatistics(rootDirectory);
  }

  ScanStatistics _calculateStatistics(AssetDirectory directory) {
    var totalAssets = directory.assets.length;
    var totalDirectories = directory.subdirectories.length;
    var signatureCount = <String, int>{};

    // Count assets by signature
    for (final asset in directory.assets) {
      final sig = asset.signature ?? 'default';
      signatureCount[sig] = (signatureCount[sig] ?? 0) + 1;
    }

    // Recursively count subdirectories
    for (final subdir in directory.subdirectories) {
      final substats = _calculateStatistics(subdir);
      totalAssets += substats.totalAssets;
      totalDirectories += substats.totalDirectories;

      for (final entry in substats.signatureCount.entries) {
        signatureCount[entry.key] =
            (signatureCount[entry.key] ?? 0) + entry.value;
      }
    }

    return ScanStatistics(
      totalAssets: totalAssets,
      totalDirectories: totalDirectories,
      signatureCount: signatureCount,
    );
  }
}

/// Statistics about the asset scanning process
class ScanStatistics {
  final int totalAssets;
  final int totalDirectories;
  final Map<String, int> signatureCount;

  const ScanStatistics({
    required this.totalAssets,
    required this.totalDirectories,
    required this.signatureCount,
  });

  @override
  String toString() {
    final buffer = StringBuffer();
    buffer.writeln('Asset Scan Statistics:');
    buffer.writeln('  Total Assets: $totalAssets');
    buffer.writeln('  Total Directories: $totalDirectories');
    buffer.writeln('  Assets by Signature:');

    for (final entry in signatureCount.entries) {
      buffer.writeln('    ${entry.key}: ${entry.value}');
    }

    return buffer.toString();
  }
}
