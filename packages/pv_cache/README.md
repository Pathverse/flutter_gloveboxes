# PV Cache

A modern Flutter caching package with a multi-environment architecture and specialized storage types for different caching needs. Built on Hive with support for web, mobile, and desktop platforms.

## Features

- 🌍 **Multi-Environment Architecture**: Isolated environments with `{env}:{key}` format
- ⏰ **Time-Based Expiry**: Automatic cleanup of expired entries  
- 🗂️ **LRU/LFU Eviction**: Smart memory management with access tracking
- 🔒 **Encrypted Storage**: Secure data with automatic encryption/decryption
- 🧩 **Fragment Caching**: Break large objects into independently cacheable pieces
- 🚀 **Performance Optimized**: Lazy loading and efficient cache miss handling
- 📱 **Cross-Platform**: Web, iOS, Android, and Desktop support

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

```dart
import 'package:pv_cache/pv_cache.dart';

// 1. Set up environments with different storage types
await PVCache.setEnv('default', SimpleExpiry());
await PVCache.setEnv('memory', SimpleLRU(maxSize: 100));

// 2. Initialize the cache system
await PVCache.init();

// 3. Use the cache
await PVCache.set('user_name', 'John Doe');
await PVCache.set('memory:session', {'token': 'abc123'});

final name = await PVCache.get('user_name');
final session = await PVCache.get('memory:session');
```

## Storage Types

PV Cache provides 5 specialized storage types, each optimized for different use cases:

### 1. SimpleExpiry - Time-Based Cache

**Best for**: Session data, API responses, temporary data

```dart
// Set up expiry-based caching
await PVCache.setEnv('sessions', SimpleExpiry());

// Store data with expiry time
await PVCache.set(
  'sessions:user_token',
  'abc123',
  metadata: {'expiry': DateTime.now().add(Duration(hours: 1)).toIso8601String()},
);

// Data automatically expires and gets cleaned up
final token = await PVCache.get('sessions:user_token'); // null after 1 hour
```

**Features:**
- Automatic expiry checking on every access
- Physical cleanup of expired entries
- ISO8601 timestamp format in metadata
- No size limits

### 2. SimpleLRU - Least Recently Used

**Best for**: Fixed-size caches, frequently accessed data

```dart
// Set up LRU cache with size limit
await PVCache.setEnv('memory', SimpleLRU(maxSize: 50));

// Store data - oldest accessed items get evicted when full
await PVCache.set('memory:user_1', userData1);
await PVCache.set('memory:user_2', userData2);
// ... 50 items ...
await PVCache.set('memory:user_51', userData51); // user_1 gets evicted

// Access updates the "recently used" status
final user2 = await PVCache.get('memory:user_2'); // Moves user_2 to front
```

**Features:**
- Fixed maximum size with automatic eviction
- Access time tracking persists across app restarts
- Most recently accessed items stay in cache
- Perfect for user profiles, API responses

### 3. SimpleLFU - Least Frequently Used

**Best for**: Popular content caching, analytics data

```dart
// Set up LFU cache with size limit
await PVCache.setEnv('popular', SimpleLFU(maxSize: 30));

// Store data - least frequently accessed items get evicted
await PVCache.set('popular:article_1', articleData);
await PVCache.get('popular:article_1'); // access count: 1
await PVCache.get('popular:article_1'); // access count: 2
await PVCache.get('popular:article_1'); // access count: 3

// Frequently accessed items stay in cache longer
```

**Features:**
- Tracks access frequency, not just recency
- Keeps popular content in cache
- Frequency counts persist across app restarts
- Ideal for content recommendation systems

### 4. Encrypted - Secure Storage

**Best for**: API keys, tokens, sensitive user data

```dart
// Set up encrypted storage
await PVCache.setEnv('secure', Encrypted());

// Data is automatically encrypted before storage
await PVCache.set('secure:api_key', 'sk_live_1234567890');
await PVCache.set('secure:user_credentials', {
  'username': 'john_doe',
  'password': 'secure_password',
});

// Data is automatically decrypted on retrieval
final apiKey = await PVCache.get('secure:api_key');
final credentials = await PVCache.get('secure:user_credentials');
```

**Features:**
- Automatic encryption/decryption using Flutter Secure Storage
- Supports expiry with encrypted metadata
- Works with any JSON-serializable data
- Cross-platform secure storage

### 5. AdvancedFragment - Hierarchical Caching

**Best for**: Large objects, API responses with related data, game worlds

```dart
// Define how data should be fragmented
final fragmentConfigs = [
  FragmentConfig(
    name: "game_world",
    path: "/",
    callback: fetchGameWorld,
    fragments: ["game_world/region_1", "game_world/region_2"],
  ),
  FragmentConfig(
    name: "region_1", 
    path: "game_world/region_1", 
    callback: fetchRegion1
  ),
  FragmentConfig(
    name: "region_2", 
    path: "game_world/region_2", 
    callback: fetchRegion2
  ),
];

await PVCache.setEnv('game', AdvancedFragment(fragmentConfigs: fragmentConfigs));

// Accessing main data triggers callback and creates fragments
final world = await PVCache.get('game:game_world'); 
// Returns: {'region_1': '@fragment:region_1', 'region_2': '@fragment:region_2'}

// Access individual fragments directly (no callback needed)
final region1 = await PVCache.get('game:region_1'); // Actual region data
final region2 = await PVCache.get('game:region_2'); // Actual region data
```

**Features:**
- Breaks large objects into independently cacheable pieces
- Callback-based loading only on cache miss
- Each fragment can be accessed directly
- Reduces memory usage for large data structures
- Perfect for hierarchical data (game worlds, user profiles, etc.)

## Complete Examples

### Multi-Environment Setup

```dart
import 'package:pv_cache/pv_cache.dart';

Future<void> setupCache() async {
  // Different storage types for different needs
  await PVCache.setEnv('default', SimpleExpiry());           // General cache with expiry
  await PVCache.setEnv('memory', SimpleLRU(maxSize: 100));   // Fixed-size memory cache  
  await PVCache.setEnv('popular', SimpleLFU(maxSize: 50));   // Popular content cache
  await PVCache.setEnv('secure', Encrypted());              // Sensitive data
  
  await PVCache.init();
}

Future<void> useCache() async {
  // Store user session (expires automatically)
  await PVCache.set(
    'default:user_session',
    {'userId': 123, 'token': 'abc'},
    metadata: {'expiry': DateTime.now().add(Duration(hours: 2)).toIso8601String()},
  );
  
  // Cache frequently accessed user data (LRU eviction)
  await PVCache.set('memory:user_123', {'name': 'John', 'email': 'john@example.com'});
  
  // Cache popular articles (LFU eviction)  
  await PVCache.set('popular:article_1', {'title': 'Popular Article', 'views': 1000});
  
  // Store API keys securely (encrypted)
  await PVCache.set('secure:api_key', 'sk_live_1234567890');
}
```

### Fragment Caching Example

```dart
// Callback functions for data loading
Future<Map<String, dynamic>> fetchUserProfile() async {
  // Simulated API call
  return {
    'profile': {'name': 'John Doe', 'email': 'john@example.com'},
    'preferences': {'theme': 'dark', 'notifications': true},
    'history': {'lastLogin': '2024-01-01', 'loginCount': 42},
  };
}

Future<Map<String, dynamic>> fetchUserPreferences() async {
  return {'theme': 'dark', 'notifications': true, 'language': 'en'};
}

Future<Map<String, dynamic>> fetchUserHistory() async {
  return {'lastLogin': '2024-01-01', 'loginCount': 42, 'purchases': []};
}

// Set up fragment caching
Future<void> setupFragmentCache() async {
  final configs = [
    FragmentConfig(
      name: "user_data",
      path: "/",
      callback: fetchUserProfile,
      fragments: ["user_data/preferences", "user_data/history"],
    ),
    FragmentConfig(
      name: "preferences",
      path: "user_data/preferences", 
      callback: fetchUserPreferences
    ),
    FragmentConfig(
      name: "history",
      path: "user_data/history",
      callback: fetchUserHistory
    ),
  ];
  
  await PVCache.setEnv('fragments', AdvancedFragment(fragmentConfigs: configs));
  await PVCache.init();
  
  // Access triggers callback and creates fragments
  final userData = await PVCache.get('fragments:user_data');
  // userData = {'preferences': '@fragment:preferences', 'history': '@fragment:history'}
  
  // Access fragments directly (no callback, uses cached data)
  final preferences = await PVCache.get('fragments:preferences');
  final history = await PVCache.get('fragments:history');
}
```

## API Reference

### Core Methods

```dart
// Environment setup
static Future<void> setEnv(String env, PVCacheEnvConfig config)

// Initialization  
static Future<void> init()

// Data operations
static Future<void> set(String key, dynamic value, {Map<String, dynamic>? metadata})
static Future<dynamic> get(String key, {bool expiredReturnsNull = true})
static Future<void> delete(String key)
static Future<dynamic> pop(String key) // Get and delete in one operation

// Cleanup
static Future<void> clear({String? env}) // Clear environment or all data
```

### Key Format

- **Simple keys**: `'user_name'` → uses 'default' environment
- **Environment keys**: `'production:api_data'` → uses 'production' environment
- **Reserved prefixes**: Keys starting/ending with `__` are reserved for internal use

### Storage Type Constructors

```dart
// Time-based expiry
SimpleExpiry()

// Size-limited with LRU eviction
SimpleLRU(maxSize: int)

// Size-limited with LFU eviction  
SimpleLFU(maxSize: int)

// Encrypted storage
Encrypted()

// Fragment-based caching
AdvancedFragment({
  required List<FragmentConfig> fragmentConfigs,
  bool defaultGet = true,
  bool defaultSet = true, 
  bool defaultDelete = true,
})
```

## Testing

The package includes comprehensive testing applications:

### Main Test App
```bash
cd pv_cache_test
flutter run -d chrome
```

Features:
- Multi-environment testing
- All storage type demonstrations  
- Automated batch testing
- Real-time cache visualization

### Advanced Fragment Example
```bash
cd pv_cache_test
flutter run -d chrome --target=lib/main_advanced_fragment.dart
```

Demonstrates:
- Fragment configuration and setup
- Callback-based data loading
- Individual fragment access
- Cache miss optimization

## Architecture

PV Cache uses a multi-layer architecture:

```
┌─────────────────┐
│   PVCache API   │  Static methods, key parsing
├─────────────────┤
│ PVCacheCentral  │  Environment management, Hive boxes
├─────────────────┤
│ Storage Types   │  SimpleExpiry, SimpleLRU, SimpleLFU, 
│                 │  Encrypted, AdvancedFragment
├─────────────────┤
│ Hive + Secure   │  Data persistence, encryption
└─────────────────┘
```

### Key Benefits
- **Environment Isolation**: Each environment operates independently
- **Performance Optimized**: Cache miss handling only when needed
- **Extensible**: Easy to add new storage types
- **Cross-Platform**: Works on web, mobile, and desktop

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
