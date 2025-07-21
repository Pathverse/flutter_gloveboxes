# PV Asset Builder

**Build-time package for generating custom asset loaders with anonymous class architecture and package forwarding.**

## 🛠️ What It Does

- **Scans Assets**: Discovers all project assets automatically
- **Generates Code**: Creates anonymous collision-free classes
- **Resolves Methods**: Finds and imports your custom loaders
- **Package Support**: Handles external package asset forwarding
- **Build Integration**: Works seamlessly with `build_runner`

## 📦 Installation

```yaml
# pubspec.yaml
dev_dependencies:
  pv_assetbuilder: ^1.0.0
  build_runner: ^2.4.0
```

## ⚙️ Configuration

```yaml
# pv_asset_config.yaml

# Enable package forwarding (for package creators)
forward_to_package: true

# Asset generation rules
pv_assetprovider:
  target: lib/generated
  custom:
    - path: assets/images
      provider: true
      objectmap: false
    - path: assets/config
      provider: true  
      objectmap: true

# Custom loader signatures
signature:
  image: custom_loaders:loadCachedImage
  config:
    match_via:
      extension: ['json', 'yaml']
    loader: config_loaders:parseConfig
  web:
    match_via:
      path: "assets/web/**"
    loader: web_loaders:loadWebContent
```

## 🏗️ Generated Output

**Anonymous Classes** (collision-free):
```dart
// lib/generated/pap.dart
class i697774904 extends PVAssetProvider {
  i697774904() : super("assets");
  final i965776908 config = i965776908();
}

class i965776908 extends PVAssetProvider {
  i965776908() : super("assets/config");
  final LazyObject app_json = LazyObject("assets/config/app.json", loadSignature: "config");
}

final IAssetMap AssetMap = IAssetMap();

void initializePVAssets() {
  LazyObjectConfig.defaultTypeLoaders["image"] = customloaders.loadCachedImage;
  LazyObjectConfig.defaultTypeLoaders["config"] = configloaders.parseConfig;
}
```

**With Package Forwarding**:
```dart
// When forward_to_package: true
final LazyObject app_json = LazyObject("packages/my_package/assets/config/app.json", loadSignature: "config");
```

## 🚀 Usage

### With Build Runner
```bash
# Generate assets
dart run build_runner build

# Watch mode
dart run build_runner watch

# Clean rebuild
dart run build_runner clean && dart run build_runner build
```

### CLI Tool
```bash
# Direct build
dart run pv_assetbuilder:pvasbuild

# With options
dart run pv_assetbuilder:pvasbuild . --verbose
```

## 📁 Loader Structure

```
lib/
├── loaders/                    # Your custom loaders
│   ├── custom_loaders.dart     # Image generation
│   ├── config_loaders.dart     # JSON/YAML parsing
│   └── web_loaders.dart        # HTML/CSS processing
├── generated/                  # Generated code
│   ├── pap.dart               # Anonymous asset classes
│   └── assets.md              # Documentation
└── main.dart                   # Your app
```

## 🎯 Key Features

### Smart Method Resolution
- Automatically finds loader files in multiple locations
- Generates proper imports with aliases
- Cross-platform path handling
- Validates method accessibility

### Anonymous Class Generation  
- Hash-based naming prevents collisions
- Public visibility with clean navigation
- Consistent `final` declarations
- Nested directory support

### Package Forwarding
- Reads package name from `pubspec.yaml`
- Automatically prefixes all asset paths
- Perfect for creating consumable packages
- Zero configuration for package creators

### Extension Handling
- Supports both `.ext` and `ext` formats
- Internal normalization for consistency
- Flexible configuration options
- Reliable matching logic

## 🔧 Build Integration

```yaml
# build.yaml (auto-generated)
builders:
  pv_assetbuilder:
    import: "package:pv_assetbuilder/lib.dart"
    builder_factories: ["pvAssetBuilder"]
    build_extensions:
      "$lib$": ["generated/pap.dart", "generated/assets.md"]
    build_to: source
```

## 📊 Statistics

The builder generates detailed statistics:
- Total assets processed
- Directories scanned
- Custom signatures applied
- Build time and performance metrics

**Transform your asset workflow with intelligent code generation!** ⚡
