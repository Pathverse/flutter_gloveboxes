# PV Cache

A sophisticated Flutter caching package that provides an abstract layer for secure, flexible, and feature-rich data caching with support for encryption, expiry, sensitive data handling, and LRU/LFU eviction strategies.

## Features

- 🔒 **Encrypted Storage**: Secure sensitive data with automatic encryption
- ⏰ **Expiry Management**: Set lifetimes for cache entries with automatic cleanup
- 🔑 **Sensitive Data Protection**: Protect specific JSON fields with dependency-based encryption
- 🗂️ **LRU/LFU Eviction**: Intelligent cache size management with configurable strategies
- 📦 **JSON Support**: Seamless storage and retrieval of complex data structures
- 🎯 **Type Safety**: Generic methods with type safety for better development experience
- 🏷️ **Grouping**: Organize cache entries into logical groups
- 📱 **Cross-Platform**: Works on iOS, Android, and Web

## Installation

Add `pv_cache` to your `pubspec.yaml`:

```yaml
dependencies:
  pv_cache: ^0.0.1
```

Then run:

```bash
flutter pub get
```

## Quick Start

### Basic Usage

```dart
import 'package:pv_cache/lib.dart';

// Initialize cache
final cache = await PVCache.getInstance();

// Store simple values
await cache.putWithOptions('user_name', 'John Doe');
final name = await cache.getWithOptions<String>('user_name');

// Store JSON objects
final userData = {
  'name': 'John Doe',
  'age': 30,
  'email': 'john@example.com'
};
await cache.putWithOptions('user_profile', userData);
final profile = await cache.getWithOptions<Map<String, dynamic>>('user_profile');
```

### Advanced Features

#### Encrypted Storage

```dart
// Store encrypted data
await cache.putWithOptions(
  'secret_token',
  'super_secret_api_key',
  options: const CacheOptions(encrypted: true),
);

// Retrieve encrypted data
final token = await cache.getWithOptions<String>(
  'secret_token',
  options: const CacheOptions(encrypted: true),
);
```

#### Expiring Cache Entries

```dart
// Store data that expires in 60 seconds
await cache.putWithOptions(
  'session_data',
  sessionInfo,
  options: const CacheOptions(lifetime: 60),
);
```

#### Sensitive JSON Fields

```dart
// Store JSON with encrypted sensitive fields
final userCredentials = {
  'username': 'john_doe',
  'email': 'john@example.com',
  'password': 'secret123',
  'apiKey': 'sk_live_123456789'
};

// First, create a master key for encryption
await cache.putWithOptions(
  'master_key',
  'encryption_key_value',
  options: const CacheOptions(encrypted: true),
);

// Store with sensitive field protection
await cache.putWithOptions(
  'user_credentials',
  userCredentials,
  options: const CacheOptions(
    sensitive: ['password', 'apiKey'],
    depends: 'master_key',
  ),
);

// Retrieve with same options
final credentials = await cache.getWithOptions<Map<String, dynamic>>(
  'user_credentials',
  options: const CacheOptions(
    sensitive: ['password', 'apiKey'],
    depends: 'master_key',
  ),
);
```

#### LRU/LFU Cache Management

```dart
// Enable LRU (Least Recently Used) eviction
await cache.putWithOptions(
  'cached_item',
  'frequently_accessed_data',
  options: const CacheOptions(lru: true),
);

// Enable LFU (Least Frequently Used) with size limit
await cache.putWithOptions(
  'cached_item',
  'size_managed_data',
  options: const CacheOptions(lru: true, lruInCount: 100),
);
```

## API Reference

### PVCache Class

#### Core Methods

- `getInstance({bool debug = false})` - Get singleton cache instance
- `putWithOptions(String key, dynamic value, {CacheOptions? options})` - Store data with options
- `getWithOptions<T>(String key, {CacheOptions? options})` - Retrieve typed data
- `deleteWithOptions(String key, {CacheOptions? options})` - Delete entry
- `containsKeyWithOptions(String key, {CacheOptions? options})` - Check existence
- `getAllKeys()` - Get all cache keys
- `clear()` - Clear all cache data

#### Legacy JSON Methods

- `putJson(String key, dynamic value)` - Store JSON data
- `getJson<T>(String key, {T? defaultValue})` - Retrieve typed JSON
- `getJsonMap(String key)` - Get JSON as Map
- `getJsonList(String key)` - Get JSON as List

### CacheOptions Class

Configure cache behavior with these options:

```dart
const CacheOptions({
  String? group,           // Group for organizing entries
  List<String>? sensitive, // Sensitive field patterns
  String? depends,         // Dependency key for sensitive data
  int? lifetime,           // Expiry time in seconds
  bool? lru,              // Enable LRU/LFU eviction
  int? lruInCount,        // Size limit for LFU strategy
  bool encrypted = false, // Enable encryption
});
```

#### Option Rules

1. **Sensitive Data**: If `sensitive` is specified, `depends` must also be provided
2. **Encryption**: `encrypted` cannot be used with `sensitive` or `depends`
3. **Eviction**: `lru` and `lifetime` are mutually exclusive
4. **LFU Strategy**: `lruInCount` only applies when `lru` is true

## Examples

### User Session Management

```dart
class SessionManager {
  final PVCache cache;
  
  SessionManager(this.cache);
  
  Future<void> storeSession(Map<String, dynamic> session) async {
    // Session expires in 30 minutes
    await cache.putWithOptions(
      'user_session',
      session,
      options: const CacheOptions(lifetime: 1800),
    );
  }
  
  Future<Map<String, dynamic>?> getSession() async {
    return await cache.getWithOptions<Map<String, dynamic>>('user_session');
  }
}
```

### API Token Cache

```dart
class TokenCache {
  final PVCache cache;
  
  TokenCache(this.cache);
  
  Future<void> storeTokens(String accessToken, String refreshToken) async {
    // Store encrypted tokens
    await cache.putWithOptions(
      'access_token',
      accessToken,
      options: const CacheOptions(encrypted: true, lifetime: 3600),
    );
    
    await cache.putWithOptions(
      'refresh_token',
      refreshToken,
      options: const CacheOptions(encrypted: true, lifetime: 86400),
    );
  }
}
```

### Cached API Responses

```dart
class ApiCache {
  final PVCache cache;
  
  ApiCache(this.cache);
  
  Future<void> cacheResponse(String endpoint, Map<String, dynamic> data) async {
    // Cache with LRU eviction, max 50 entries
    await cache.putWithOptions(
      'api_$endpoint',
      data,
      options: const CacheOptions(
        lru: true,
        lruInCount: 50,
        group: 'api_responses',
      ),
    );
  }
}
```

## Testing

The package includes comprehensive tests covering:

- Basic CRUD operations
- JSON data handling
- Encryption functionality
- Expiry mechanisms
- LRU/LFU eviction
- Sensitive data protection
- Error handling

Run tests with:

```bash
flutter test
```

## Visual Testing

An example app is included that demonstrates all cache features with a visual interface. Run it with:

```bash
cd example
flutter run
```

The example app provides:
- Interactive cache operations
- Preset configurations for different use cases
- Real-time cache state visualization
- Comprehensive behavior testing

## Dependencies

- `hive_ce`: ^2.11.3 - Local storage engine
- `flutter_secure_storage`: ^9.2.4 - Secure storage for encryption keys
- `webcrypto`: ^0.5.3 - Cryptographic operations
- `crypto`: ^3.0.3 - Hash and crypto utilities

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## Support

For issues, questions, or contributions, please visit the [GitHub repository](https://github.com/Pathverse/flutter_gloveboxes).
