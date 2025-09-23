# PVCache Project Brief

## What is PVCache?
PVCache is a flexible caching system built in Dart/Flutter. It's designed to be fast and extensible.

## Core Goals
- **Fast Performance**: Pre-build call frames at launch to avoid runtime compilation delays
- **Flexible Extensions**: Use adapters to add features like expiry (TTL), LRU eviction, and result aggregation
- **Flexible Storage**: Support for any storage backend (memory, disk, network, Hive CE, Flutter Secure Storage, etc.)
- **Easy to Use**: Simple API for basic caching operations

## Key Features
- Adapter-based architecture for adding functionality
- Pre-compiled call frames for better performance
- Support for metadata on cache operations
- Error handling and flow control
- Priority-based execution order for adapters

## Target Users
- Internal projects needing fast caching
- External developers wanting extensible cache solutions
- Applications requiring complex caching strategies

## Basic Operations
- `get(key)` - Retrieve cached value
- `set(key, value)` - Store value in cache
- `delete(key)` - Remove value from cache
- `exists(key)` - Check if key exists
- `clear()` - Remove all cached values
