/// Asset scanner for discovering and categorizing assets based on configuration
library;

import 'dart:io';
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
    return 'i$hash';
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
      generateObjectMap: config.defaultConfig.objectmap,
    );
  }

  /// Scan a specific path with configuration - builds proper tree structure
  Future<AssetDirectory?> _scanPath(
    String pathPattern,
    bool generateProvider,
    bool generateObjectMap,
  ) async {
    final baseDir = Directory('$projectRoot/$pathPattern');
    if (!await baseDir.exists()) return null;

    return await _buildDirectoryTree(
      baseDir.path,
      pathPattern,
      generateProvider,
      generateObjectMap,
    );
  }

  /// Build proper nested directory tree structure
  Future<AssetDirectory> _buildDirectoryTree(
    String currentPath,
    String relativePath,
    bool generateProvider,
    bool generateObjectMap,
  ) async {
    final currentDir = Directory(currentPath);
    final assets = <Asset>[];
    final subdirectories = <AssetDirectory>[];

    if (await currentDir.exists()) {
      // Get immediate children only (not recursive)
      await for (final entity in currentDir.list(followLinks: false)) {
        if (entity is File) {
          // Add files as assets
          final asset = await _createAssetFromFile(entity, relativePath);
          if (asset != null) {
            assets.add(asset);
          }
        } else if (entity is Directory) {
          // Recursively process subdirectories
          final subdirName = entity.path.split(Platform.pathSeparator).last;
          final subdirRelativePath = relativePath.isEmpty
              ? subdirName
              : '$relativePath/$subdirName';

          final subdirectory = await _buildDirectoryTree(
            entity.path,
            subdirRelativePath,
            generateProvider,
            generateObjectMap,
          );

          // Only add subdirectory if it has assets or subdirectories
          if (subdirectory.assets.isNotEmpty ||
              subdirectory.subdirectories.isNotEmpty) {
            subdirectories.add(subdirectory);
          }
        }
      }
    }

    return AssetDirectory(
      path: currentPath,
      relativePath: relativePath,
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

  /// Get relative path from base path - improved to handle proper nesting
  String? _getRelativePath(String filePath, String basePath) {
    final baseDir = Directory('$projectRoot/$basePath');
    final normalizedBasePath = baseDir.path.replaceAll('\\', '/');
    final normalizedFilePath = filePath.replaceAll('\\', '/');

    if (!normalizedFilePath.startsWith(normalizedBasePath)) return null;

    var relativePath = normalizedFilePath.substring(normalizedBasePath.length);

    // Remove leading slash if present
    if (relativePath.startsWith('/')) {
      relativePath = relativePath.substring(1);
    }

    return relativePath;
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
        config.defaultConfig.objectmap,
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
