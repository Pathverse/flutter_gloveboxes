
# pv_assetprovider

A revolutionary Flutter asset management package that provides **custom load methods**, automatic code generation, and type-safe asset access with unlimited extensibility.

## 🚀 Key Features

- **🔥 Custom Load Methods**: Override default loaders or create custom asset types
- **⚡ Smart Method Resolution**: Automatic discovery and import generation for custom loaders
- **🛡️ Type Safety**: Compile-time checking with generated asset classes
- **📁 Automatic Discovery**: Zero-configuration asset scanning and registration
- **🔧 Hot Reload Support**: Custom loaders work seamlessly with Flutter development
- **🎯 Modular Design**: Clean separation of loader logic in external files

## 🔧 Quick Start

### 1. Add Dependencies

```yaml
# pubspec.yaml
dependencies:
  pv_assetprovider: ^0.1.0

dev_dependencies:
  pv_assetbuilder: ^0.1.0
  build_runner: ^2.4.7
```

### 2. Configure Assets

```yaml
# pv_asset_config.yaml
paths:
  - path: assets/images
    provider: true
    objectmap: true
  - path: assets/web
    provider: false
    objectmap: true

# 🔥 Custom Load Methods Configuration
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

### 3. Create Custom Loaders

```dart
// lib/loaders/custom_loaders.dart
import 'package:flutter/material.dart';

Widget loadCachedImage(String assetPath) {
  return Container(
    decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
    child: Column(children: [
      Image.asset(assetPath),
      Text('Custom Cached: $assetPath', style: TextStyle(fontSize: 10)),
    ]),
  );
}
```

```dart
// lib/loaders/web_loaders.dart
import 'package:flutter/services.dart';

Future<String> loadWebContent(String assetPath) async {
  final content = await rootBundle.loadString(assetPath);
  // Custom preprocessing
  return 'Processed: ${content.substring(0, 100)}...';
}
```

```dart
// lib/loaders/config_loaders.dart
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:yaml/yaml.dart';

Future<Map<String, dynamic>> parseConfig(String assetPath) async {
  final content = await rootBundle.loadString(assetPath);
  if (assetPath.endsWith('.json')) {
    return jsonDecode(content);
  } else if (assetPath.endsWith('.yaml')) {
    return loadYaml(content);
  }
  return {'raw': content};
}
```

### 4. Generate Assets

```bash
dart run build_runner build
```

### 5. Use in Your App

```dart
// main.dart
import 'package:flutter/material.dart';
import 'lib/generated/pap.dart'; // Generated asset file

void main() {
  // Initialize custom loaders
  initializePVAssets();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Custom Asset Loading')),
        body: Column(children: [
          // Custom image loader
          AssetMap.assets.images.logo_png.value,
          
          // Custom web content loader
          FutureBuilder<String>(
            future: AssetMap.assets.web.index_html.value,
            builder: (context, snapshot) => 
              Text(snapshot.data ?? 'Loading...'),
          ),
          
          // Custom config parser
          FutureBuilder<Map<String, dynamic>>(
            future: AssetMap.assets.config.app_json.value,
            builder: (context, snapshot) => 
              Text('Config: ${snapshot.data}'),
          ),
        ]),
      ),
    );
  }
}
```

## 🎯 Advanced Configuration

### Custom Asset Types

Define completely new asset types with custom loading strategies:

```yaml
# pv_asset_config.yaml
signature:
  encrypted:                              # Encrypted assets
    match_via:
      extension: ['.enc']
    loader: security_loaders:decryptAsset
    
  api_driven:                            # API-sourced assets
    match_via:
      path: "assets/remote/**"
    loader: api_loaders:fetchFromAPI
    
  processed_images:                      # Image processing pipeline
    match_via:
      path: "assets/processed/**"
      extension: ['.jpg', '.png']
    loader: image_processors:enhanceImage
```

### Custom Matching Functions

Use custom logic to determine which assets should use specific loaders:

```yaml
signature:
  special_assets:
    match_via:
      custom: asset_utils:isSpecialAsset  # Custom matcher function
    loader: special_loaders:loadSpecial
```

```dart
// lib/utils/asset_utils.dart
bool isSpecialAsset(String assetPath) {
  // Custom logic to determine if asset is "special"
  return assetPath.contains('special') && assetPath.endsWith('.dat');
}
```

### Override Default Loaders

Replace built-in loading behavior:

```yaml
signature:
  image: enhanced_loaders:loadOptimizedImage  # Override ALL image loading
```

## 📁 Generated Code Structure

The build system generates clean, type-safe asset classes:

```dart
// lib/generated/pap.dart (generated)
import '../loaders/custom_loaders.dart' as customloaders;
import '../loaders/web_loaders.dart' as webloaders;
import '../loaders/config_loaders.dart' as configloaders;

class AssetMap extends PVAssetMap {
  static final AssetsAssets assets = AssetsAssets();
}

class AssetsAssets extends PVAssetProvider {
  AssetsAssets() : super("assets");
  static final ImagesAssets images = ImagesAssets();
  static final WebAssets web = WebAssets();
  static final ConfigAssets config = ConfigAssets();
}

class ImagesAssets extends PVAssetProvider {
  ImagesAssets() : super("assets/images");
  static final LazyObject logo_png = LazyObject("assets/images/logo.png");
}

class WebAssets extends PVAssetMap {
  static final LazyObject index_html = LazyObject("assets/web/index.html", loadSignature: "www");
  static final LazyObject style_css = LazyObject("assets/web/style.css", loadSignature: "www");
}

// Runtime initialization
void initializePVAssets() {
  LazyObjectConfig.defaultTypeMaps["www"] = ['.html', '.css', '.js'];
  LazyObjectConfig.defaultTypeMaps["config"] = ['.json', '.yaml'];
  
  LazyObjectConfig.defaultTypeLoaders["image"] = customloaders.loadCachedImage;
  LazyObjectConfig.defaultTypeLoaders["www"] = webloaders.loadWebContent;
  LazyObjectConfig.defaultTypeLoaders["config"] = configloaders.parseConfig;
}
```

## 🔄 Development Workflow

### Project Structure
```
your_project/
├── lib/
│   ├── loaders/                 # Custom loader implementations
│   │   ├── custom_loaders.dart
│   │   ├── web_loaders.dart
│   │   └── config_loaders.dart
│   ├── generated/
│   │   └── pap.dart             # Generated asset classes
│   └── main.dart
├── assets/                      # Your asset files
│   ├── images/
│   ├── web/
│   └── config/
├── pv_asset_config.yaml         # Custom configuration
├── build.yaml                   # Build runner config
└── pubspec.yaml
```

### Commands
```bash
# Generate assets (development)
dart run build_runner build

# Watch for changes
dart run build_runner watch

# Clean build cache
dart run build_runner clean

# Manual CLI build
dart run pv_assetbuilder:pvasbuild
```

## 🚀 Real-World Examples

### Enhanced Image Loading with Caching
```dart
Widget loadCachedImage(String assetPath) {
  return CachedNetworkImage(
    imageUrl: assetPath,
    placeholder: (context, url) => CircularProgressIndicator(),
    errorWidget: (context, url, error) => Icon(Icons.error),
    memCacheWidth: 800,
    memCacheHeight: 600,
  );
}
```

### Configuration Management
```dart
Future<AppConfig> parseConfig(String assetPath) async {
  final content = await rootBundle.loadString(assetPath);
  final data = jsonDecode(content);
  
  // Validate configuration
  if (!data.containsKey('apiUrl')) {
    throw ConfigurationError('Missing required apiUrl');
  }
  
  return AppConfig.fromJson(data);
}
```

### Dynamic Content Processing
```dart
Future<ProcessedContent> loadWebContent(String assetPath) async {
  final content = await rootBundle.loadString(assetPath);
  
  // Extract metadata
  final metadata = extractMetadata(content);
  
  // Process includes and imports
  final processed = processIncludes(content);
  
  // Minify for production
  final minified = Environment.isProduction ? minify(processed) : processed;
  
  return ProcessedContent(
    content: minified,
    metadata: metadata,
    lastModified: DateTime.now(),
  );
}
```

## 🎯 Use Cases

- **Content Management**: Custom loaders for headless CMS integration
- **Encryption**: Secure asset loading with decryption
- **Optimization**: Image compression and processing pipelines  
- **API Integration**: Remote asset fetching with caching
- **Configuration**: Environment-specific config parsing
- **Preprocessing**: Template processing and content transformation
- **Validation**: Asset integrity checking and validation
- **Analytics**: Asset usage tracking and performance monitoring

## 📖 Documentation

For complete documentation, examples, and advanced configuration options, visit:
- [GitHub Repository](https://github.com/Pathverse/flutter_gloveboxes)
- [Package Documentation](https://pub.dev/packages/pv_assetprovider)

## 🤝 Contributing

Contributions are welcome! Please read our contributing guidelines and submit pull requests for any improvements.

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

---

**Transform your Flutter asset management with unlimited customization and type safety.** 🚀
