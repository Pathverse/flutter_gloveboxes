# PVCache: Product Context

## Why This Project Exists
PVCache serves as an experimental implementation of multi-environment caching with an adapter-driven architecture. It explores an alternative approach to the main PV Cache package, focusing on:

1. **Architecture Experimentation**: Testing adapter patterns for pluggable storage backends
2. **Security Integration**: Seamless switching between regular and secure storage
3. **Environment Isolation**: Clean separation of data across different use cases
4. **Development Learning**: Understanding different architectural approaches to caching

## Problems It Solves

### 1. Storage Backend Flexibility
- **Problem**: Apps need different storage strategies (memory, disk, encrypted) for different data types
- **Solution**: Adapter pattern allows swapping storage implementations without API changes
- **Benefit**: Same API works with Hive, Secure Storage, or custom backends

### 2. Security Configuration Complexity
- **Problem**: Manually managing secure vs non-secure storage is error-prone
- **Solution**: Automatic adapter selection based on `secureData`/`secureMeta` flags
- **Benefit**: Developers just set flags, system handles the complexity

### 3. Environment Data Mixing
- **Problem**: Different app contexts (user data, cache, temp) getting mixed together
- **Solution**: Environment prefixes (`user:`, `cache:`, `temp:`) with isolated storage
- **Benefit**: Clean data separation and easier debugging

### 4. Metadata Management Overhead
- **Problem**: Complex metadata handling, especially with encryption
- **Solution**: Built-in metadata system with secure meta format for encrypted data
- **Benefit**: Rich metadata without manual encryption/decryption

## How It Should Work

### 1. Environment Registration
```dart
// Register environments with different security levels
await PVCache.register('user', secureData: false, secureMeta: false);
await PVCache.register('sensitive', secureData: true, secureMeta: true);
```

### 2. Unified API
```dart
// Same API works across all environments
await PVCache.set('user:profile', userData);
await PVCache.set('sensitive:api_key', secretKey);

final profile = await PVCache.get('user:profile');
final apiKey = await PVCache.get('sensitive:api_key');
```

### 3. Transparent Security
```dart
// System automatically uses correct storage based on environment config
// user: -> StdAdapter (Hive)
// sensitive: -> SecureAdapter (Flutter Secure Storage)
```

### 4. Rich Metadata
```dart
await PVCache.set('cache:data', value, metadata: {
  'expiry': DateTime.now().add(Duration(hours: 1)).millisecondsSinceEpoch,
  'source': 'api_call',
  'version': 2,
});
```

## User Experience Goals

### For Developers
- **Simple Setup**: Register environments once, use everywhere
- **Consistent API**: Same methods work across all storage types
- **Automatic Security**: No manual encryption key management
- **Clear Debugging**: Environment prefixes make data source obvious

### For End Users
- **Transparent Performance**: Fast access regardless of storage backend
- **Data Security**: Sensitive data automatically encrypted
- **Reliability**: Consistent behavior across app restarts
- **Privacy**: Secure data properly isolated and protected

## Success Metrics
- **API Simplicity**: Single set of methods for all storage types
- **Security Transparency**: No manual encryption/decryption needed
- **Performance**: Minimal overhead from adapter layer
- **Flexibility**: Easy to add new storage backends
- **Debugging**: Clear error messages and data source identification
