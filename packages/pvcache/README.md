# PVCache

A high-performance, extensible caching library for Dart and Flutter applications. PVCache uses pre-compiled call frames and a flexible adapter system to provide fast, customizable caching with minimal runtime overhead.

## Features

- 🚀 **High Performance**: Pre-compiled call frames eliminate runtime compilation overhead
- 🔧 **Extensible**: Adapter-based architecture for custom functionality
- ⏰ **TTL Support**: Built-in time-to-live functionality with automatic expiration
- 🏪 **Flexible Storage**: Support for any storage backend (memory, disk, network, Hive CE, Flutter Secure Storage, etc.)
- 🔄 **Environment Management**: Singleton pattern with environment-based cache reuse
- 🛡️ **Error Handling**: Robust validation and exception management
- 📊 **Metadata Support**: Rich metadata handling for complex caching strategies

## Quick Start

### Basic Usage

```dart
import 'package:pvcache/pvcache.dart';
import 'package:pvcache/templates/storage/inmemory.dart';

// Create a basic cache
final cache = PVCache(
  env: "my-app-cache",
  adapters: [],
  storage: InMemory(),
);

// Store and retrieve data
await cache.set("user:123", {"name": "John Doe", "age": 30});
final user = await cache.get("user:123");
print(user); // {name: John Doe, age: 30}

// Check existence and delete
final exists = await cache.exists("user:123"); // true
await cache.delete("user:123");
await cache.clear(); // Clear entire cache
```

### TTL (Time-To-Live) Caching

```dart
import 'package:pvcache/pvcache.dart';
import 'package:pvcache/templates/storage/inmemory.dart';
import 'package:pvcache/templates/adapters/expiry.dart';

// Create cache with TTL support
final cache = PVCache(
  env: "ttl-cache",
  adapters: [ExpiryAdapter()],
  storage: InMemory(),
  metaStorage: InMemory(), // Required for metadata
);

// Store with TTL (expires in 60 seconds)
await cache.set("session:abc", "session-data", metadata: {"ttl": 60});

// Store with specific expiry time
final expireAt = DateTime.now().add(Duration(hours: 2));
await cache.set("temp:data", "value", metadata: {
  "expiry": expireAt.toIso8601String()
});

// Data automatically expires and returns null
await Future.delayed(Duration(seconds: 61));
final expired = await cache.get("session:abc"); // null
```

### Multiple Adapters

```dart
import 'package:pvcache/templates/adapters/expiry.dart';
import 'package:pvcache/templates/helpers/test.dart';

// Combine multiple adapters
final cache = PVCache(
  env: "multi-adapter-cache",
  adapters: [
    ExpiryAdapter(),    // TTL functionality
    LoggingAdapter(),   // Operation logging
  ],
  storage: InMemory(),
  metaStorage: InMemory(),
);

// Operations will be logged and support TTL
await cache.set("logged-data", "value", metadata: {"ttl": 300});
// Output: LOG: Starting operation for key: logged-data
```

## Core Concepts

### Cache Environments

PVCache uses environment-based singleton management. The first call creates the cache instance, subsequent calls with the same environment name return the existing instance:

```dart
// First call - creates cache with full configuration
final cache1 = PVCache(
  env: "shared-cache",
  adapters: [ExpiryAdapter()],
  storage: InMemory(),
  metaStorage: InMemory(),
);

// Subsequent calls - just reference by environment name
final cache2 = PVCache(env: "shared-cache");

// These are the same instance
assert(identical(cache1, cache2)); // true
```

### Adapters

Adapters extend cache functionality through mixins:

- **ExpiryAdapter**: Automatic expiration based on TTL or specific time
- **LoggingAdapter**: Debug logging for cache operations
- Custom adapters can be created using the mixin system

### Metadata

Metadata provides additional context for cache operations:

```dart
// TTL metadata
await cache.set("key", "value", metadata: {"ttl": 3600}); // 1 hour

// Custom expiry time
await cache.set("key", "value", metadata: {
  "expiry": "2025-12-31T23:59:59.000Z"
});

// Custom metadata for adapter logic
await cache.set("key", "value", metadata: {
  "priority": "high",
  "category": "user-data"
});
```

## API Reference

### PVCache

| Method | Description |
|--------|-------------|
| `get(key)` | Retrieve cached value |
| `set(key, value, {metadata})` | Store value with optional metadata |
| `delete(key)` | Remove value from cache |
| `exists(key)` | Check if key exists |
| `clear()` | Remove all cached values |

### Built-in Adapters

#### ExpiryAdapter

Provides automatic expiration functionality:

```dart
// TTL (time-to-live) in seconds
metadata: {"ttl": 3600}

// Specific expiry time
metadata: {"expiry": "2025-12-31T23:59:59.000Z"}

// Error: Cannot use both
metadata: {"ttl": 3600, "expiry": "2025-12-31T23:59:59.000Z"} // Throws error
```

## Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  pvcache: ^1.0.0
```

## Examples

The `/example` directory contains comprehensive examples:

- `basic_usage.dart` - Fundamental cache operations
- `adapter_usage.dart` - TTL and adapter functionality  
- `advanced_patterns.dart` - Real-world usage patterns

Run examples with:
```bash
flutter run --target=example/basic_usage.dart -d chrome
```

## Performance

PVCache is designed for high performance:

- **Pre-compiled call frames** eliminate runtime compilation overhead
- **Singleton adapters** prevent duplicate instances
- **Efficient metadata processing** with scoped filtering
- **Minimal object allocation** during operations

## Contributing

1. Fork the repository
2. Create a feature branch
3. Add tests for new functionality
4. Ensure all tests pass: `flutter test`
5. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.
