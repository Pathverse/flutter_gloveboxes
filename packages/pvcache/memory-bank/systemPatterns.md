# System Architecture

## Call Frame Pre-compilation System
**PVCFrame** builds executable call stacks at startup to eliminate runtime overhead:
- **buildFromCache()**: Creates 5 frames (get/set/delete/clear/exists) per cache instance
- **getOpCallStack()**: Sorts pre-ops and post-ops by ascending priority (0=highest priority)
- **getMetadataParseStack()**: Builds metadata processing chain by ascending priority
- **call()**: Executes full stack with error/finally handling and flow control

**PVCFramePayload** maps adapters to operation types:
- Cached instances prevent rebuilding identical configurations
- **getAdaptersMap()**: Scans adapters for mixin implementations
- Maps operations to specific adapter methods (preGet→PreGet.preGet)
- Handles metadata scoping with key collision detection

## Adapter Mixin System
**Operation Flow Mixins**:
- Individual: PreGet, PostGet, PreSet, PostSet, PreDelete, PostDelete, PreClear, PostClear, PreExists, PostExists
- Unified: PreOp (implements all pre-), PostOp (implements all post-)
- Each has priority property for execution order

**Metadata Processing**:
- **OnMetadata**: Base metadata handling
- **ScopedMetadataKeys**: Filter by metadata keys ('all'/'any' match strategy)
- **ScopedMetadataCustom**: Custom scope matching logic
- **allowSharedKeys**: Controls metadata key collision behavior

**Error Handling**:
- **OnError/OnFinally**: Exception and cleanup handling
- **mainFuncExclusive**: Additional handlers specifically for main storage function
- **Cascading Error Flow**: Main errors run main-specific handlers first, then general handlers (if not handled)
- **errorHandled Flag**: Adapters set ctx.errorHandled=true to prevent rethrowing and skip remaining handlers
- **Short-circuit Logic**: If main-specific handler sets errorHandled=true, general handlers are skipped

## Context Management Patterns
**PVCtx Factory Methods**:
- **PVCtx.fromCache()**: Full initialization with `extra`, `_perAdapterData`, `metaStorageCache` maps
- **PVCtx.minimal()**: Lightweight contexts with `storage: null`, `metaStorage: null`
- **Critical Issue**: `PVCtx.minimal()` doesn't initialize `metaStorageCache` (late final Map)
- **Solution Pattern**: Manual cache inheritance: `minictx.metaStorageCache = ctx.metaStorageCache`

**MetadataStorage Mixin System**:
- **Two Storage Strategies**: Flattened (`key::metakey`) vs Nested (map-based)
- **Automatic Strategy Selection**: `storageStrategyNested` boolean property
- **Standard Operations**: `metaGet()`, `metaSet()`, `metaDelete()` with transparent strategy handling
- **Smart Cleanup**: `metaDelete()` removes entire entries when metadata map becomes empty (nested only)
- **Cache Integration**: Uses `pctx.metaStorageCache` for performance optimization

## Adapter Factory Pattern
**PVAdapter**: Singleton-per-uid factory prevents duplicate adapters
- Static registry tracks instances by unique identifier
- Throws on duplicate UIDs to prevent conflicts
