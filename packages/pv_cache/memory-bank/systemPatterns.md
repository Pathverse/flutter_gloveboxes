# PV Cache: System Patterns

## Architecture
- **Component-based**: PVCacheCentral (core ops), PVCacheEnvConfig (config), PVCacheStorageType (base), PVCache (API)
- **Pre/Post Operation System**: Flexible hooks for custom processing before and after operations
- **SHA1 Hash System**: 8-character hashes for meta box names instead of UUIDs
- **Special Key Protection**: Reserved `__key__` format for internal tracking
- **Persistent Tracking**: LRU/LFU access patterns survive browser restarts

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

## Guarantees
- No LinkedMap leakage
- Nested structure safety
- Performance optimized
- Backward compatible
- Persistent behavior across browser restarts
- Protection against internal key conflicts
- Efficient meta box naming with SHA1 hashes
