# System Patterns & Architecture

## Component Hierarchy
```
PVCACHER (Static Interface)
├── Namespace/Alias Resolution
├── Conflict Detection
└── PVCacher[] (Instance Management)
    ├── PVCacheHandle (Storage Abstraction)
    │   ├── Lifecycle Hooks (before/after operations)
    │   ├── Construction Hooks (onConstruct)
    │   └── Global Hooks (beforeAnything/afterAnything)
    ├── PVCacheAdapter[] (Behavior Extensions)
    └── PVCacheCtx (Operation Context)
        ├── Operation Metadata
        ├── Shared Context Map
        └── Result Management
```

## Core Design Patterns

### Multi-Level Singleton Management
- **PVCacher**: Factory pattern with namespace-based instances
- **PVCACHER**: Static interface with alias/namespace management  
- **Template Level**: Shared instance management (HiveCollectionTop0)
- Exposed `instances` map for direct access

### Adapter Pattern with Advanced Hooks
- Base class with capability flags (hasPreset, hasPostSet, hasPreHandlerOperation, etc.)
- Mixin composition for precise behavior attachment
- Runtime capability detection
- **NEW**: preHandlerOperation/postHandlerOperation hooks for metadata-dependent operations
- Lifecycle integration with context sharing

### Context Management
- Rich context objects carry operation state
- Hash-based keys (SHA256) for metadata management
- Shared state maps enable adapter communication
- Result processing and return value handling
- Metadata loading timing ensures adapter access

### Enhanced Lifecycle Pattern
```
Static Interface → Namespace Resolution → Instance Retrieval
    ↓
Context Creation → Options Processing → Adapter Pre-Hooks
    ↓  
Handle Lifecycle:
  beforeAnything (loads metadata)
    ↓
  preHandlerOperation (NEW - metadata available)
    ↓  
  operation
    ↓
  postHandlerOperation (NEW - post-operation processing)
    ↓
  afterAnything
    ↓
Adapter Post-Hooks → Result Processing → Return
```

### Expiry Management Pattern
- UTC timestamp-based expiry with multiple input formats
- Metadata persistence through StdHandler infrastructure
- Automatic cleanup during get operations
- preHandlerOperation timing ensures metadata access
- Graceful expiry handling with operation abortion

## Implementation Patterns

### Template Infrastructure - COMPLETE ✅
- **StdHandler**: Production template with Hive persistence and SHA256-based metadata
- **ExpiredAdapter**: Automatic expiry management with UTC timestamps and cleanup
- **VerboseExpiredAdapter**: Debug version with comprehensive operation logging  
- **ExpiryUtils**: Convenience methods for common expiry patterns (seconds, minutes, hours, days)
- **HiveCollectionTop0**: Shared infrastructure for consistent template development
- **Debug Infrastructure**: Comprehensive logging and troubleshooting capabilities

### Metadata Architecture - ENHANCED
- SHA256-based keys separate data from metadata
- Metadata boxes for each namespace store operation metadata
- Context options automatically populated with metadata during beforeAnything
- **NEW**: preHandlerOperation timing ensures adapter access to loaded metadata
- Persistent metadata survives cache restarts and enables sophisticated features

## Adapter Hook System - EXTENDED

### Standard Operation Hooks
- **preSet/postSet**: Standard set operation hooks
- **preGet/postGet**: Standard get operation hooks  
- **preRemove/postRemove**: Standard remove operation hooks
- **preClear/postClear**: Standard clear operation hooks
- **preHas/postHas**: Standard has operation hooks

### Handler Operation Hooks - NEW ✅
- **preHandlerOperation**: Runs after beforeAnything, metadata available
- **postHandlerOperation**: Runs after operation, before afterAnything
- **Critical Timing**: Enables metadata-dependent operations like expiry checking
- **Use Cases**: Expiry management, validation, logging, metrics

### Execution Timing Critical for Expiry
1. **beforeAnything**: Loads metadata from storage into ctx.options
2. **preHandlerOperation**: Expiry adapter checks loaded metadata, can abort operation  
3. **operation**: Only runs if not aborted by adapter
4. **postHandlerOperation**: Post-operation processing
5. **afterAnything**: Final cleanup

### StdHandler Architecture
- **Hive Integration**: Collection management with type safety
- **Metadata System**: SHA256-based keys with separate storage  
- **Cache Warming**: Pre-loading metadata into memory
- **Namespace Safety**: Automatic collision prevention

### Static Interface Features
- **Alias System**: Dynamic aliasing with conflict detection
- **Resolution Priority**: Aliases checked before direct namespaces
- **Instance Integration**: Direct use of PVCacher.instances
- **Lifecycle Management**: Async iteration over all instances

### Context Flow Details
1. **Static Resolution**: Namespace/alias resolution with validation
2. **Instance Retrieval**: Singleton access with error handling
3. **Context Enrichment**: SHA256 hashing, metadata loading
4. **Adapter Orchestration**: Pre/post hook coordination
5. **Handle Execution**: Complex lifecycle management
6. **Result Processing**: Context result extraction and return

## Handle Lifecycle Specification
- **onConstruct**: Called during instance creation
- **init**: Called during cache initialization
- **beforeAnything/afterAnything**: Global operation hooks
- **Operation-specific**: beforeSet/afterSet, beforeGet/afterGet, etc.
- **Ordering Control**: `beforeAnythingOuter` flag controls execution sequence

## Template System Architecture
- **Shared Infrastructure**: HiveCollectionTop0 provides common persistence
- **Object Abstraction**: StdObject handles serialization complexity
- **Registration System**: Template-level namespace management
- **Conflict Prevention**: Built-in safeguards against naming conflicts

## Extension Points
- **Custom Handles**: Implement full lifecycle hooks
- **Custom Adapters**: Use mixin composition for capabilities
- **Template Development**: Build on shared infrastructure patterns
- **Static Interface**: Leverage alias and namespace systems
