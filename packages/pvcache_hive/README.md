# pvcache_hive

Hive database integration for pvcache, providing persistent local storage with modern AES encryption, multiple storage patterns, and image caching capabilities.

## Features

- 🔐 **Modern AES Encryption**: AES-256-CTR with deterministic IV generation using PointyCastle
- ⚡ **Lite Mode**: Optional performance-optimized encryption for high-throughput scenarios
- 📦 **Multiple Storage Templates**: Choose the right storage pattern for your needs
- 🖼️ **Image Caching**: Specialized support for network image caching
- ⏰ **TTL Support**: Time-based expiration with metadata storage
- 🔄 **Type Safety**: Generic implementations with compile-time type checking
- 🌐 **Cross-Platform**: Consistent encryption behavior on Web, Desktop, and Mobile
- 🛡️ **Decryption Error Handling**: Configurable strategies for handling corrupted data

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

## Modern Encrypted Storage Setup

For production applications, use the new AES encryption system with secure key management:

```dart
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:hive_ce/hive.dart';
import 'package:pvcache/pvcache.dart';
import 'package:pvcache/templates/adapters/expiry.dart';
import 'package:pvcache_hive/pvcache_hive.dart';

PVCache? _encryptedCache;
PVCache? _ctxCache;
PVCache? _loggingCache;
PVCache? _lessonsCache;
PVCache? _dataCache;

// Getters that throw if not initialized
PVCache get encryptedCache =>
    _encryptedCache ?? (throw StateError('Cache not initialized'));
PVCache get ctxCache =>
    _ctxCache ?? (throw StateError('Cache not initialized'));
PVCache get loggingCache =>
    _loggingCache ?? (throw StateError('Cache not initialized'));
PVCache get lessonsCache =>
    _lessonsCache ?? (throw StateError('Cache not initialized'));
PVCache get dataCache =>
    _dataCache ?? (throw StateError('Cache not initialized'));

bool _isInitialized = false;

Future<void> initializePVCache() async {
  if (_isInitialized) return;

  // 1. Create encrypted cache for key storage
  PVCACHE.createEncrypted();
  _encryptedCache = PVCache(env: "encrypted");

  // 2. Setup AES encryption with automatic key generation
  if (!kDebugMode || assumeEncryption) {
    await PVCACHE.setupDependentAESEncryption(
      encryptedCache,
      "hive_key",
      () async {
        // Generate secure random key using Hive's built-in method
        final key = Hive.generateSecureKey();
        final keyAsString = base64UrlEncode(key);
        return keyAsString;
      },
    );
  }

  // 3. Create caches with encryption and error handling
  final expiryAdapter = ExpiryAdapter();
  
  _lessonsCache = PVCACHE.createStdHive(
    env: "lessons",
    decryptionErrorStrategy: 3, // Strategy for handling corrupted data
    adapters: [expiryAdapter],
  );
  
  _dataCache = PVCACHE.createStdHive(
    env: "data",
    decryptionErrorStrategy: 3,
    adapters: [expiryAdapter],
  );
  
  _ctxCache = PVCACHE.createStdHive(
    env: "ctx",
    decryptionErrorStrategy: 3,
    adapters: [expiryAdapter],
  );
  
  _loggingCache = PVCACHE.createStdHive(
    env: "logging",
    decryptionErrorStrategy: 3,
    adapters: [],
  );

  _isInitialized = true;
}

// Usage with modern encryption
Future<void> example() async {
  await initializePVCache();
  
  // All data is automatically encrypted with AES-256-CTR
  await dataCache.set('profile', {
    'name': 'Alice',
    'email': 'alice@example.com',
    'preferences': {'theme': 'dark'}
  });
  
  // Data with expiration (automatically encrypted)
  await ctxCache.set(
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

## Encryption Modes

### Full Security Mode (Default)
- Uses deterministic IV generation based on content + seed
- Each unique data generates a unique IV for maximum security
- Best for sensitive data where security is paramount

### Lite Mode
- Uses static IV generation based on seed only
- Significantly faster encryption/decryption operations
- Suitable for high-throughput scenarios where performance matters

```dart
// Enable lite mode for better performance
PVCACHE.setupHiveEncryption(
  useDefault: false,
  seed: "my-secure-seed-2024",
  liteMode: true, // Enable lite mode
);
```

## Encryption Features

### AES-256-CTR Encryption
- **Algorithm**: AES-256 in Counter (CTR) mode using PointyCastle
- **Key Derivation**: SHA-256 hash of seed string produces consistent 32-byte keys
- **IV Generation**: Deterministic (content-based) or static (lite mode)
- **Cross-Platform**: Identical encryption behavior on all platforms

### Automatic JSON Encryption
All PVCo objects automatically encrypt their JSON representation when an encryptor is configured:

```dart
// Data is automatically encrypted before storage using AES-256-CTR
await cache.set('secret', {'password': 'super_secret_123'});

// Data is automatically decrypted on retrieval
final secret = await cache.get('secret');
```

### Direct Encryption Utilities
```dart
import 'package:pvcache_hive/templates/ciphers/aes.dart';

// Create encryptor with your seed
final encryptor = PVAesEncryptor("my-secure-seed-2024");

// Direct string encryption
final encrypted = encryptor.encryptString("sensitive data");
final decrypted = encryptor.decryptString(encrypted);

// Lite mode for better performance
final liteEncryptor = PVAesEncryptor("my-seed", liteMode: true);
final fastEncrypted = liteEncryptor.encryptString("data");
```

### Decryption Error Handling
Configure how the system handles corrupted or undecryptable data:

```dart
final cache = PVCACHE.createStdHive(
  env: "my_env",
  decryptionErrorStrategy: 3, // Strategy options:
  // 1: Log error and return null
  // 2: Clear corrupted data and retry
  // 3: Reset entire cache on corruption (recommended)
);
```

## Examples

See `/example` folder for complete working examples:
- **example.dart**: Basic user data caching with TTL
- **example2.dart**: Miscellaneous data types with encryption
- **example3.dart**: Network image caching demonstration

## Security Best Practices

1. **Key Management**: Use `setupDependentAESEncryption()` for secure key generation and storage
2. **Environment Separation**: Use different cache environments for different data types
3. **Error Strategies**: Configure appropriate decryption error strategies for your use case
4. **Mode Selection**: Use full security mode for sensitive data, lite mode for performance-critical scenarios
5. **Seed Security**: Ensure encryption seeds are stored securely and not hardcoded

## Performance Considerations

### When to Use Lite Mode
- High-frequency cache operations (> 1000 ops/sec)
- Large data sets requiring fast serialization
- Non-sensitive data where performance > security
- Development/testing environments

### When to Use Full Security Mode
- Financial or personal data
- Authentication tokens and credentials  
- Production environments with sensitive information
- Long-term data storage

## Architecture Changes (v0.3.0+)

**BREAKING CHANGES**: Version 0.3.0+ replaces Hive's unreliable `HiveCipher` with a custom PointyCastle-based solution:

- ✅ **Reliable**: No more platform-specific encryption issues
- ✅ **Consistent**: Identical behavior across Web, Desktop, and Mobile
- ✅ **Testable**: Comprehensive unit test coverage  
- ✅ **Debuggable**: Clear error messages instead of cryptic failures
- ✅ **Configurable**: Choose between security and performance modes

## Dependencies

- `hive_ce: ">=2.11.0 <3.0.0"`
- `pvcache: ">=0.0.4 <1.0.0"`
- `pointycastle: "^3.7.3"` (for reliable encryption)
