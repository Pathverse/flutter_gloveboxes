<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

# PVCache Web Test Package

A comprehensive web-based test application for the PVCache package, providing organized testing of all PVCache functionality including environments, adapters, and advanced features.

## Features

- **Web-Optimized Testing**: Designed specifically for Flutter web testing
- **Interactive UI**: Click-to-run tests with visual feedback
- **Complete Coverage**: Tests all PVCache environments (kv, encrypted, custom)
- **Adapter Testing**: LRU and LFU cache adapter validation
- **Real-time Results**: See test progress and results in the browser
- **Console Logging**: Detailed test logs in browser console

## Quick Start

### Running the Web Test App

```bash
cd packages/pvcache_test
flutter run -d chrome
```

Or run directly with:
```dart
import 'package:flutter/material.dart';
import 'package:pvcache_test/pvcache_test.dart';

void main() {
  runApp(const PVCacheTestApp());
}
```

### Using as a Library

```dart
import 'package:pvcache_test/pvcache_test.dart';

// Run complete test suite programmatically
await PVCacheTestSuite.runAllTests();

// Or run individual components
await PVCacheTestSuite.initializePVCache();
await PVCacheTestSuite.testPVCacheOperations();
await PVCacheTestSuite.testLRUAdapter();
await PVCacheTestSuite.testLFUAdapter();
```

## Test Coverage

### 1. Environment Testing
- **KV Environment**: Default string-based storage
- **Encrypted Environment**: Secure storage with automatic encryption
- **Custom Environments**: User-defined environments with metadata
- **Environment Isolation**: Each environment operates independently

### 2. Core Operations
- Set/Get operations across all environments
- Metadata management and retrieval
- Delete operations and cleanup
- Expiry functionality with time-based validation

### 3. Advanced Features
- **LRU Adapter**: Least Recently Used cache eviction
- **LFU Adapter**: Least Frequently Used cache eviction
- **env:key Format**: Environment-prefixed key testing
- **Security Testing**: Encrypted storage validation

## Project Structure

```
lib/
├── main.dart                           # Flutter web app entry point
├── pvcache_test.dart                   # Main export file
└── src/
    ├── pvcache_test_suite.dart         # Test coordinator
    ├── initializer.dart                # Environment setup
    ├── basic_operations_test.dart      # Core PVCache operations
    ├── lru_adapter_test.dart          # LRU cache adapter tests  
    ├── lfu_adapter_test.dart          # LFU cache adapter tests
    └── test_app.dart                  # Flutter web test UI
example/
└── main.dart                          # Alternative entry point
```

## Modular Test Components

### 1. PVCacheInitializer
Handles environment registration and PVCache initialization:
- Basic environments (user, cache, secure)
- Environment-specific metadata defaults
- PVCache core initialization

### 2. BasicOperationsTest  
Tests core PVCache functionality:
- KV environment operations
- Encrypted environment operations
- Custom environment operations with metadata
- Delete operations and cleanup
- Expiry functionality validation

### 3. LRUAdapterTest
Tests Least Recently Used cache adapter:
- Environment registration with LRU adapter
- Cache eviction based on access recency
- Access pattern tracking
- Size limit enforcement

### 4. LFUAdapterTest
Tests Least Frequently Used cache adapter:
- Environment registration with LFU adapter  
- Cache eviction based on access frequency
- Frequency and timestamp tracking
- Complex eviction logic validation

### 5. PVCacheTestSuite
Main coordinator that orchestrates all tests:
- Runs complete test suite
- Provides individual test methods
- Handles error reporting and logging

## Web Test Output

The web test app provides:

1. **Visual Interface**: Clean, modern UI with test status
2. **Interactive Testing**: Click button to start tests
3. **Progress Indicators**: Icons and messages showing test state
4. **Error Display**: Clear error messages if tests fail
5. **Console Logs**: Detailed test execution logs in browser console

## Example Console Output

```
🚀 Starting PVCache initialization...
📦 Registering custom environments...
✅ user environment registered
✅ cache environment registered
✅ secure environment registered
✅ lru_cache environment registered
✅ lfu_cache environment registered

🔧 Initializing PVCache...
✅ PVCache initialized successfully!

💾 Testing PVCache operations...
   📝 Testing new env:key API...
   
   Testing KV environment...
     ✅ Username: john_doe
     ✅ App Version: 1.0.0
     
   🔒 Testing Encrypted environment...
     ✅ Secret Key: super_secret_password
     
🎯 All PVCache tests completed successfully!
```

## Dependencies

- `flutter`: Flutter SDK
- `pvcache`: The PVCache package being tested

## Development

This package serves as:

1. **Web Test Runner**: Interactive testing environment for PVCache
2. **Validation Tool**: Ensures PVCache works correctly in web environment
3. **Demo Application**: Shows PVCache capabilities and usage patterns
4. **Debug Tool**: Helps identify issues with PVCache functionality

## Browser Compatibility

Tested and optimized for:
- Chrome/Chromium
- Firefox  
- Safari
- Edge

Works with Flutter web's default browser storage implementations.
