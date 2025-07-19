
# Example

```dart
@PVAssetProvider
const map = PVAssetMap();
```

after build
if i have a configuration of build.yaml like the following
```yaml
pvasbuild:
    paths:
        - path: assets/images
          file: true
        - path: assets/*/xx.png

```

suppose path map
```
- assets
    - images
        - logo.png

    - test
        - xx.png
    - test2
        - xx.png
```

by running the tool pvasbuild, it will populate the asset mapping to pubspec.yaml

then
it will also generate a class that fills the lazy objects by path

```dart
map.assets.images.logo_png // LazyObject("assets/images/logo.png")
map.assets.test.xx_png // LazyObject("assets/test/xx.png")
map.assets.test2.xx_png // LazyObject("assets/test2/xx.png")
```