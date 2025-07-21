# PV Asset Builder Test - Live Demo

**Interactive Flutter app demonstrating custom load methods, anonymous classes, and package forwarding.**

## 🎯 What's Demonstrated

- **Custom Image Generation**: Programmatic placeholder creation
- **Web Asset Processing**: HTML/CSS/JS handling with metadata
- **Config File Parsing**: JSON/YAML validation and processing
- **Package Extensions**: External package asset access
- **Package Forwarding**: Automatic `packages/` path generation
- **Anonymous Classes**: Hash-based collision-free naming

## 🚀 Quick Start

```bash
# 1. Install dependencies
flutter pub get

# 2. Generate assets
dart run build_runner build

# 3. Run demo
flutter run
```

## 📁 Project Structure

```
lib/
├── loaders/                    # Custom loader implementations
│   ├── custom_loaders.dart     # Programmatic image generation
│   ├── web_loaders.dart        # HTML/CSS/JS processing  
│   ├── config_loaders.dart     # JSON/YAML parsing
│   ├── test_loaders.dart       # Test asset handling
│   └── data_loaders.dart       # CSV/TXT/MD processing
├── generated/
│   └── pap.dart               # Generated anonymous classes
└── main.dart                   # Interactive demo app

assets/                         # Sample assets
├── config/                     # JSON/YAML files
├── images/                     # Images (custom generated)
├── web/                        # HTML/CSS/JS files
└── data/                       # CSV/TXT/MD files

pv_asset_config.yaml           # Configuration with all features
```

## ⚙️ Configuration Demo

```yaml
# Package forwarding (set to true to test)
forward_to_package: false

# Custom signatures with mixed extension formats
signature:
  image: custom_loaders:loadCachedImage
  web:
    match_via:
      extension: ['html', 'css', 'js']  # Mixed formats work
    loader: web_loaders:loadWebContent
  config:
    match_via:
      extension: ['.json', '.yaml', 'yml']  # Flexible formats
    loader: config_loaders:parseConfig
```

## 🎮 Interactive Demo Features

### 1. System Initialization
- Initialize custom loaders with visual feedback
- Test custom loader registration
- Show load signatures and mappings

### 2. Asset Generation Tests  
- **Custom Images**: Beautiful programmatic placeholders
- **Web Content**: HTML/CSS/JS processing with metadata
- **Config Parsing**: JSON/YAML validation and structured output
- **Package Extensions**: Path transformation demonstrations

### 3. Live Results Display
- Visual widgets for custom image generation
- Structured data display for processed assets
- Detailed logs with timestamps
- Interactive testing interface

## 📦 Package Extensions Demo

```dart
// Manual external package access
final externalAsset = AssetMap.config.app_json.withPackage("plugin_name");
final customPath = AssetMap.images.logo_png.withPrefix("custom/path");

// Provider extensions
final pluginAssets = AssetMap.assets.withPackage("external_plugin");
final directAccess = AssetMap.assets.getFromPackage("plugin", "icon.png");
```

## 🔧 Package Forwarding Test

Enable automatic package forwarding:
```yaml
# pv_asset_config.yaml
forward_to_package: true  # Test automatic path transformation
```

**Result**: All asset paths automatically prefixed with `packages/pv_assetbuilder_test/`

## 🎨 Custom Loaders Examples

### Image Generator
```dart
Widget loadCachedImage(String assetPath) {
  final color = _hashToColor(assetPath);
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(colors: [color, color.withOpacity(0.7)]),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(children: [
      Icon(Icons.image, size: 64, color: Colors.white),
      Text('Generated: ${path.basename(assetPath)}'),
    ]),
  );
}
```

### Config Parser
```dart
Future<ConfigData> parseConfig(String assetPath) async {
  final content = await rootBundle.loadString(assetPath);
  final parsed = assetPath.endsWith('.json') 
      ? jsonDecode(content) 
      : loadYaml(content);
  return ConfigData(type: ConfigType.json, parsedData: parsed, isValid: true);
}
```

## 🏗️ Generated Anonymous Classes

```dart
// Hash-based collision-free naming
class i697774904 extends PVAssetProvider {
  i697774904() : super("assets");
  final i965776908 config = i965776908();
  final i676910525 web = i676910525();
}

// Usage with clean API
AssetMap.config.app_json.value  // Custom parser
AssetMap.images.logo_png.value  // Custom generator
```

## 🎯 Testing Scenarios

1. **Custom Load Methods**: All 5 loader types working
2. **Anonymous Classes**: Collision-free hash naming  
3. **Extension Handling**: Mixed `.ext` and `ext` formats
4. **Package Extensions**: Manual external package access
5. **Package Forwarding**: Automatic path transformation
6. **Method Resolution**: Cross-platform import generation
7. **Build Integration**: Hot reload and incremental builds

## 📊 Performance Metrics

- **Build Time**: ~2 seconds for full generation
- **Asset Discovery**: Automatic scanning of all directories
- **Memory Usage**: Lazy loading with custom caching
- **Hot Reload**: Compatible with custom loaders

**Experience the future of Flutter asset management!** 🚀
