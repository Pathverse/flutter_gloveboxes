# pvcache_hive

Hive database integration for pvcache, providing persistent local storage with multiple storage patterns and image caching support.

## Quick Start

```dart
import 'package:pvcache_hive/pvcache_hive.dart';

// Create a standard Hive cache
final cache = PVCACHE.createStdHive(env: "my_app");

// Basic operations
await cache.set('user', {'name': 'Alice', 'age': 28});
final user = await cache.get('user');
await cache.delete('user');
```

## Storage Options

### Standard Storage with Metadata
```dart
final cache = PVCACHE.createStdHive(
  env: "user_data",
  metaboxName: "user_meta",
);
```

### Image Caching
```dart
final imageCache = PVCACHE.createImageHive(env: "images");
final imageHelper = ImageHiveHelper(imageCache);

// Cache network images automatically
final image = await imageHelper.network('https://example.com/image.jpg');
```

### Custom Data with TTL
```dart
await cache.set('temp_data', {'key': 'value'}, metadata: {'ttl': 3600});
```

## Storage Templates

- **SimpleHive**: Basic Hive box wrapper
- **LiteHive**: PVCo-serialized storage  
- **StdBox**: Advanced storage with metadata support

## Examples

See `/example` folder for complete working examples:
- Basic user data caching
- Miscellaneous data types
- Network image caching

## Dependencies

- `hive_ce: >=2.11.0 <3.0.0`
- `pvcache: >=0.0.4 <1.0.0`
