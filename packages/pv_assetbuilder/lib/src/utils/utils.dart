/// Utility functions for path resolution and project structure analysis
library;

import 'dart:io';

/// Smart path resolver for computing relative import paths
class PathResolver {
  final String projectRoot;
  final String targetDirectory;

  PathResolver(this.projectRoot, this.targetDirectory);

  /// Resolve the relative path from generated file to a loader file
  Future<String?> resolveLoaderPath(String loaderFileName) async {
    // First, find where the loader file actually exists
    final loaderLocation = await _findLoaderFile(loaderFileName);
    if (loaderLocation == null) {
      return null;
    }

    // Compute relative path from target directory to loader location
    return _computeRelativePath(
      from: '$projectRoot/$targetDirectory',
      to: loaderLocation,
    );
  }

  /// Find a loader file in the project
  Future<String?> _findLoaderFile(String fileName) async {
    final searchPaths = [
      '$projectRoot/lib/loaders/$fileName.dart',
      '$projectRoot/lib/$fileName.dart',
      '$projectRoot/loaders/$fileName.dart',
      '$projectRoot/$fileName.dart',
    ];

    for (final path in searchPaths) {
      if (await File(path).exists()) {
        return path;
      }
    }

    return null;
  }

  /// Compute relative path from one directory to a file
  String _computeRelativePath({required String from, required String to}) {
    final fromUri = Uri.directory(from);
    final toUri = Uri.file(to);

    final relative = fromUri.resolveUri(toUri).path;

    // Convert to relative import format
    if (relative.startsWith('/')) {
      // Absolute path, convert to relative
      final fromParts = _normalizePath(from).split('/');
      final toParts = _normalizePath(to).split('/');

      // Find common root
      int commonLength = 0;
      while (commonLength < fromParts.length &&
          commonLength < toParts.length &&
          fromParts[commonLength] == toParts[commonLength]) {
        commonLength++;
      }

      // Build relative path
      final upLevels = fromParts.length - commonLength;
      final relativeParts = <String>[];

      for (int i = 0; i < upLevels; i++) {
        relativeParts.add('..');
      }

      for (int i = commonLength; i < toParts.length; i++) {
        relativeParts.add(toParts[i]);
      }

      return relativeParts.join('/');
    }

    return relative;
  }

  /// Normalize path separators for cross-platform compatibility
  String _normalizePath(String path) {
    return path.replaceAll('\\', '/');
  }

  /// Get all loader files in the project
  Future<Map<String, String>> findAllLoaderFiles() async {
    final loaderFiles = <String, String>{};

    final searchDirectories = [
      '$projectRoot/lib/loaders',
      '$projectRoot/lib',
      '$projectRoot/loaders',
      projectRoot,
    ];

    for (final dir in searchDirectories) {
      final directory = Directory(dir);
      if (await directory.exists()) {
        await for (final entity in directory.list()) {
          if (entity is File && entity.path.endsWith('.dart')) {
            final fileName = entity.path
                .split('/')
                .last
                .replaceAll('.dart', '');
            if (fileName.contains('loader') || fileName.contains('_loaders')) {
              final relativePath = await resolveLoaderPath(fileName);
              if (relativePath != null) {
                loaderFiles[fileName] = relativePath.replaceAll('.dart', '');
              }
            }
          }
        }
      }
    }

    return loaderFiles;
  }

  /// Generate import alias from file name
  static String generateImportAlias(String fileName) {
    return fileName.replaceAll('_', '').replaceAll('-', '');
  }

  /// Validate that a loader file exists and is accessible
  Future<bool> validateLoaderFile(String fileName) async {
    final location = await _findLoaderFile(fileName);
    return location != null;
  }
}

/// Project structure analyzer for understanding layout
class ProjectAnalyzer {
  final String projectRoot;

  ProjectAnalyzer(this.projectRoot);

  /// Analyze project structure and suggest best practices
  Future<ProjectInfo> analyzeProject() async {
    final info = ProjectInfo();

    // Check for common directories
    info.hasLibDirectory = await Directory('$projectRoot/lib').exists();
    info.hasLoadersDirectory = await Directory(
      '$projectRoot/lib/loaders',
    ).exists();
    info.hasAssetsDirectory = await Directory('$projectRoot/assets').exists();

    // Find pubspec.yaml to confirm project root
    info.isPubProject = await File('$projectRoot/pubspec.yaml').exists();

    // Analyze loader file distribution
    info.loaderLocations = await _findLoaderLocations();

    return info;
  }

  /// Find where loader files are located in the project
  Future<List<String>> _findLoaderLocations() async {
    final locations = <String>[];

    final searchDirs = [
      '$projectRoot/lib/loaders',
      '$projectRoot/lib',
      '$projectRoot/loaders',
    ];

    for (final dir in searchDirs) {
      final directory = Directory(dir);
      if (await directory.exists()) {
        await for (final entity in directory.list()) {
          if (entity is File &&
              entity.path.endsWith('.dart') &&
              (entity.path.contains('loader') ||
                  entity.path.contains('_loaders'))) {
            final relativePath = entity.path.substring(projectRoot.length + 1);
            locations.add(relativePath);
          }
        }
      }
    }

    return locations;
  }
}

/// Information about project structure
class ProjectInfo {
  bool hasLibDirectory = false;
  bool hasLoadersDirectory = false;
  bool hasAssetsDirectory = false;
  bool isPubProject = false;
  List<String> loaderLocations = [];

  @override
  String toString() {
    return 'ProjectInfo(lib: $hasLibDirectory, loaders: $hasLoadersDirectory, '
        'assets: $hasAssetsDirectory, pub: $isPubProject, '
        'loaderFiles: ${loaderLocations.length})';
  }
}
