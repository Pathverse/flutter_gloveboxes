# PVCache: System Patterns

## Architecture Overview
- **Layered Design**: PVCache (API) → PVCacheCore (engine) → Adapters (storage) → Storage Systems
- **Loop-Based Hook System**: ALL adapters in configuration participate in operations
- **Environment Isolation**: Each environment has independent configuration and storage
- **Security Automation**: Automatic adapter selection based on security requirements
- **Metadata Integration**: Built-in metadata support with secure handling

## Core Design Patterns

### 1. Multi-Environment Routing
```
User Request (env:key) → Key Parser → Environment Router → Loop-Based Hook Processing → Storage Operation
```

### 2. Adapter Pattern Implementation
```
PVAdapter Interface
├── Storage Adapters (Full Implementation)
│   ├── StdAdapter (Hive Storage)
│   └── SecureAdapter (Flutter Secure Storage)
└── Middleware Adapters (Hooks Only)
    ├── LRUAdapter (Eviction Logic via Pre/Post Hooks) ✅ NOW FUNCTIONAL
    ├── LFUAdapter (Frequency Tracking via Pre/Post Hooks) ✅ NOW FUNCTIONAL
    └── [Future Custom Middleware]
```

**Two Types of Adapters:**

1. **Storage Adapters**: Implement all storage methods (get, set, delete, etc.)
   - Handle actual data persistence
   - Example: StdAdapter, SecureAdapter
   - Used as primary adapters in overwrite settings

2. **Middleware Adapters**: Only implement hooks and lifecycle methods
   - Use `noSuchMethod` for storage operations they don't handle
   - Provide additional behavior through pre/post hooks
   - Example: LRUAdapter, LFUAdapter
   - ALL adapters in config.adapters get their hooks called ✨ CRITICAL FIX
   - **MUST store metadata as flat key-value pairs only** ⚠️ CRITICAL RULE

### 3. Loop-Based Hook System (REDESIGNED) ✅
```
OLD PATTERN (BROKEN):
final adapter = config.adapters[config.overwriteSet]!;
if (adapter.hasPreMethods) {
  await adapter.preSet(...);  // Only StdAdapter called, LRU/LFU skipped!
}

NEW PATTERN (FIXED):
for (final adapterEntry in config.adapters.entries) {
  final currentAdapter = adapterEntry.value;
  if (currentAdapter.hasPreMethods && shouldContinue) {
    await currentAdapter.preSet(...);  // ALL adapters called, including LRU/LFU!
  }
}
```

### 4. Configuration-Driven Behavior
```
Registration → PVCacheConfig → Multiple Adapter Loop Processing → Storage Setup → Runtime Operations
```

### 5. Security Automation Flow
```
secureData Flag → Adapter Override → Storage Backend → Automatic Encryption/Decryption
```

## Component Architecture

### 1. PVCache (API Layer)
- **Responsibility**: Public API, key parsing, environment routing, adapter loop processing
- **Key Pattern**: Supports both `env:key` and plain `key` formats
- **Method Routing**: Routes to KV, encrypted, or custom environment handlers
- **Hook Processing**: Loops through ALL adapters for comprehensive hook execution ✨ FIXED
- **Error Handling**: Provides clear error messages for invalid operations

### 2. PVCacheCore (Engine Layer)
- **Responsibility**: Environment management, box initialization, configuration storage
- **Registration**: Manages environment configurations before initialization
- **Initialization**: Sets up Hive boxes and secure storage
- **Box Management**: Lazy loading and lifecycle management

### 3. Adapter Layer
- **Responsibility**: Abstract storage operations, lifecycle hooks
- **Interface**: Standardized methods for all storage operations
- **Loop Processing**: ALL adapters participate in pre/post hook chains ✨ CRITICAL FIX
- **Isolation**: Each adapter operates independently
- **Two Patterns**:
  - **Storage Adapters**: Full storage implementation
  - **Middleware Adapters**: Hooks-only with `noSuchMethod` for unsupported operations

### 4. Storage Layer
- **Hive**: Fast, local NoSQL database for non-secure data
- **Flutter Secure Storage**: Encrypted storage for sensitive data
- **Key Management**: Automatic key prefixing for environment isolation

## Data Flow Patterns (REDESIGNED)

### 1. Set Operation Flow (WITH LOOP-BASED HOOKS) ✅
```
PVCache.set(key, value, metadata?)
├── Parse key → (env, actualKey)
├── Route to environment handler
├── Get adapter configuration
├── LOOP: For each adapter in config.adapters.entries
│   ├── Check adapter.hasPreMethods && shouldContinue
│   ├── Call adapter.preSet() [LRU/LFU eviction logic here!]
│   └── Update finalValue and shouldContinue
├── If shouldContinue: Execute storage operations
│   ├── storageAdapter.set(finalValue)
│   └── metaAdapter.setMeta() [if metadata]
└── LOOP: For each adapter with hasPostMethods
    └── Call adapter.postSet()
```

### 2. Get Operation Flow (WITH LOOP-BASED HOOKS) ✅
```
PVCache.get(key)
├── Parse key → (env, actualKey)
├── Route to environment handler
├── Get adapter configuration
├── Fetch metadata with metaAdapter.getMeta()
├── LOOP: For each adapter in config.adapters.entries
│   ├── Check adapter.hasPreMethods && shouldContinue
│   ├── Call adapter.preGet() [LRU/LFU access tracking here!]
│   └── Update hookValue and shouldContinue
├── If shouldContinue: Execute storage operations
│   └── storageAdapter.get()
├── LOOP: For each adapter with hasPostMethods
│   └── Call adapter.postGet()
└── Return value
```

### 3. Hook Chain Processing Pattern ✅
```
Input: (value, shouldContinue=true)
│
├── For adapter1 in adapters:
│   ├── If hasPreMethods && shouldContinue:
│   │   ├── (hookValue, hookContinue) = adapter1.preSet(...)
│   │   ├── value = hookValue
│   │   └── shouldContinue = shouldContinue && hookContinue
│   └── Continue to next adapter
│
├── For adapter2 in adapters: [LRU/LFU Adapter]
│   ├── If hasPreMethods && shouldContinue:
│   │   ├── (hookValue, hookContinue) = adapter2.preSet(...)  [EVICTION!]
│   │   ├── value = hookValue
│   │   └── shouldContinue = shouldContinue && hookContinue
│   └── Continue to next adapter
│
└── Final: (finalValue, finalShouldContinue)
```

## Key Formatting Patterns

### 1. Environment Key Format
```
Input: "user:profile"
Parse: env="user", key="profile"
Storage: depends on adapter configuration
```

### 2. Secure Storage Keys
```
Data: "{environmentName}:{actualKey}"
Meta: "{environmentName}-meta:{actualKey}"
Example: "secure:api_key" and "secure-meta:api_key"
```

### 3. Hive Box Keys
```
Data: stored directly as key
Meta: stored in "{environmentName}-meta" box
Environment isolation through separate boxes
```

## Configuration Patterns

### 1. Multi-Adapter Configuration (ENABLED) ✅
```dart
// Example: LRU cache with standard storage
await PVCache.register('lru_cache', 
  adapters: LinkedHashMap.from({
    'std': StdAdapter(),      // Storage implementation
    'lru': LRUAdapter(maxSize: 3),  // Eviction middleware
  }),
  overwriteSet: 'std',       // Storage operations
  overwriteGet: 'std',
  // ALL adapters get hooks called automatically!
);
```

### 2. Auto-Configuration Logic
```dart
final dataAdapter = secureData ? 'secure' : 'std';
final metaAdapter = secureMeta ? 'secure' : 'std';

// Apply to all operation overrides
this.overwriteGet = overwriteGet ?? dataAdapter;
this.overwriteSet = overwriteSet ?? dataAdapter;
// ... etc
```

### 3. Adapter Registration
```dart
// Always include both adapters for flexibility
this.adapters['std'] = StdAdapter();
this.adapters['secure'] = SecureAdapter();
// Custom middleware adapters added to same map
```

## Eviction Patterns (NOW FUNCTIONAL) ✅

### 1. LRU (Least Recently Used)
```dart
class LRUAdapter implements PVAdapter {
  @override
  Future<(dynamic, bool)> preSet(key, value, metadata, config) async {
    await _initializeTracking(config);
    await _evictIfNeeded(config);  // Remove oldest if cache full
    _updateAccessTime(key);        // Track new item access
    return (value, true);          // Continue with storage
  }
  
  @override
  Future<(dynamic, bool)> preGet(key, metadata, config) async {
    _updateAccessTime(key);        // Update access time for LRU
    return (null, true);           // Continue with storage
  }
}
```

### 2. LFU (Least Frequently Used)
```dart
class LFUAdapter implements PVAdapter {
  @override
  Future<(dynamic, bool)> preSet(key, value, metadata, config) async {
    await _initializeTracking(config);
    await _evictIfNeeded(config);  // Remove least frequent if cache full
    _initializeAccessTracking(key); // Set count=1 for new items
    return (value, true);          // Continue with storage
  }
  
  @override
  Future<(dynamic, bool)> preGet(key, metadata, config) async {
    _incrementAccessCount(key);    // Increase frequency count
    return (null, true);           // Continue with storage
  }
}
```

### 3. Eviction Integration Pattern
```
Cache Operation Triggered
├── Loop through all adapters
├── Call LRU/LFU preSet/preGet hooks
├── Eviction logic executes BEFORE storage
├── Cache size maintained within limits
└── Continue with actual storage operation
```

## Error Handling Patterns

### 1. Environment Validation
- Reserved names ('kv', 'encrypted') blocked from custom registration
- Duplicate environment names prevented
- Registration only allowed before initialization

### 2. Security Boundaries
- KV environment blocks metadata operations
- Encrypted environment handles metadata automatically
- Clear error messages for invalid operations

### 3. Storage Failures
- Null handling for missing values
- JSON parsing fallbacks for corrupted metadata
- Graceful degradation for storage errors

### 4. Hook Chain Failures
- Individual adapter failures don't break the chain
- shouldContinue=false allows graceful operation halting
- Debug output shows which adapter caused issues

## Debugging Patterns (COMPREHENSIVE) ✅

### 1. Adapter Discovery
```
🔧 Available adapters: [std, lru]
🔧 Storage adapter=StdAdapter, metaAdapter=StdAdapter
```

### 2. Hook Execution Tracing
```
🪝 Calling preSet for std (StdAdapter)
🪝 std.preSet returned value="item", continue=true
🪝 Calling preSet for lru (LRUAdapter) 
📊 LRU.preSet: BEFORE eviction - size=3, maxSize=3
🔍 LRU._evictIfNeeded: Eviction needed!
🗑️ LRU._evictIfNeeded: Evicting key="item1"
🪝 lru.preSet returned value="item", continue=true
```

### 3. Eviction Process Tracing
```
📊 Current size=3, maxSize=3
📈 Current access times: {item1: 2025-01-01T..., item2: 2025-01-01T...}
🗑️ Items to evict: [item1]
🗑️ Evicting key="item1" accessed at 2025-01-01T...
✅ Successfully evicted key="item1"
🎯 After eviction - size=2
```

## Adapter Development Rules ⚠️ CRITICAL

### Metadata Storage Requirements
**ALL adapters MUST follow these storage rules to avoid Hive serialization errors:**

1. **Flat Structure Only**: Store metadata as single-layer Map<String, String>
   ```dart
   // ✅ CORRECT - Flat key-value pairs
   {"item1": "2025-01-01T12:00:00.000Z", "item2": "2025-01-01T13:00:00.000Z"}
   
   // ❌ WRONG - Nested objects cause HiveError
   {"keys": ["item1", "item2"], "config": {"maxSize": 3}}
   ```

2. **String Values Only**: All metadata values must be strings
   ```dart
   // ✅ CORRECT - Convert to strings
   {"item1": "5", "maxSize": "100", "lastUpdate": "2025-01-01T..."}
   
   // ❌ WRONG - Non-string values
   {"item1": 5, "maxSize": 100, "lastUpdate": DateTime.now()}
   ```

3. **Index Storage Pattern**: For lists/arrays, use indexed keys
   ```dart
   // ✅ CORRECT - Indexed entries for ordered data
   {"__index_0": "item1", "__index_1": "item2", "__index_2": "item3"}
   
   // ❌ WRONG - Array storage
   {"sortedIndex": ["item1", "item2", "item3"]}
   ```

4. **Prefix Internal Keys**: Use double underscores for adapter-internal data
   ```dart
   // ✅ CORRECT - Clear separation of internal vs user data
   {"__lru_index_0": "item1", "__lru_maxSize": "100"}
   ```

### Error Prevention
- **Hive CollectionBox**: Requires `fromJson` converters for non-primitive types
- **Simple Solution**: Keep all metadata as `Map<String, String>` format
- **Validation**: Test that metadata can be stored/retrieved without serialization errors

## Extension Patterns

### 1. Storage Adapters (Full Implementation)
```dart
class MyStorageAdapter implements PVAdapter {
  // Implement ALL storage methods: get, set, delete, getMeta, etc.
  // Provide actual data persistence
  // Can be used as primary adapter in overwrite settings
}
```

### 2. Middleware Adapters (Hooks Only)
```dart
class MyMiddlewareAdapter implements PVAdapter {
  @override
  bool get hasPreMethods => true;  // Enable hook participation
  
  // Only implement lifecycle methods: init, clear, clearMeta
  // Implement pre/post hooks for custom behavior
  // Use noSuchMethod for storage operations
  
  @override
  Future<(dynamic, bool)> preSet(key, value, metadata, config) async {
    // Custom logic here - will be called in adapter loop!
    return (value, true);
  }
  
  @override
  dynamic noSuchMethod(Invocation invocation) {
    throw UnsupportedError('Middleware adapter only provides hooks');
  }
}
```

### 3. Custom Environment Configuration
```dart
await PVCache.register('myEnv', 
  adapters: LinkedHashMap.from({
    'storage': MyStorageAdapter(),       // Primary storage
    'middleware1': MyMiddlewareAdapter(), // Additional behavior
    'middleware2': AnotherMiddleware(),   // More behavior
  }),
  // Only storage adapters in overwrite settings
  overwriteGet: 'storage',
  overwriteSet: 'storage',
  // ALL adapters will get their hooks called automatically!
);
```

## Performance Patterns

### 1. Lazy Initialization
- Hive boxes opened on-demand
- Adapter initialization only when first used
- Configuration validation at registration time

### 2. Efficient Hook Processing
- hasPreMethods/hasPostMethods flags prevent unnecessary calls
- shouldContinue flag allows early termination
- Direct adapter method calls with minimal overhead

### 3. Eviction Efficiency
- Cached sorted indices for LRU/LFU
- Persistent metadata reduces startup overhead
- Efficient bulk eviction when needed

### 4. Environment Isolation
- No cross-environment data access
- Independent storage systems
- Separate metadata management

## Security Patterns

### 1. Automatic Encryption
- No manual key management required
- System handles encryption/decryption
- Secure metadata format for complex scenarios

### 2. Environment-Level Security
- Security configured per environment
- Mixed security levels supported
- Clear security boundaries

### 3. Key Isolation
- Environment prefixes prevent collisions
- Separate metadata storage
- No shared encryption keys between environments
