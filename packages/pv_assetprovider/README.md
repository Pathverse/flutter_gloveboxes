
# PV Asset Provider

**Production-ready Flutter asset management with custom load methods, anonymous class architecture, and automatic package support.**

## 🚀 Key Features

- **Custom Load Methods**: Replace default loaders with your own implementations
- **Anonymous Classes**: Collision-free hash-based naming (`i697774904`)
- **Package Forwarding**: Automatic external package support
- **Package Extensions**: Manual external package access
- **Type Safety**: Full compile-time checking with custom loaders
- **Extension Flexibility**: Both `.ext` and `ext` formats supported

## 📦 Quick Start

### 1. Basic Setup
```yaml
# pubspec.yaml
dependencies:
  pv_assetprovider: ^1.0.0

dev_dependencies:
  pv_assetbuilder: ^1.0.0
  build_runner: ^2.4.0
```

### 2. Configuration
```yaml
# pv_asset_config.yaml
signature:
  image: custom_loaders:loadCachedImage
  config:
    match_via:
      extension: ['json', 'yaml']
    loader: config_loaders:parseConfig
```

### 3. Custom Loaders
```dart
// lib/loaders/custom_loaders.dart
Widget loadCachedImage(String assetPath) {
  return Container(
    decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
    child: Column(children: [
      Image.asset(assetPath),
      Text('Custom: $assetPath'),
    ]),
  );
}
```

### 4. Generate Assets
```bash
dart run build_runner build
```

### 5. Use in App
```dart
import 'generated/pap.dart';

void main() {
  initializePVAssets(); // Initialize custom loaders
  runApp(MyApp());
}

Widget build(BuildContext context) {
  return Column(children: [
    AssetMap.images.logo_png.value,  // Custom loader
    AssetMap.config.app_json.value,  // Custom parser
  ]);
}
```

## 📦 Package Support

### For Package Creators
Enable automatic package forwarding:
```yaml
# pv_asset_config.yaml
forward_to_package: true  # Auto-prefixes with packages/your_package/
```

### For Package Consumers
Access external package assets:
```dart
// Manual external package access
final externalAsset = AssetMap.config.app_json.withPackage("plugin_name");
final customPath = AssetMap.images.icon_png.withPrefix("custom/path");
```

## 🏗️ Generated Code

```dart
// Anonymous collision-free classes
class i697774904 extends PVAssetProvider {
  i697774904() : super("assets");
  final i965776908 config = i965776908();
}

class i965776908 extends PVAssetProvider {
  i965776908() : super("assets/config");
  final LazyObject app_json = LazyObject("assets/config/app.json", loadSignature: "config");
}

// Clean API
final IAssetMap AssetMap = IAssetMap();
```

## ⚙️ Configuration Options

```yaml
# Package forwarding (for package creators)
forward_to_package: true

# Path configurations
pv_assetprovider:
  custom:
    - path: assets/images
      provider: true
      objectmap: false
    - path: assets/config
      provider: true
      objectmap: true

# Custom signatures
signature:
  image: custom_loaders:loadCachedImage
  web:
    match_via:
      extension: ['html', 'css', 'js']
    loader: web_loaders:loadWebContent
```

## 🎯 Advanced Usage

### Override Default Loaders
```dart
// Replace built-in image loading
signature:
  image: my_loaders:generatePlaceholder
```

### Multiple Matching Strategies
```yaml
signature:
  test_assets:
    match_via:
      path: "assets/test/**"
    loader: test_loaders:loadTestAsset
```

### Package Extensions
```dart
// Access any external package
AssetMap.assets.withPackage("flutter_package")
AssetMap.config.getFromPackage("plugin", "settings.json")

// Check package info
if (asset.hasPackagePrefix) {
  print('Package: ${asset.packageName}');
}
```

## 🔧 CLI Tool

```bash
# Manual build
dart run pv_assetbuilder:pvasbuild

# With build_runner
dart run build_runner watch
```

## 📚 Documentation

- [Package Extensions Guide](https://github.com/Pathverse/flutter_gloveboxes)
- [Custom Loader Examples](https://github.com/Pathverse/flutter_gloveboxes)
- [Configuration Reference](https://github.com/Pathverse/flutter_gloveboxes)

**Transform your Flutter asset management with unlimited custom loaders and automatic package support!** 🎯
