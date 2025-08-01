# PV Cache: Active Context

## Current State
The package has been completely overhauled with a sophisticated multi-environment caching system featuring advanced fragment caching, smart fragments, and performance optimizations:

### New Architecture
- **PVCacheCentral**: Core storage operations with environment management and on-demand box loading
- **PVCacheEnvConfig**: Abstract configuration interface with pre/post operation hooks and cache miss handling
- **PVCacheStorageType**: Base class for storage type implementations
- **PVCache**: Main API with `{env}:{key}` format support and environment isolation

### Key Features Implemented
- **Multi-Environment Support**: `{env}:{key}` format for environment-specific cache operations
- **Advanced Fragment Caching**: Break large data into independently cacheable pieces with callback-based loading
- **Smart Fragments**: Dynamic key generation using data field interpolation with glob pattern matching
- **Performance Optimization**: `handlesCacheMiss` flag for efficient cache miss handling
- **Environment Isolation**: Each environment uses its own storage configuration and data box
- **Automated Batch Testing**: Comprehensive test suite covering all cache functionalities
- **Lazy Box Loading**: On-demand initialization with `ensureBoxReady` for optimal performance
- **Modular Architecture**: Single-responsibility functions for maintainable and extensible code

### Storage Types Available
- **SimpleExpiry**: Time-based expiration with automatic cleanup
- **SimpleLRU**: Least Recently Used eviction with persistent access tracking  
- **SimpleLFU**: Least Frequently Used eviction with persistent frequency tracking
- **Encrypted**: Secure storage with expiry support
- **AdvancedFragment**: Hierarchical caching with fragment resolution, smart fragments, and callback-based loading

### Current Implementation Status
- ✅ `{env}:{key}` format parsing and environment routing
- ✅ Advanced fragment caching with data fragmentation
- ✅ Smart fragments with dynamic key generation and field interpolation
- ✅ Performance optimization with cache miss handling toggle
- ✅ Environment-specific configuration and isolation
- ✅ Physical cleanup of expired/evicted cache entries
- ✅ Automated batch testing across environments
- ✅ Standalone advanced fragment example application with smart fragment testing
- ✅ Complete working IndexedDB storage on web platform
- ✅ Modular function architecture with single-responsibility design

### Latest Improvements
- **Smart Fragments**: Dynamic key generation using `{field}` interpolation patterns
- **Glob Pattern Support**: Flexible path matching for both regular and smart fragments
- **Modular Design**: Split monolithic functions into focused, single-purpose methods
- **Fragment Caching**: Large objects automatically broken into smaller, independently cacheable pieces
- **Callback System**: `preGet` with `null` originalValue triggers data loading callbacks
- **Cache Miss Optimization**: Fast path for storage types that don't handle cache misses
- **Environment Binding**: Each environment bound to specific storage type configuration
- **Physical Cleanup**: Expired values fully removed from cache, not just marked invalid
- **Shared Cleanup Logic**: `rawDelete` method handles both metadata and value removal

### Smart Fragment Features
- **Dynamic Key Generation**: `SmartFragment("x/x*", "in_{name}_id")` generates semantic cache keys
- **Field Interpolation**: Replace `{field}` placeholders with actual data values
- **Glob Pattern Matching**: Use patterns like `"x/x*"` to match data paths
- **Multiple Field Support**: Complex patterns like `"user_{id}_{name}"` for rich key generation
- **Semantic Keys**: Cache keys based on data content rather than arbitrary paths

### Technical Implementation Details
- **Environment Parsing**: `_parseKey()` extracts environment and actual key from `{env}:{key}` format
- **Single Meta Box**: All environment metadata stored in `__pvcache_meta` with environment prefixes
- **Fragment References**: `@fragment:fragmentKey` format for lightweight fragment references
- **Smart Fragment Processing**: Modular functions for path matching, key generation, and data storage
- **Cache Miss Toggle**: `handlesCacheMiss` flag enables/disables expensive cache miss processing
- **Direct Storage Access**: `rawSet`/`rawGet`/`rawDelete` methods bypass hooks to prevent recursion

### Modular Function Architecture
- **`_fetchDataFromCallback()`**: Handles callback execution and error handling
- **`_hasFragments()`**: Checks if config has any type of fragments
- **`_processFragments()`**: Orchestrates fragment processing
- **`_processRegularFragments()`**: Handles traditional path-based fragments
- **`_processSmartFragments()`**: Handles dynamic key generation fragments
- **`_storeFragmentData()`**: Orchestrates storage of all fragment types
- **`_storeRegularFragments()`**: Stores traditional fragments
- **`_storeSmartFragments()`**: Stores dynamically-keyed fragments

## Design Principles
- Performance first - fast path for common operations
- Environment isolation - each environment operates independently
- Minimal processing - only do expensive operations when needed
- Fragment-based caching - break large data into manageable pieces
- Smart key generation - semantic cache keys based on data content
- Modular design - single responsibility for each function
- Callback-driven loading - fetch fresh data only on cache misses
- Physical cleanup - ensure expired data is completely removed
