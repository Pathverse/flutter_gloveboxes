# pv_assetbuilder

A powerful build-time package for Flutter that enables **custom load methods**, automatic asset discovery, and type-safe code generation. Transform any file type into a custom-loaded Flutter asset with intelligent path resolution and modular loader organization.

## 🚀 Key Features

- **🔥 Custom Load Method System**: Override default loaders or create custom asset types
- **⚡ Smart Method Resolution**: Automatic discovery and import generation for loader files
- **🏗️ Build Runner Integration**: Seamless integration with Flutter's build system
- **📁 Automatic Asset Discovery**: Zero-configuration scanning of project directories
- **🛡️ Type-Safe Code Generation**: Compile-time verification with generated asset classes
- **🎯 Flexible Matching**: Match assets by path patterns, extensions, or custom logic

## 📦 Installation

Add to your `pubspec.yaml`:

```yaml
dev_dependencies:
  pv_assetbuilder: ^0.1.0
  build_runner: ^2.4.7

dependencies:
  pv_assetprovider: ^0.1.0
```

## 🔧 Quick Setup

### 1. Create Configuration File

Create `pv_asset_config.yaml` in your project root:

```yaml
# Basic path configuration
paths:
  - path: assets/images
    provider: true
    objectmap: true
  - path: assets/web
    provider: false
    objectmap: true

# Custom load method signatures
signature:
  image: custom_loaders:loadCachedImage    # Override default image loading
  www:                                     # Define custom web asset type
    match_via:
      path: "assets/web/**"
      extension: ['.html', '.css', '.js']
    loader: web_loaders:loadWebContent
  config:                                  # Configuration files
    match_via:
      extension: ['.json', '.yaml']
    loader: config_loaders:parseConfig
```

### 2. Configure Build Runner

Add to your `build.yaml`:

```yaml
targets:
  $default:
    builders:
      pv_assetbuilder:
        options:
          config_file: pv_asset_config.yaml
```

### 3. Create Custom Loaders

```dart
// lib/loaders/custom_loaders.dart
import 'package:flutter/material.dart';

Widget loadCachedImage(String assetPath) {
  return Container(
    decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
    child: Column(children: [
      Image.asset(assetPath),
      Text('Custom Cached: $assetPath'),
    ]),
  );
}
```

### 4. Generate Assets

```bash
dart run build_runner build
```

## 🏗️ Build System Architecture

### Core Components

```
pv_assetbuilder/
├── lib/src/
│   ├── builders/           # Build runner integration
│   │   └── asset_builder.dart
│   ├── config/             # Configuration parsing
│   │   ├── config_parser.dart
│   │   └── signature_config.dart
│   ├── generators/         # Code generation engine
│   │   └── asset_generator.dart
│   ├── resolvers/          # Smart method resolution
│   │   └── method_resolver.dart
│   ├── scanner/            # Asset discovery system
│   │   └── asset_scanner.dart
│   └── utils/              # Path resolution utilities
│       └── utils.dart
├── build.yaml             # Build runner configuration
└── bin/
    └── pvasbuild.dart      # CLI tool for manual builds
```

### Generation Process

1. **Configuration Parsing**: Reads `pv_asset_config.yaml` with signature definitions
2. **Asset Discovery**: Scans project directories for matching files
3. **Method Resolution**: Finds and validates custom loader methods
4. **Import Generation**: Creates proper relative imports with aliases
5. **Code Generation**: Generates type-safe asset classes
6. **Runtime Setup**: Creates initialization method for custom loaders

## 🎯 Custom Load Method System

### Signature Configuration

Define custom asset types with flexible matching:

```yaml
signature:
  # Simple override
  image: enhanced_loaders:loadOptimizedImage
  
  # Complex custom type
  encrypted_assets:
    match_via:
      extension: ['.enc', '.secure']
      path: "assets/secure/**"
    loader: security_loaders:decryptAsset
    
  # Custom matcher function
  special_files:
    match_via:
      custom: utils:isSpecialFile
    loader: special_loaders:processSpecial
```

### Method Resolution Engine

The build system automatically:

- **Discovers loader files** across standard project locations
- **Generates proper imports** with namespace aliases 
- **Validates method signatures** at build time
- **Handles cross-platform paths** (Windows/Unix compatibility)

### Generated Code Example

```dart
// lib/generated/pap.dart (generated)
import '../loaders/custom_loaders.dart' as customloaders;
import '../loaders/web_loaders.dart' as webloaders;
import '../loaders/config_loaders.dart' as configloaders;

class AssetMap extends PVAssetMap {
  static final AssetsAssets assets = AssetsAssets();
}

class ImagesAssets extends PVAssetProvider {
  ImagesAssets() : super("assets/images");
  static final LazyObject logo_png = LazyObject("assets/images/logo.png");
}

class WebAssets extends PVAssetMap {
  static final LazyObject index_html = LazyObject("assets/web/index.html", loadSignature: "www");
}

// Runtime initialization
void initializePVAssets() {
  LazyObjectConfig.defaultTypeMaps["www"] = ['.html', '.css', '.js'];
  LazyObjectConfig.defaultTypeLoaders["image"] = customloaders.loadCachedImage;
  LazyObjectConfig.defaultTypeLoaders["www"] = webloaders.loadWebContent;
}
```

## 🔧 CLI Tool

Use the CLI tool for manual builds and advanced workflows:

```bash
# Basic build
dart run pv_assetbuilder:pvasbuild path/to/project

# With options
dart run pv_assetbuilder:pvasbuild path/to/project \
  --config custom_config.yaml \
  --verbose \
  --watch
```

### CLI Features

- **Manual asset building** outside of build_runner
- **Watch mode** for continuous development
- **Verbose output** for debugging
- **Custom configuration files** for different environments

## ⚙️ Advanced Configuration

### Path Configuration Options

```yaml
paths:
  - path: assets/images
    provider: true          # Generate PVAssetProvider inheritance
    objectmap: true         # Generate LazyObject instances
  - path: assets/data
    provider: false         # Extend PVAssetMap only
    objectmap: true         # Include asset objects
```

### Signature Matching Strategies

```yaml
signature:
  documents:
    match_via:
      extension: ['.pdf', '.doc']     # Extension-based matching
      path: "docs/**/*.pdf"           # Path pattern matching
      custom: doc_utils:isDocument    # Custom matcher function
    loader: doc_loaders:loadDocument
```

### Build Configuration

```yaml
builders:
  pv_assetbuilder:
    import: "package:pv_assetbuilder/lib.dart"
    builder_factories: ["pvAssetBuilder"]
    build_extensions: 
      "$lib$": ["generated/pap.dart", "generated/assets.md"]
    auto_apply: dependents
    build_to: source
    required_inputs: [".dart", ".yaml"]
```

## 🚀 Real-World Use Cases

### Content Management Systems
```dart
// Custom CMS loader
Future<CMSContent> loadCMSAsset(String assetPath) async {
  final metadata = await CMSClient.getMetadata(assetPath);
  return CMSClient.fetchContent(metadata);
}
```

### Encrypted Assets
```dart
// Security loader
Future<String> loadEncryptedAsset(String assetPath) async {
  final encrypted = await rootBundle.load(assetPath);
  return SecurityService.decrypt(encrypted);
}
```

### API-Driven Content
```dart
// Remote asset loader
Future<ApiContent> loadApiAsset(String assetPath) async {
  final config = ApiConfig.fromPath(assetPath);
  return ApiClient.fetch(config.endpoint);
}
```

## 🛠️ Development Workflow

### Integration with Build Runner

```bash
# Development workflow
dart run build_runner watch      # Continuous builds
dart run build_runner build      # One-time build
dart run build_runner clean      # Clean cache
```

### Testing and Debugging

```bash
# Enable verbose output
dart run build_runner build --verbose

# Test specific configurations
dart run pv_assetbuilder:pvasbuild . --config test_config.yaml
```

## 📊 Performance Features

- **Incremental builds**: Only processes changed configurations
- **Smart caching**: Leverages build_runner's dependency tracking
- **Lazy generation**: Generates only needed asset classes
- **Cross-platform optimization**: Efficient path handling

## 🔗 Integration Examples

### With Existing Flutter Projects

1. Add pv_assetbuilder to `dev_dependencies`
2. Create `pv_asset_config.yaml` with your asset structure
3. Run `dart run build_runner build`
4. Use generated assets in your app

### With Custom Asset Pipelines

```yaml
signature:
  processed_images:
    match_via:
      path: "processed/**"
    loader: image_pipeline:processImage
    
  minified_js:
    match_via:
      extension: ['.js']
    loader: js_pipeline:minifyAndOptimize
```

## 📚 API Reference

### Configuration Classes

- `ConfigParser`: Parses `pv_asset_config.yaml` files
- `SignatureConfig`: Models custom signature definitions
- `AssetDirectory`: Represents scanned directory structure

### Generator Classes

- `AssetGenerator`: Main code generation engine
- `MethodResolver`: Custom method discovery and validation
- `PathResolver`: Cross-platform path resolution

### Builder Integration

- `AssetBuilder`: Build runner integration point
- `AssetScanner`: File system scanning and asset discovery

## 🎉 Complete Example

For a comprehensive example with all features demonstrated, see:
- [pv_assetbuilder_test](../pv_assetbuilder_test) - Complete plug-and-go demonstration
- [GitHub Repository](https://github.com/Pathverse/flutter_gloveboxes) - Full source code

## 🤝 Contributing

Contributions welcome! Please see our contributing guidelines and submit pull requests for:

- New signature matching strategies
- Performance optimizations
- Additional CLI features
- Documentation improvements

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

---

**Transform your Flutter asset workflow with unlimited customization and type safety.** 🚀
