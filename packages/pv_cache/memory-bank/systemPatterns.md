# PV Cache: System Patterns

## Architecture
- **Component-based**: PVCacheCentral (core ops), PVCacheEnvConfig (config), PVCacheStorageType (base), PVCache (API)
- **Pre/Post Operation System**: Flexible hooks for custom processing before and after operations
- **SHA1 Hash System**: 8-character hashes for meta box names instead of UUIDs
- **Special Key Protection**: Reserved `__key__` format for internal tracking
- **Persistent Tracking**: LRU/LFU access patterns survive browser restarts
- **Smart Fragment System**: Dynamic key generation with field interpolation and glob pattern matching
- **Modular Function Architecture**: Single-responsibility functions for maintainable code

## Core Patterns

### Pre/Post Operation Flow
```
User Request → preOperation → Core Logic → postOperation → Result
```

### Meta Hash Generation
```
metaId (string) → SHA1 Hash → 8-character meta box name
```

### Special Key Protection
```
Key Validation → Check for __pattern__ → Block if special → Allow if normal
```

### Persistent Tracking
```
Operation → Update in-memory maps → Save to special metadata keys → Persist across restarts
```

### Smart Fragment Processing
```
Data Load → Glob Pattern Match → Field Interpolation → Dynamic Key Generation → Fragment Storage
```

### Modular Fragment Architecture
```
_loadFragmentData() → _fetchDataFromCallback() → _hasFragments() → _processFragments()
                                                                    ↓
_processRegularFragments() ← _processSmartFragments() ← _getDataAtPath()
```

## Type Safety Strategy
- All cache APIs guarantee `Map<String, dynamic>` for maps and proper typing for lists of maps
- Deep casting system ensures no LinkedMap or _JsonMap is ever returned
- Type safety is enforced at all API and storage layers
- Special key validation prevents internal conflicts

## Data Flow
- User Request → Key Validation → Pre-processing → Storage Layer → Post-processing → Safe Typed Result

## Storage Type Patterns

### SimpleExpiry
- Time-based validation with metadata expiry timestamps
- Automatic cleanup of expired items
- Metadata-driven expiry checking

### SimpleLRU
- Access time tracking with persistent storage
- Eviction based on oldest access time
- Special keys: `__access_times__`, `__access_counts__`

### SimpleLFU
- Access frequency tracking with persistent storage
- Eviction based on lowest access count (time as tie-breaker)
- Special keys: `__access_times__`, `__access_counts__`

### AdvancedFragment
- **Regular Fragments**: Path-based fragmentation with callback loading
- **Smart Fragments**: Dynamic key generation with field interpolation
- **Glob Pattern Matching**: Flexible path matching for both fragment types
- **Modular Processing**: Separate functions for regular and smart fragment handling
- **Fragment References**: `@fragment:key` format for lightweight references

## Smart Fragment Patterns

### Field Interpolation
```
Template: "user_{id}_{name}"
Data: {"id": 123, "name": "john"}
Result: "user_123_john"
```

### Glob Pattern Matching
```
Pattern: "x/x*"
Data: {"x": {"x1": {...}, "x2": {...}}}
Matches: ["x/x1", "x/x2"]
```

### Dynamic Key Generation
```
SmartFragment("users/*", "user_{id}_{name}")
Data: {"users": {"user1": {"id": 101, "name": "alice"}}}
Generated Key: "user_101_alice"
```

## Modular Function Patterns

### Single Responsibility
- Each function has one clear purpose
- Functions are focused and testable
- Clear separation of concerns
- Easy to extend and maintain

### Orchestration Pattern
- High-level functions orchestrate lower-level operations
- `_processFragments()` coordinates regular and smart fragment processing
- `_storeFragmentData()` coordinates storage of different fragment types

### Error Handling
- Each function handles its own errors appropriately
- Callback failures are isolated and don't affect other operations
- Graceful degradation when fragments fail to process

## Guarantees
- No LinkedMap leakage
- Nested structure safety
- Performance optimized
- Backward compatible
- Persistent behavior across browser restarts
- Protection against internal key conflicts
- Efficient meta box naming with SHA1 hashes
- Semantic cache keys through smart fragments
- Modular design for maintainable code
- Single-responsibility functions for better testing
