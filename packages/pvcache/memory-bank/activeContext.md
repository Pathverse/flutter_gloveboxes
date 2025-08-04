# PVCache: Active Context

## Current Work Status
**SYSTEM COMPLETE**: LRU/LFU eviction adapters are now fully functional. Fixed critical architecture issue where middleware adapters weren't being called during operations. All eviction functionality is working correctly.

## Recent Major Achievement

### The Problem & Solution
Fixed fundamental hook system architecture where middleware adapters (LRU/LFU) were being skipped during operations. The core issue was that the hook system only processed specific storage adapters instead of ALL adapters in the configuration.

**Solution**: Implemented loop-based hook processing that calls pre/post hooks on every adapter in the adapter map, enabling proper middleware functionality.

### Architecture Fix Implementation ✅

1. **Hook System Redesign**: All adapters in configuration now participate in operations
2. **Complete Integration**: Applied across all operation types (set, get, delete)
3. **Chain Processing**: Proper handling of shouldContinue flags and value modifications
4. **Eviction Integration**: LRU/LFU eviction now works seamlessly during normal operations

## System Architecture Overview

### Multi-Adapter Configuration Pattern
```dart
await PVCache.register('cache_env', 
  adapters: LinkedHashMap.from({
    'std': StdAdapter(),           // Storage implementation
    'lru': LRUAdapter(maxSize: 3), // Eviction middleware
  }),
  overwriteSet: 'std',  // Storage operations handled by StdAdapter
  // ALL adapters get their hooks called for middleware functionality
);
```

### Hook Processing Flow
1. **Pre-operation hooks**: All adapters with `hasPreMethods=true` get called
2. **Storage operation**: Primary storage adapter executes the actual operation
3. **Post-operation hooks**: All adapters with `hasPostMethods=true` get called
4. **Chain control**: Each adapter can modify values or halt the operation chain

## Adapter Configuration Guidelines

### Storage Adapters
- **Purpose**: Handle actual data persistence (get, set, delete, metadata)
- **Examples**: StdAdapter (Hive), SecureAdapter (Flutter Secure Storage)
- **Usage**: Set as overwrite adapters for storage operations

### Middleware Adapters  
- **Purpose**: Provide additional behavior through hooks (eviction, caching, monitoring)
- **Examples**: LRUAdapter, LFUAdapter
- **Implementation**: Use `noSuchMethod` for storage operations, implement hooks only
- **Critical**: Must store metadata as flat `Map<String, String>` to avoid Hive serialization errors

### Configuration Best Practices
1. **Always include a storage adapter** for actual data persistence
2. **Add middleware adapters** for additional functionality like eviction
3. **Set overwrite adapters** to point to storage adapters only
4. **Order matters**: Adapters execute in LinkedHashMap insertion order

## Current Implementation Status

### Eviction System ✅
- **LRU Adapter**: Tracks access times, evicts oldest items when cache reaches capacity
- **LFU Adapter**: Tracks access frequency, evicts least frequently used items
- **Persistence**: Access metadata survives app restarts via internal storage
- **Integration**: Eviction happens automatically during set operations

### Flat Storage Requirement ✅
All adapters now store metadata as simple key-value pairs to comply with Hive serialization:
```dart
// ✅ Correct format
{"item1": "2025-01-01T12:00:00Z", "item2": "2025-01-01T13:00:00Z"}

// ❌ Causes Hive serialization errors  
{"keys": ["item1", "item2"], "config": {"maxSize": 3}}
```

### Test Logic Correction ✅
Fixed test expectations to properly handle PVCache return values:
- **Existing items**: PVCache.get() returns the actual value
- **Evicted items**: PVCache.get() returns null (not exceptions)

## Next Development Areas

### 1. Performance Optimization
- Cache metadata operations for improved performance
- Optimize hook processing for high-throughput scenarios
- Consider adapter initialization optimizations

### 2. Extended Middleware
- TTL (Time-To-Live) adapter for automatic expiration
- Compression adapter for large data items
- Analytics adapter for usage tracking

### 3. Configuration Enhancements
- Validation for adapter compatibility
- Helper methods for common adapter combinations
- Configuration templates for typical use cases

## Important Patterns and Conventions

### Adapter Development Rules
1. **Middleware adapters**: Implement hooks only, use `noSuchMethod` for storage operations
2. **Flat metadata storage**: Always use `Map<String, String>` format for internal data
3. **Hook participation**: Set `hasPreMethods`/`hasPostMethods` flags appropriately
4. **Prefix internal keys**: Use `__adapter_name_key__` format for internal metadata

### Configuration Guidelines
1. **Include storage adapters**: For actual data persistence
2. **Add middleware as needed**: For additional functionality
3. **Set overwrite correctly**: Point to storage adapters only
4. **Order matters**: First adapter can halt the chain if needed

### Error Prevention
1. **Avoid nested objects** in metadata to prevent Hive serialization errors
2. **Use string values only** in adapter metadata storage
3. **Validate adapter combinations** during registration
4. **Test eviction behavior** with your specific cache size limits
