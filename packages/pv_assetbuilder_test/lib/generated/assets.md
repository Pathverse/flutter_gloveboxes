# Generated Asset Documentation

This file contains generated asset mappings for your project.

## Statistics
- **Total Assets**: 17
- **Total Directories**: 10

## Assets by Signature
- **default**: 4 assets
- **web**: 6 assets
- **config**: 4 assets
- **data**: 3 assets

## Usage Examples

```dart
// Access asset: logo.png
Widget widget = AssetMap.assets.logo_png.value;
```

## Custom Signatures

This project uses custom asset loading signatures:
- **image**: 
  - Loader: `custom_loaders:loadCachedImage`
- **web**: 
  - Loader: `web_loaders:loadWebContent`
  - Extensions: [.html, .css, .js]
- **config**: 
  - Loader: `config_loaders:parseConfig`
  - Extensions: [.json, .yaml, .yml]
- **test_assets**: 
  - Loader: `test_loaders:loadTestAsset`
  - Path Pattern: `assets/test/**`
- **data**: 
  - Loader: `data_loaders:loadDataFile`
  - Extensions: [.csv, .txt, .md]

