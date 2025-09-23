# System Patterns: pv_assetprovider

## 🏗️ Core Architectural Patterns ✅

### 1. Anonymous Class Hierarchy Pattern ✅
**PATTERN**: Collision-free class naming with hash-based identifiers

```dart
// Each directory gets unique anonymous class name
class i697774904 extends PVAssetProvider {
  i697774904() : super("assets");
  final i965776908 config = i965776908();
  final i676910525 web = i676910525();
}

// Clean public API
class IAssetMap extends PVAssetMap {
  final i697774904 assets = i697774904();
}
```

**Benefits**: Collision-free naming, public visibility, consistent navigation, instance-based architecture

### 2. Package Forwarding Pattern ✅
**PATTERN**: Automatic package path transformation with root-level configuration

```dart
// Configuration-driven package forwarding
if (config.shouldForwardToPackage) {
  final packagePrefix = 'packages/${config.currentPackageName}/';
  final finalAssetPath = '$packagePrefix$fullAssetPath';
}

// Results in automatic transformation:
// "assets/config/app.json" → "packages/my_package/assets/config/app.json"
```

**Configuration**:
```yaml
# Simple root-level activation
forward_to_package: true  # Reads package name from pubspec.yaml automatically
```

**Benefits**: Zero-config package support, automatic path transformation, perfect for package creators

### 3. Package Extensions Pattern ✅
**PATTERN**: Fluent API for external package asset access

```dart
// Extension methods for LazyObject
extension LazyObjectPackageExtension on LazyObject {
  LazyObject withPackage(String packageName) {
    return LazyObject('packages/$packageName/$assetPath', loadSignature: loadSignature);
  }
  
  LazyObject withPrefix(String prefix) {
    return LazyObject('$prefix/$assetPath', loadSignature: loadSignature);
  }
}

// Usage examples
AssetMap.config.app_json.withPackage("external_plugin")
AssetMap.assets.getFromPackage("plugin", "config/settings.json")
```

**Benefits**: Manual external package access, fluent API, preserves type safety

### 4. Smart Method Resolution Pattern ✅
**PATTERN**: Automatic discovery and import generation for custom methods

```dart
// PathResolver class - dynamic path computation
class PathResolver {
  Future<String?> findLoaderFile(String fileName) async {
    final searchPaths = [
      '$projectRoot/lib/loaders/$fileName.dart',
      '$projectRoot/lib/$fileName.dart',
      '$projectRoot/loaders/$fileName.dart',
    ];
    return _findFirstExisting(searchPaths);
  }
}
```

**Benefits**: Project structure agnostic, cross-platform compatible, automatic discovery

### 5. Conditional Class Generation Pattern ✅
**PATTERN**: Classes extend different base types based on configuration

```dart
// Configuration-driven inheritance with package support
if (directory.generateProvider) {
  final providerPath = config.shouldForwardToPackage 
      ? '${config.packagePrefix}${directory.relativePath}'
      : directory.relativePath;
  buffer.writeln('class $className extends PVAssetProvider {');
  buffer.writeln('  $className() : super("$providerPath");');
}
```

**Configuration Results**:
- `provider: true, objectmap: false` → PVAssetProvider only
- `provider: false, objectmap: true` → LazyObjects in PVAssetMap  
- `provider: true, objectmap: true` → Both provider + objects
- `forward_to_package: true` → All paths prefixed with `packages/`

### 6. Runtime Configuration Override Pattern ✅
**PATTERN**: Static map modification for custom behavior injection

```dart
// Generated initialization method
void initializePVAssets() {
  // Register custom type mappings
  LazyObjectConfig.defaultTypeMaps["web"] = ['html', 'css', 'js'];
  
  // Register custom loaders
  LazyObjectConfig.defaultTypeLoaders["image"] = customloaders.loadCachedImage;
  LazyObjectConfig.defaultTypeLoaders["web"] = webloaders.loadWebContent;
}
```

**Benefits**: Clean separation of concerns, type-safe integration, runtime flexibility

### 7. Extension Normalization Pattern ✅
**PATTERN**: Unified extension handling supporting both formats

```dart
// Handles both '.ext' and 'ext' formats in configuration
void setDotStrippedStringList(SelfUpdatingMap<String, List<String>> map, String key) {
  final value = map._map[key];
  if (value == null) return;
  
  final needsProcessing = value.any((s) => s.startsWith('.'));
  if (!needsProcessing) return;
  
  final processed = value.map((s) => s.startsWith('.') ? s.substring(1) : s).toList();
  map._map[key] = processed;
}
```

**Configuration Flexibility**:
```yaml
signature:
  config:
    match_via:
      extension: ['.json', '.yaml', 'yml']  # Mixed formats supported
  web:
    match_via:  
      extension: ['html', 'css', 'js']      # No dots required
```

**Benefits**: User convenience, internal consistency, reliable extension matching

## 🔧 Technical Implementation Patterns

### Build-Time Code Generation
```dart
// AssetGenerator with package forwarding support
String generateFolderClass(AssetDirectory directory) {
  final className = directory.anonymousClassName; // i + hash
  final baseClass = directory.generateProvider ? 'PVAssetProvider' : 'PVAssetMap';
  
  // Apply package prefix if enabled
  final providerPath = config.shouldForwardToPackage 
      ? '${config.packagePrefix}${directory.relativePath}'
      : directory.relativePath;
  
  return '''
class $className extends $baseClass {
  ${directory.generateProvider ? '$className() : super("$providerPath");' : ''}
  ${_generateAssetFields(directory)}
}''';
}
```

### Cross-Platform Path Normalization
```dart
String get directoryPath {
  final normalizedPath = relativePath.replaceAll('\\', '/');
  final parts = normalizedPath.split('/');
  return parts.length <= 1 ? '' : parts.sublist(0, parts.length - 1).join('/');
}
```

### Configuration-Driven Asset Processing
```dart
// Package name detection from pubspec.yaml
static Future<String> _readPackageName(String configFilePath) async {
  final configDir = File(configFilePath).parent;
  final pubspecFile = File('${configDir.path}/pubspec.yaml');
  final pubspecContent = await pubspecFile.readAsString();
  final pubspecYaml = loadYaml(pubspecContent);
  return pubspecYaml['name'] as String;
}
```

## 🎯 Design Principles Applied

### 1. Separation of Concerns ✅
- **Build-time**: Code generation, configuration parsing, method resolution, package detection
- **Runtime**: Asset loading, lazy evaluation, custom loader execution, package extensions

### 2. Configuration Over Convention ✅
- Every aspect controlled by `pv_asset_config.yaml`
- Default behaviors overridable per-path
- Custom loaders defined declaratively
- Package forwarding with simple boolean flag

### 3. Type Safety ✅
- Generated code maintains full type checking
- Custom loaders properly typed
- Configuration validation at build time
- Package extensions preserve signatures

### 4. Extensibility ✅
- Easy addition of new loader types
- Configuration structure supports extension
- Path resolution adapts to any project structure
- Package system accommodates any external package

### 5. Performance ✅
- Lazy loading of assets
- Build-time optimization
- Minimal runtime overhead
- Package forwarding adds zero runtime cost

## 🎉 Pattern Success Metrics

All architectural patterns successfully implemented and production-tested:

| Pattern | Implementation | Testing | Real-world Usage | Status |
|---------|---------------|---------|------------------|---------|
| Anonymous Class Hierarchy | ✅ Complete | ✅ Collision-free | ✅ Demo app | **SUCCESS** |
| Package Forwarding | ✅ Complete | ✅ Automatic | ✅ Tested | **SUCCESS** |
| Package Extensions | ✅ Complete | ✅ All methods | ✅ Working | **SUCCESS** |
| Smart Method Resolution | ✅ Complete | ✅ Cross-platform | ✅ Working | **SUCCESS** |
| Conditional Generation | ✅ Complete | ✅ All combos | ✅ Tested | **SUCCESS** |
| Runtime Override | ✅ Complete | ✅ Custom loaders | ✅ Working | **SUCCESS** |
| Extension Normalization | ✅ Complete | ✅ Both formats | ✅ Flexible | **SUCCESS** |

**Result**: Production-ready system with all design patterns working seamlessly together. 