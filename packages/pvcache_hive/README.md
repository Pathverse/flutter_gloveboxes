# pvcache_hive

Hive database integration for pvcache, providing persistent local storage with encryption support, multiple storage patterns, and image caching capabilities.

## Features

- 🔐 **Built-in Encryption**: AES-256 encryption with secure key management
- 📦 **Multiple Storage Templates**: Choose the right storage pattern for your needs
- 🖼️ **Image Caching**: Specialized support for network image caching
- ⏰ **TTL Support**: Time-based expiration with metadata storage
- 🔄 **Type Safety**: Generic implementations with compile-time type checking
- 🌐 **Cross-Platform**: Web, Desktop, and Mobile support

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

## Encrypted Storage Setup

For production applications, use encrypted storage with secure key management:

```dart
import 'dart:convert';
import 'dart:typed_data';
import 'package:hive_ce/hive.dart';
import 'package:pvcache/pvcache.dart';
import 'package:pvcache/templates/adapters/expiry.dart';
import 'package:pvcache_hive/pvcache_hive.dart';
import 'package:pvcache_hive/src/hboxcore.dart' as hboxcore;
import 'dart:math' as math;

late final PVCache encryptedCache;
late final PVCache userCache;
late final PVCache dataCache;
late final PVCache loggingCache;

Future<void> initializePVCache() async {
  // 1. Create encrypted cache for key storage
  PVCACHE.createEncrypted();
  encryptedCache = PVCache(env: "encrypted");

  // 2. Generate or retrieve encryption key
  late final Uint8List encryptionKey;
  if (!await encryptedCache.exists("hive_key")) {
    // Create a random 32-byte (256-bit) key
    encryptionKey = Uint8List.fromList(
      List<int>.generate(32, (i) => math.Random().nextInt(256)),
    );
    await encryptedCache.set("hive_key", jsonEncode(encryptionKey));
  } else {
    final keyStr = await encryptedCache.get("hive_key") as String;
    encryptionKey = Uint8List.fromList(
      (jsonDecode(keyStr) as List).cast<int>()
    );
    if (encryptionKey.length != 32) {
      throw Exception("Invalid encryption key length");
    }
  }

  // 3. Set up Hive encryption (must be done before any cache operations)
  final cipher = HiveAesCipher(encryptionKey);
  hboxcore.setHiveCipher(cipher);

  // 4. Create encrypted caches with TTL support
  final expiryAdapter = ExpiryAdapter();
  
  userCache = PVCACHE.createStdHive(
    env: "users",
    adapters: [expiryAdapter],
  );
  
  dataCache = PVCACHE.createStdHive(
    env: "data", 
    adapters: [expiryAdapter]
  );
  
  loggingCache = PVCACHE.createStdHive(
    env: "logging",
    adapters: const []
  );
}

// Usage with encryption
Future<void> example() async {
  await initializePVCache();
  
  // All data is automatically encrypted
  await userCache.set('profile', {
    'name': 'Alice',
    'email': 'alice@example.com',
    'preferences': {'theme': 'dark'}
  });
  
  // Data with expiration
  await dataCache.set(
    'session_token', 
    'abc123xyz', 
    metadata: {'ttl': 3600} // Expires in 1 hour
  );
}
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

- **SimpleHive**: Basic Hive box wrapper for simple key-value storage
- **LiteHive**: PVCo-serialized storage with automatic type handling
- **StdBox**: Advanced storage with metadata support and TTL capabilities

## Encryption Features

### String Encryption Utilities
```dart
import 'package:pvcache_hive/src/hboxcore.dart' as hboxcore;

// Direct string encryption (requires HiveCipher to be set)
final encrypted = hboxcore.encryptString("sensitive data");
final decrypted = hboxcore.decryptString(encrypted);
```

### Automatic JSON Encryption
All PVCo objects automatically encrypt their JSON representation when a HiveCipher is configured:

```dart
// Data is automatically encrypted before storage
await cache.set('secret', {'password': 'super_secret_123'});

// Data is automatically decrypted on retrieval
final secret = await cache.get('secret');
```

## Examples

See `/example` folder for complete working examples:
- **example.dart**: Basic user data caching with TTL
- **example2.dart**: Miscellaneous data types with encryption
- **example3.dart**: Network image caching demonstration

## Security Best Practices

1. **Key Storage**: Store encryption keys securely using pvcache_secrets or platform keychain
2. **Key Rotation**: Regenerate encryption keys periodically for enhanced security
3. **TTL Usage**: Use expiration metadata for sensitive temporary data
4. **Environment Separation**: Use different environments for different data types

## Dependencies

- `hive_ce: ">=2.11.0 <3.0.0"`
- `pvcache: ">=0.0.4 <1.0.0"`
