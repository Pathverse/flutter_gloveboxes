# PV Cache Test

A Flutter web application for testing the `pv_cache` package functionality.

## Features

This test application demonstrates various caching scenarios:

### Main Test Interface
- **Simple Expiry Cache**: Basic cache with expiration functionality
- **Simple LRU Cache**: Least Recently Used eviction policy
- **Simple LFU Cache**: Least Frequently Used eviction policy
- **Special Key Protection**: Demonstrates protection against reserved keys
- **Cross-browser Persistence**: Tests persistence across browser restarts

### Advanced Fragment Example
Access via the grid icon in the app bar to test the AdvancedFragment storage type.

**What it demonstrates:**
- **Hierarchical Data Caching**: Cache complex nested data structures
- **Automatic Fragment Loading**: Callbacks triggered when cache is empty
- **Fragment Resolution**: Automatic resolution of fragment references
- **API Simulation**: Mock API calls with realistic delays

**Example Usage:**
```dart
// Configure fragments
final fragmentConfigs = [
  FragmentConfig(
    name: "w",
    path: "/",
    callback: () async => await fetchWorldData(),
    fragments: ["w/w1", "w/w2", "w/w3"],
  ),
];

// Use normal PVCache.get() - handles everything automatically!
final worldData = await PVCache.get("w");
```

**How it works:**
1. **First call**: `PVCache.get("w")` triggers callback, caches data and fragments
2. **Subsequent calls**: Resolves fragment references automatically
3. **Fragment keys**: Uses `$$key_fragment$$` format for internal references
4. **Transparent**: Works like normal cache but with fragment support

## Running the Tests

1. Ensure you have Flutter installed
2. Navigate to this directory
3. Run `flutter pub get`
4. Run `flutter run -d chrome`

## Storage Types Tested

- **SimpleExpiry**: Basic cache with expiration
- **SimpleLRU**: Least Recently Used eviction
- **SimpleLFU**: Least Frequently Used eviction
- **Encrypted**: Secure storage with Flutter Secure Storage
- **AdvancedFragment**: Hierarchical data caching with callbacks

## Key Features Demonstrated

- **Pre/Post Operations**: Custom logic before/after cache operations
- **Default Logic Control**: Toggle between default and custom behavior
- **SHA1 Meta Hashing**: Secure meta box naming
- **Special Key Protection**: Reserved keys for internal use
- **Persistent Tracking**: LRU/LFU persistence across restarts
- **Fragment Resolution**: Automatic hierarchical data handling
