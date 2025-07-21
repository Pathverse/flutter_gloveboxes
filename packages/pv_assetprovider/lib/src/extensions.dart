/// Extensions for package-aware asset loading
/// Supports external packages with paths like "packages/{package}/assets/..."

import 'pap.dart';
import 'lazyobject.dart';

/// Extension on PVAssetProvider to support external package paths
extension PVAssetProviderPackageExtension on PVAssetProvider {
  /// Create a new PVAssetProvider with a package prefix
  ///
  /// Example:
  /// ```dart
  /// AssetMap.assets.withPackage("my_package")
  /// // Results in paths like: "packages/my_package/assets/..."
  /// ```
  PVAssetProvider withPackage(String packageName) {
    return PVAssetProvider('packages/$packageName/$path');
  }

  /// Create a new PVAssetProvider with a custom path prefix
  ///
  /// Example:
  /// ```dart
  /// AssetMap.assets.withPrefix("custom/path")
  /// // Results in paths like: "custom/path/assets/..."
  /// ```
  PVAssetProvider withPrefix(String prefix) {
    // Ensure prefix doesn't end with slash
    final cleanPrefix = prefix.endsWith('/')
        ? prefix.substring(0, prefix.length - 1)
        : prefix;
    return PVAssetProvider('$cleanPrefix/$path');
  }

  /// Get a LazyObject with package prefix applied
  ///
  /// Example:
  /// ```dart
  /// AssetMap.assets.getFromPackage("my_package", "config/app.json")
  /// // Results in: "packages/my_package/assets/config/app.json"
  /// ```
  LazyObject getFromPackage(String packageName, String assetPath) {
    return LazyObject('packages/$packageName/$path/$assetPath');
  }

  /// Get a LazyObject with custom prefix applied
  ///
  /// Example:
  /// ```dart
  /// AssetMap.assets.getFromPrefix("custom/path", "config/app.json")
  /// // Results in: "custom/path/assets/config/app.json"
  /// ```
  LazyObject getFromPrefix(String prefix, String assetPath) {
    final cleanPrefix = prefix.endsWith('/')
        ? prefix.substring(0, prefix.length - 1)
        : prefix;
    return LazyObject('$cleanPrefix/$path/$assetPath');
  }
}

/// Extension on LazyObject to support external package paths
extension LazyObjectPackageExtension on LazyObject {
  /// Create a new LazyObject with a package prefix
  ///
  /// Example:
  /// ```dart
  /// AssetMap.config.app_json.withPackage("my_package")
  /// // Changes path from "assets/config/app.json" to "packages/my_package/assets/config/app.json"
  /// ```
  LazyObject withPackage(String packageName) {
    return LazyObject(
      'packages/$packageName/$assetPath',
      loadSignature: loadSignature,
    );
  }

  /// Create a new LazyObject with a custom path prefix
  ///
  /// Example:
  /// ```dart
  /// AssetMap.config.app_json.withPrefix("custom/path")
  /// // Changes path from "assets/config/app.json" to "custom/path/assets/config/app.json"
  /// ```
  LazyObject withPrefix(String prefix) {
    final cleanPrefix = prefix.endsWith('/')
        ? prefix.substring(0, prefix.length - 1)
        : prefix;
    return LazyObject('$cleanPrefix/$assetPath', loadSignature: loadSignature);
  }

  /// Create a new LazyObject with the asset path completely replaced
  ///
  /// Example:
  /// ```dart
  /// AssetMap.config.app_json.withPath("completely/different/path.json")
  /// // Changes path to exactly: "completely/different/path.json"
  /// ```
  LazyObject withPath(String newPath) {
    return LazyObject(newPath, loadSignature: loadSignature);
  }

  /// Get the current asset path (convenience getter)
  String get currentPath => assetPath;

  /// Check if this asset has a package prefix
  bool get hasPackagePrefix => assetPath.startsWith('packages/');

  /// Extract package name if this asset has a package prefix
  String? get packageName {
    if (!hasPackagePrefix) return null;
    final parts = assetPath.split('/');
    return parts.length > 1 ? parts[1] : null;
  }

  /// Get the asset path without any package prefix
  String get pathWithoutPackage {
    if (!hasPackagePrefix) return assetPath;
    final parts = assetPath.split('/');
    if (parts.length <= 2) return '';
    return parts.sublist(2).join('/');
  }
}
