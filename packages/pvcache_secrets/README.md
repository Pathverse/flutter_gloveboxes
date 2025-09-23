# PVCache Secrets

Adds secure storage backend support to [pvcache](https://pub.dev/packages/pvcache) using [flutter_secure_storage](https://pub.dev/packages/flutter_secure_storage).

## Features

- Encrypted storage backend for PVCache
- Cross-platform secure storage (Keychain/Keystore)
- TTL/expiry support with metadata storage
- Flutter web compatible

## Installation

```yaml
dependencies:
  pvcache_secrets: ^0.0.1
  pvcache: ^0.0.3
```

## Usage

### Basic Encrypted Storage
```dart
import 'package:pvcache/pvcache.dart';
import 'package:pvcache_secrets/pvcache_secrets.dart';

PVCACHE.createEncrypted(env: "secure-cache");
final cache = PVCache(env: "secure-cache");
await cache.set('api_key', 'secret-value');
```

### With TTL Support
```dart
import 'package:pvcache/templates/adapters/expiry.dart';

PVCACHE.createLimitedEncryptedWithMeta(
  env: "secure-expiry-cache", 
  adapters: [ExpiryAdapter()]
);
final cache = PVCache(env: "secure-expiry-cache");
await cache.set('temp_token', 'value', metadata: {"ttl": 60});
```

## Examples

- Basic: `flutter run -d chrome example/example.dart`
- TTL: `flutter run -d chrome example/example_expiry.dart`

## Links

- [GitHub Repository](https://github.com/Pathverse/flutter_gloveboxes)
- [PVCache Documentation](https://pub.dev/packages/pvcache)
