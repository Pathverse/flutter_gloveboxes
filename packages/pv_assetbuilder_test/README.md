# PV Asset Builder Test - Complete Demonstration

This is a **production-ready example** of the PV Asset Builder custom load method system, showcasing all features of the revolutionary asset management solution with real working implementations.

## 🚀 Quick Start

1. **Install Dependencies**
   ```bash
   flutter pub get
   ```

2. **Generate Asset Code**
   ```bash
   dart run build_runner build
   ```

3. **Run the App**
   ```bash
   flutter run
   ```

## 📁 Project Structure

```
pv_assetbuilder_test/
├── assets/                          # Sample assets for testing
│   ├── images/logo.png             # Standard image (custom cached loader)
│   ├── web/                        # Web content (custom web loader)
│   │   ├── index.html
│   │   ├── styles.css
│   │   └── app.js
│   ├── config/                     # Configuration files (custom config parser)
│   │   ├── app.json
│   │   └── theme.yaml
│   ├── data/                       # Data files (custom data loader)
│   │   ├── sample.csv
│   │   └── readme.md
│   └── test/                       # Test assets (path pattern matching)
│       └── sample_data.txt
├── lib/
│   ├── loaders/                    # Custom loading methods
│   │   ├── custom_loaders.dart     # Enhanced image loading
│   │   ├── web_loaders.dart        # Web content processing
│   │   ├── config_loaders.dart     # Configuration parsing
│   │   ├── test_loaders.dart       # Test asset handling
│   │   └── data_loaders.dart       # Data file processing
│   ├── generated/                  # Generated asset classes (after build)
│   └── main.dart                   # Demo app
└── pv_asset_config.yaml           # Custom signature configuration
```

## ⚙️ Configuration (pv_asset_config.yaml)

The project uses a comprehensive `pv_asset_config.yaml` that demonstrates all custom loading features:

```yaml
# Custom Signature Configurations
signature:
  # Override default image loading with custom caching
  image:
    loader: custom_loaders:loadCachedImage
    
  # Custom web assets signature
  web:
    match_via:
      extension: ['.html', '.css', '.js']
    loader: web_loaders:loadWebContent
    
  # Configuration files signature  
  config:
    match_via:
      extension: ['.json', '.yaml', '.yml']
    loader: config_loaders:parseConfig
    
  # Path pattern example for specific directories
  test_assets:
    match_via:
      path: "assets/test/**"
    loader: test_loaders:loadTestAsset
    
  # Custom data files
  data:
    match_via:
      extension: ['.csv', '.txt', '.md']
    loader: data_loaders:loadDataFile
```

## 🎯 Features Demonstrated

### 1. **Custom Image Loading** (`custom_loaders:loadCachedImage`)
- Enhanced caching with width/height limits
- Quality filtering
- Error handling with fallback UI
- Optimized loading for mobile

### 2. **Web Content Processing** (`web_loaders:loadWebContent`)
- HTML processing with mobile viewport injection
- CSS minification and vendor prefixes
- JavaScript validation and dependency extraction
- Content type detection and processing

### 3. **Configuration Parsing** (`config_loaders:parseConfig`)
- JSON parsing with validation
- Basic YAML parsing (demo implementation)
- App settings extraction
- Type-safe configuration access

### 4. **Test Asset Handling** (`test_loaders:loadTestAsset`)
- Path pattern matching (`assets/test/**`)
- Metadata generation
- Test type classification
- Mock API response simulation

### 5. **Data File Processing** (`data_loaders:loadDataFile`)
- CSV parsing with headers and type conversion
- Markdown structure analysis with read time estimation
- Text file analysis with encoding detection
- Generic data file metadata

## 📱 Demo App Features

The Flutter app demonstrates:

- **Live Testing**: Buttons to test each custom loader
- **Real-time Output**: See loader results and metadata
- **Error Handling**: Demonstrates graceful failure handling
- **Generated Code Examples**: Shows how to use generated assets

## 🔧 Generated Code Examples

After running `build_runner`, you'll get type-safe asset access:

```dart
// Standard assets (no loadSignature needed)
Widget logo = AssetMap.assets.logo_png.value;

// Custom web content (automatically uses web loader)
WebContent page = await AssetMap.web.index_html.value;

// Configuration files (automatically uses config parser)
ConfigData config = await AssetMap.config.app_json.value;

// Test assets (path pattern automatically matched)
TestAsset test = await AssetMap.test.sample_data_txt.value;

// Data files (automatically uses data parser)
CsvData csvData = await AssetMap.data.sample_csv.value;
```

## 🔄 Smart Code Generation

The system intelligently generates `loadSignature` parameters only when needed and creates proper class inheritance:

```dart
// Clean generation without unnecessary parameters
static final LazyObject logo_png = LazyObject("assets/images/logo.png");

// Conditional loadSignature for custom loaders
static final LazyObject index_html = 
    LazyObject("assets/web/index.html", loadSignature: "www");

// Smart class inheritance based on configuration
class ImagesAssets extends PVAssetProvider {  // provider: true
  ImagesAssets() : super("assets/images");
}

class WebAssets extends PVAssetMap {          // provider: false
  // LazyObject instances for objectmap: true
}
```

## 🧪 Testing Different Scenarios

### Test Individual Loaders
```bash
# Test the custom loaders directly
flutter test
```

### Test Build Process
```bash
# Clean build
dart run build_runner clean
dart run build_runner build

# Watch mode
dart run build_runner watch
```

### CLI Tool Testing
```bash
# Manual build with CLI tool
cd ../pv_assetbuilder
dart run bin/pvasbuild.dart ../pv_assetbuilder_test --verbose

# Watch mode
dart run bin/pvasbuild.dart ../pv_assetbuilder_test --watch
```

## 📊 What You'll See

After running the demo app:

1. **Custom Image Loading**: Enhanced caching and error handling
2. **Web Content Processing**: Minified CSS, validated JS, processed HTML
3. **Config Parsing**: JSON and YAML files parsed with validation
4. **Test Asset Handling**: Path-matched assets with metadata
5. **Data Processing**: CSV parsed to records, Markdown analyzed

## 🎨 Asset Types Included

| Type | Files | Custom Loader | Features |
|------|-------|---------------|----------|
| **Images** | `logo.png` | `custom_loaders:loadCachedImage` | Caching, optimization, error handling |
| **Web** | `index.html`, `styles.css`, `app.js` | `web_loaders:loadWebContent` | Minification, validation, processing |
| **Config** | `app.json`, `theme.yaml` | `config_loaders:parseConfig` | Parsing, validation, type conversion |
| **Test** | `sample_data.txt` | `test_loaders:loadTestAsset` | Path matching, metadata, classification |
| **Data** | `sample.csv`, `readme.md` | `data_loaders:loadDataFile` | CSV parsing, markdown analysis |

## 🚀 Advanced Usage

### Adding New Asset Types

1. **Create Custom Loader**
   ```dart
   // lib/loaders/my_custom_loader.dart
   MyAssetType loadMyAsset(String assetPath) {
     // Custom loading logic
   }
   ```

2. **Update build.yaml**
   ```yaml
   signature:
     my_type:
       match_via:
         extension: ['.myext']
       loader: my_custom_loader:loadMyAsset
   ```

3. **Rebuild**
   ```bash
   dart run build_runner build
   ```

### Override Default Behavior

```yaml
signature:
  image:  # Override default image loading
    loader: my_loaders:myImageLoader
```

## 🔍 Troubleshooting

### Common Issues

1. **"Asset not found"**: Ensure assets are in `pubspec.yaml` and files exist
2. **"Custom method not found"**: Check import paths and method names
3. **"Build failed"**: Run `dart run build_runner clean` then rebuild

### Debug Tips

- Use `--verbose` flag with CLI tool for detailed output
- Check generated files in `lib/generated/`
- Look at console output during asset loading tests

## 🌟 Revolutionary Features Demonstrated

- ✅ **Custom Load Methods**: Override defaults or create new asset types
- ✅ **Smart Method Resolution**: Automatic discovery and import generation  
- ✅ **Flexible Matching**: Path patterns, extensions, custom functions
- ✅ **Type Safety**: Compile-time asset verification with custom loaders
- ✅ **Performance**: Lazy loading with intelligent caching strategies
- ✅ **Hot Reload Support**: Custom loaders work with Flutter development
- ✅ **Modular Design**: Clean separation of loader logic
- ✅ **Cross-Platform**: Windows/Unix path handling
- ✅ **Production Ready**: Error-free compilation and comprehensive testing

## 📚 Next Steps

1. Explore the generated `lib/generated/assets.g.dart` file
2. Try adding your own custom asset types
3. Experiment with different matching strategies
4. Check out the CLI tool features
5. Integrate into your own Flutter projects

---

**🎉 This demonstrates the revolutionary custom load method system that transforms Flutter asset management!**

## 🚀 System Achievements

This example proves that PV Asset Builder delivers:

- **🔥 Unlimited Extensibility**: Any file type can become a custom-loaded asset
- **⚡ Smart Automation**: Automatic method discovery and import generation
- **🛡️ Type Safety**: Full compile-time checking with custom loaders
- **🎯 Production Quality**: Error-free builds and comprehensive testing
- **🔧 Developer Experience**: Hot reload, IntelliSense, and clean generated code

For more information and the complete source code, visit the [Pathverse Flutter Gloveboxes](https://github.com/Pathverse/flutter_gloveboxes) repository.
