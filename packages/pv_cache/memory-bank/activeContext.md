# PV Cache: Active Context

## Current State
The package has been completely overhauled with a sophisticated multi-environment caching system featuring advanced fragment caching and performance optimizations:

### New Architecture
- **PVCacheCentral**: Core storage operations with environment management and on-demand box loading
- **PVCacheEnvConfig**: Abstract configuration interface with pre/post operation hooks and cache miss handling
- **PVCacheStorageType**: Base class for storage type implementations
- **PVCache**: Main API with `{env}:{key}` format support and environment isolation

### Key Features Implemented
- **Multi-Environment Support**: `{env}:{key}` format for environment-specific cache operations
- **Advanced Fragment Caching**: Break large data into independently cacheable pieces with callback-based loading
- **Performance Optimization**: `handlesCacheMiss` flag for efficient cache miss handling
- **Environment Isolation**: Each environment uses its own storage configuration and data box
- **Automated Batch Testing**: Comprehensive test suite covering all cache functionalities
- **Lazy Box Loading**: On-demand initialization with `ensureBoxReady` for optimal performance

### Storage Types Available
- **SimpleExpiry**: Time-based expiration with automatic cleanup
- **SimpleLRU**: Least Recently Used eviction with persistent access tracking  
- **SimpleLFU**: Least Frequently Used eviction with persistent frequency tracking
- **Encrypted**: Secure storage with expiry support
- **AdvancedFragment**: Hierarchical caching with fragment resolution and callback-based loading

### Current Implementation Status
- ✅ `{env}:{key}` format parsing and environment routing
- ✅ Advanced fragment caching with data fragmentation
- ✅ Performance optimization with cache miss handling toggle
- ✅ Environment-specific configuration and isolation
- ✅ Physical cleanup of expired/evicted cache entries
- ✅ Automated batch testing across environments
- ✅ Standalone advanced fragment example application
- ✅ Complete working IndexedDB storage on web platform

### Latest Improvements
- **Fragment Caching**: Large objects automatically broken into smaller, independently cacheable pieces
- **Callback System**: `preGet` with `null` originalValue triggers data loading callbacks
- **Cache Miss Optimization**: Fast path for storage types that don't handle cache misses
- **Environment Binding**: Each environment bound to specific storage type configuration
- **Physical Cleanup**: Expired values fully removed from cache, not just marked invalid
- **Shared Cleanup Logic**: `rawDelete` method handles both metadata and value removal

### Technical Implementation Details
- **Environment Parsing**: `_parseKey()` extracts environment and actual key from `{env}:{key}` format
- **Single Meta Box**: All environment metadata stored in `__pvcache_meta` with environment prefixes
- **Fragment References**: `@fragment:fragmentKey` format for lightweight fragment references
- **Cache Miss Toggle**: `handlesCacheMiss` flag enables/disables expensive cache miss processing
- **Direct Storage Access**: `rawSet`/`rawGet`/`rawDelete` methods bypass hooks to prevent recursion

## Design Principles
- Performance first - fast path for common operations
- Environment isolation - each environment operates independently
- Minimal processing - only do expensive operations when needed
- Fragment-based caching - break large data into manageable pieces
- Callback-driven loading - fetch fresh data only on cache misses
- Physical cleanup - ensure expired data is completely removed
