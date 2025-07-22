# PV Cache: Public Context

## Overview
PV Cache is a production-ready, modular Flutter caching package for secure, flexible, and type-safe data storage. It supports encrypted storage, advanced cache management (expiry, LRU/LFU), grouping, and robust JSON utilities.

## Features
- Secure, encrypted storage for sensitive data
- Flexible support for strings, numbers, JSON objects, and arrays
- Expiry and LRU/LFU eviction strategies
- Grouping and dependency-based invalidation
- Type-safe APIs: All map data is guaranteed to be `Map<String, dynamic>`, including nested structures
- Cross-platform: iOS, Android, Web

## Type Safety
All cache retrieval methods (including nested structures) guarantee `Map<String, dynamic>` for maps and `List<Map<String, dynamic>>` for lists of maps. This ensures compatibility with Flutter widgets like `FutureBuilder<Map<String, dynamic>>`.

## Status
- Fully implemented and tested
- Ready for production use
- Comprehensive test suite
- Performance-optimized for large datasets

## Technology
- Flutter, Dart, Hive, Flutter Secure Storage, WebCrypto

## Documentation & Examples
See the main README for usage examples and API documentation.
