# PVCache Secrets

Adds secure storage backend support to [pvcache](https://pub.dev/packages/pvcache) using [flutter_secure_storage](https://pub.dev/packages/flutter_secure_storage).

## Features

- Encrypted storage backend for PVCache
- Cross-platform secure storage (Keychain/Keystore)
- Flutter web compatible

## Installation

```yaml
dependencies:
  pvcache_secrets: ^0.0.1
  pvcache: ^0.0.3
```

## Usage

```dart
import 'package:pvcache/pvcache.dart';
import 'package:pvcache_secrets/pvcache_secrets.dart';

// Setup encrypted cache
PVCACHE.createEncrypted(env: "secure-cache");

// Use the cache instance
final cache = PVCache(env: "secure-cache");
await cache.set('api_key', 'secret-value');
final value = await cache.get('api_key');
```

Run example: `flutter run -d chrome example/example.dart`

## Links

- [GitHub Repository](https://github.com/Pathverse/flutter_gloveboxes)
- [PVCache Documentation](https://pub.dev/packages/pvcache)
