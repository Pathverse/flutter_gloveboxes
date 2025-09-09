# PVCache Examples

This directory contains working examples demonstrating different aspects of PVCache usage.

## Running the Examples

All examples can be run using Flutter (required since PVCache depends on Flutter):

```bash
# Basic usage example
flutter run --target=example/basic_usage.dart -d chrome

# Adapter usage example (with TTL functionality)
flutter run --target=example/adapter_usage.dart -d chrome

# Advanced patterns example
flutter run --target=example/advanced_patterns.dart -d chrome
```

## Examples Overview

### 1. basic_usage.dart
**What it demonstrates:**
- How to initialize a basic cache
- Storing and retrieving data
- Basic cache operations (set, get, exists, delete, clear)
- Working without adapters

**Key concepts:**
- Simple cache initialization with `PVCache()`
- Basic storage operations
- Cache clearing and verification

### 2. adapter_usage.dart
**What it demonstrates:**
- Using ExpiryAdapter for TTL (time-to-live) functionality
- Using LoggingAdapter for operation logging
- Metadata usage for TTL and expiry settings
- Error handling for invalid metadata combinations

**Key concepts:**
- Adapter initialization: `adapters: [ExpiryAdapter(), LoggingAdapter()]`
- Metadata storage requirement: `metaStorage: InMemory()`
- TTL usage: `metadata: {"ttl": 2}` (expires in 2 seconds)
- Custom expiry: `metadata: {"expiry": "2025-09-09T11:13:36.312"}`
- Error handling for conflicting metadata

### 3. advanced_patterns.dart
**What it demonstrates:**
- Cache environment management and reuse
- Multiple cache instances for different purposes
- Complex metadata patterns
- Cache isolation and selective clearing
- Real-world usage patterns

**Key concepts:**
- Environment reuse: First call with full config, subsequent calls with just `env`
- Multiple cache environments for different data types
- Cache instance identity: `identical(cache1, cache2)`
- Selective clearing: Only clear specific caches
- Business logic patterns (end-of-day expiry, etc.)

## Expected Output Examples

### Basic Usage Output:
```
User: {name: John Doe, age: 30}
Theme: dark
User exists: true
Deleted theme: null
User after clear: null
```

### Adapter Usage Output:
```
=== Adapter Example: TTL Functionality ===
LOG: Starting operation for key: temp-data
Stored temp data with 2-second TTL
LOG: Starting operation for key: temp-data
Retrieved immediately: This will expire soon
LOG: Starting operation for key: temp-data
Retrieved after 1 second: This will expire soon
Retrieved after expiry: null

=== Adapter Example: Metadata Usage ===
LOG: Starting operation for key: scheduled-data
Stored data with specific expiry time: 2025-09-09T11:13:36.312
LOG: Starting operation for key: scheduled-data
Retrieved before expiry: This expires at a specific time

=== Adapter Example: Error Handling ===
Expected error caught: Invalid argument(s): Cannot specify both ttl and expiry. Use one or the other.

Adapter example completed!
```

## Key Patterns Demonstrated

1. **Basic Cache Operations**: set, get, exists, delete, clear
2. **TTL/Expiry Management**: Using ExpiryAdapter with metadata
3. **Environment Management**: Reusing cache instances by environment name
4. **Error Handling**: Proper exception handling for invalid configurations
5. **Multiple Adapters**: Combining different adapters (ExpiryAdapter + LoggingAdapter)
6. **Cache Isolation**: Different caches for different purposes (user data, session data, config data)

## Notes

- All examples use `InMemory()` storage for simplicity
- ExpiryAdapter requires `metaStorage` to be provided
- LoggingAdapter provides debug output showing cache operations
- Debug service errors in Flutter web are normal and don't affect functionality
