# Product Context: pv_assetprovider

## Problem Statement
Flutter developers struggle with:
- **Asset Path Management**: Hard-coded string paths that are error-prone and not type-safe
- **Manual Asset Registration**: Tedious process of manually adding assets to pubspec.yaml
- **Runtime Asset Loading**: No lazy loading or optimization for asset access
- **Type Safety**: No compile-time verification that assets exist
- **Custom Asset Types**: Limited extensibility for specialized asset handling
- **Loading Method Constraints**: Forced to use default loading strategies

## Solution Approach
pv_assetprovider solves these problems by providing:

### 1. Build.yml Configuration-Driven Asset Management
```yaml
pv_assetprovider:
    target: lib/generated
    custom:
        - path: assets/images
          provider: true
        - path: assets/sounds
          provider: false
          objectmap: true
    default:
        provider: true
```
Uses build.yml configuration to define asset mapping rules, eliminating manual asset registration.

### 2. Lazy Loading with Type Detection
```dart
LazyObject asset = LazyObject("assets/images/logo.png");
// Automatically detects image type and loads appropriately
Widget widget = asset.value; // Returns Image.network(path)
```

### 3. Path-Based Navigation
```dart
PVAssetProvider provider = PVAssetProvider("assets");
LazyObject logo = provider / "images" / "logo.png";
```

### 4. Generated Type-Safe Access
After build process:
```dart
// Generated anonymous classes for folder structure
class _i486 extends PVAssetMap {
    static const PVAssetProvider images = PVAssetProvider("assets/images");
    static const LazyObject logo_png = LazyObject("assets/images/logo.png");
}

class AssetMap extends PVAssetMap {
    static const _i486 assets = _i486();
}

// Usage: AssetMap.assets.logo_png
```

### 🆕 5. Custom Load Methods & Flexible Asset Types

#### Enhanced Configuration
```yaml
signature:
  image:                           # Override default behavior
    custom_file: custom_loaders:loadImage
  www:                             # Custom asset type
    match_via:
      path: "assets/web/**"        # Path pattern matching
      extension: ['.html', '.css', '.js']  # Extension-based matching
      custom: web_utils:isWebAsset # Custom matching function
    loader: web_loaders:loadWebContent
  config:                          # JSON configuration files
    match_via:
      extension: ['.json', '.yaml']
    loader: config_loaders:parseConfig
```

#### Custom Method Benefits
- **Extensible Loading**: Define custom loading strategies for any asset type
- **Override Defaults**: Replace built-in loaders (like image loading) with custom implementations
- **Flexible Matching**: Match assets by path patterns, extensions, or custom logic
- **External Methods**: Reference methods from separate files for modularity
- **Type-Safe Customization**: Custom loaders work seamlessly with generated code

#### Usage Examples
```dart
// Custom web asset loading
LazyObject webPage = LazyObject("assets/web/index.html", loadSignature: "www");
dynamic content = webPage.value; // Uses custom web loader

// Override default image loading
LazyObject customImage = LazyObject("assets/images/logo.png"); 
Widget widget = customImage.value; // Uses custom image loader if configured

// Custom configuration files
LazyObject config = LazyObject("assets/config/app.json", loadSignature: "config");
Map<String, dynamic> settings = config.value; // Uses config parser
```

## User Experience Goals
- **Zero Configuration**: Assets automatically discovered and registered
- **Type Safety**: Compile-time verification of asset paths
- **Performance**: Lazy loading prevents unnecessary asset loading
- **Developer Experience**: Intuitive path navigation with IntelliSense support
- **🆕 Unlimited Extensibility**: Custom asset types and loading strategies
- **🆕 Override Flexibility**: Replace any default behavior with custom implementation

## Asset Types Supported

### Built-in Types
- **Images**: .png, .jpg, .jpeg, .gif, .webp
- **Extensible**: TYPE_MAPS and TYPE_LOADERS allow adding new asset types

### 🆕 Custom Types (via Custom Methods)
- **Web Assets**: HTML, CSS, JavaScript files with custom rendering
- **Configuration**: JSON, YAML files with custom parsing
- **Documents**: PDF, text files with custom viewers
- **Audio/Video**: Custom media players and processors
- **Fonts**: Custom font loading and registration
- **Data Files**: CSV, XML with custom parsers
- **Any Type**: Limited only by custom method implementation

## Workflow Integration
1. Developer adds assets to project directories
2. Configures build.yml with path patterns, options, and custom signatures
3. 🆕 **Implements custom loading methods** in separate files if needed
4. Runs pv_assetbuilder tool (build_runner)
5. Gets generated code with static class hierarchy and custom type support
6. Uses LazyObject and PVAssetProvider for optimized asset access with custom loading

## 🆕 Custom Method Development
```dart
// custom_loaders.dart
import 'package:flutter/material.dart';

Widget loadImage(String assetPath) {
  // Custom image loading with caching, compression, etc.
  return CachedNetworkImage(imageUrl: assetPath);
}

// web_loaders.dart  
Future<String> loadWebContent(String assetPath) async {
  // Custom web content loading with preprocessing
  final content = await rootBundle.loadString(assetPath);
  return processWebContent(content);
}

// config_loaders.dart
Map<String, dynamic> parseConfig(String assetPath) {
  // Custom configuration parsing with validation
  final content = rootBundle.loadString(assetPath);
  return validateAndParseJson(content);
}
``` 