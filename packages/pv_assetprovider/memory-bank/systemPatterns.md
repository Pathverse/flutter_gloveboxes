# System Patterns: pv_assetprovider

## 🏗️ Core Architectural Patterns ✅

### 1. Smart Path Resolution Pattern ✅
**INNOVATION**: Dynamic path computation eliminates hardcoded assumptions

```dart
// PathResolver class - pv_assetbuilder/lib/src/utils/utils.dart
class PathResolver {
  final String projectRoot;
  final String targetDirectory;

  // Dynamically finds loader files across multiple search paths
  Future<String?> _findLoaderFile(String fileName) async {
    final searchPaths = [
      '$projectRoot/lib/loaders/$fileName.dart',
      '$projectRoot/lib/$fileName.dart',
      '$projectRoot/loaders/$fileName.dart',
      '$projectRoot/$fileName.dart',
    ];
    // Returns first found path
  }

  // Computes relative paths between any two locations
  String _computeRelativePath({required String from, required String to}) {
    // Handles cross-platform path differences
    // Generates proper relative imports (../loaders/file.dart)
  }
}
```

**Benefits**:
- Project structure agnostic
- Cross-platform compatible (Windows/Unix)
- No hardcoded paths anywhere
- Automatic discovery of loader files

### 2. Conditional Class Generation Pattern ✅
**PATTERN**: Classes extend different base types based on configuration

```dart
// Configuration-driven inheritance
if (directory.generateProvider) {
  buffer.writeln('class $className extends PVAssetProvider {');
  buffer.writeln('  $className() : super("${directory.relativePath}");');
} else {
  buffer.writeln('class $className extends PVAssetMap {');
}

// Configuration-driven content generation  
if (directory.generateObjectMap) {
  // Generate LazyObject instances
  buffer.writeln('  static final LazyObject $assetName = LazyObject("$path");');
}
// No LazyObjects generated when generateObjectMap is false
```

**Configuration Matrix Results**:
- `provider: true, objectmap: false` → Only PVAssetProvider inheritance ✅
- `provider: false, objectmap: true` → Only LazyObjects in PVAssetMap ✅
- `provider: true, objectmap: true` → Both provider + objects ✅

### 3. Runtime Configuration Override Pattern ✅
**PATTERN**: Static map modification for custom behavior injection

```dart
// Generated initialization method
void initializePVAssets() {
  // Override default type mappings
  LazyObjectConfig.defaultTypeMaps["web"] = ['.html', '.css', '.js'];
  LazyObjectConfig.defaultTypeMaps["config"] = ['.json', '.yaml', '.yml'];
  
  // Override default loaders with custom implementations
  LazyObjectConfig.defaultTypeLoaders["image"] = customloaders.loadCachedImage;
  LazyObjectConfig.defaultTypeLoaders["web"] = webloaders.loadWebContent;
}
```

**Benefits**:
- Clean separation of concerns
- Type-safe custom loader integration
- Runtime flexibility without build-time complexity
- Easy to extend with new loader types

### 4. Recursive YAML Conversion Pattern ✅
**PATTERN**: Deep conversion of YamlMap to native Dart types

```dart
// Handles nested YAML structures robustly
static dynamic _convertYamlToMap(dynamic value) {
  if (value is YamlMap) {
    return Map<String, dynamic>.fromEntries(
      value.entries.map((entry) => MapEntry(
        entry.key.toString(),
        _convertYamlToMap(entry.value), // Recursive conversion
      )),
    );
  } else if (value is YamlList) {
    return value.map(_convertYamlToMap).toList();
  } else {
    return value;
  }
}
```

**Solves**: YamlMap casting issues in complex nested configurations

### 5. Anonymous Class Hierarchy Pattern ✅
**PATTERN**: Collision-free class naming with folder structure mirroring

```dart
// Each folder gets unique anonymous class name
class _i697774904 extends PVAssetProvider {  // Root assets folder
  _i697774904() : super("assets");
  static final _i190649085 config = _i190649085();
  static final _i515237461 data = _i515237461();
  static final _i22378193 images = _i22378193();
}

class _i190649085 extends PVAssetProvider {  // Config subfolder
  _i190649085() : super("config");
  static final LazyObject app_json = LazyObject("config/app.json");
  static final LazyObject theme_yaml = LazyObject("config/theme.yaml");
}

// Clean public API
class AssetMap extends PVAssetMap {
  static final _i697774904 assets = _i697774904();
}
```

**Usage**: `AssetMap.assets.config.app_json.value`

## 🔧 Technical Implementation Patterns

### Build-Time Code Generation
```dart
// AssetGenerator generates conditional class structures
String _generateFolderClass(AssetDirectory directory) {
  final baseClass = directory.generateProvider ? 'PVAssetProvider' : 'PVAssetMap';
  
  if (directory.generateProvider) {
    // Generate constructor with path parameter
    buffer.writeln('  $className() : super("${directory.relativePath}");');
  }
  
  // Conditionally generate LazyObject instances
  if (directory.generateObjectMap) {
    for (final asset in directory.assets) {
      buffer.writeln('  static final LazyObject $assetName = LazyObject("$path");');
    }
  }
}
```

### Cross-Platform Path Normalization
```dart
// Handles Windows vs Unix path differences
String get directoryPath {
  final normalizedPath = relativePath.replaceAll('\\', '/');
  final parts = normalizedPath.split('/');
  if (parts.length <= 1) return '';
  return parts.sublist(0, parts.length - 1).join('/');
}
```

### Configuration-Driven Asset Processing
```dart
// Respects custom path configurations
for (final customPath in config.customPaths) {
  if (directory.relativePath.startsWith(customPath.path)) {
    directory.generateProvider = customPath.provider;
    directory.generateObjectMap = customPath.objectMap;
  }
}
```

## 🎯 Design Principles Applied

### 1. Separation of Concerns ✅
- **Build-time**: Code generation, configuration parsing, path resolution
- **Runtime**: Asset loading, lazy evaluation, custom loader execution

### 2. Configuration Over Convention ✅
- Every aspect controlled by `pv_asset_config.yaml`
- Default behaviors can be overridden per-path
- Custom loaders defined declaratively

### 3. Type Safety ✅
- Generated code maintains full type checking
- Custom loaders properly typed
- Configuration validation at build time

### 4. Extensibility ✅
- Easy to add new loader types
- Configuration structure supports extension
- Path resolution adapts to any project structure

### 5. Performance ✅
- Lazy loading of assets
- Build-time optimization
- Minimal runtime overhead

## 🔗 Integration Patterns

### Build Runner Integration
```yaml
# build.yaml
builders:
  pv_assetbuilder:
    import: "package:pv_assetbuilder/lib.dart"
    builder_factories: ["pvAssetBuilder"]
    build_extensions: 
      "$lib$": ["generated/pap.dart", "generated/assets.md"]
    build_to: source
```

### Package Separation
- **pv_assetbuilder**: Build-time logic, generators, resolvers
- **pv_assetprovider**: Runtime classes, lazy loading, configuration
- **Generated code**: Bridges build-time configuration to runtime usage

### Flutter Asset Integration  
```dart
// LazyObject integrates with Flutter asset system
class LazyObject {
  final String assetPath;
  
  dynamic get value {
    if (_value == null) {
      _value = _loadValue();  // Lazy evaluation
    }
    return _value;
  }
  
  dynamic _loadValue() {
    // Uses custom loaders or default behavior
    return LazyObjectConfig.getTypeLoader(assetPath, loadSignature);
  }
}
```

## 🎉 Pattern Success Metrics

All architectural patterns have been successfully implemented and tested:

| Pattern | Implementation | Testing | Real-world Usage | Status |
|---------|---------------|---------|------------------|---------|
| Smart Path Resolution | ✅ Complete | ✅ Cross-platform | ✅ Showcase app | **SUCCESS** |
| Conditional Generation | ✅ Complete | ✅ All combos | ✅ Matrix tested | **SUCCESS** |
| Runtime Override | ✅ Complete | ✅ Custom loaders | ✅ Working | **SUCCESS** |
| YAML Conversion | ✅ Complete | ✅ Nested configs | ✅ Complex cases | **SUCCESS** |
| Anonymous Hierarchy | ✅ Complete | ✅ Collision-free | ✅ Clean API | **SUCCESS** |

**Result**: Production-ready system with all design patterns working flawlessly together.

## 🚀 Architecture Evolution

### Phase 1: Basic Structure ✅
- Folder scanning and basic class generation

### Phase 2: Configuration System ✅  
- YAML parsing and conditional generation

### Phase 3: Smart Path Resolution ✅
- Dynamic path computation innovation

### Phase 4: Comprehensive Testing ✅
- Full showcase application with real-world demonstration

**Current State**: All phases complete - system ready for production use.

The architectural patterns work together seamlessly to provide a robust, flexible, and maintainable asset management system that adapts to any project structure while maintaining type safety and performance. 