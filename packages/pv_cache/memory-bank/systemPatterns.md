# PV Cache: System Patterns (Public)

## Architecture
- Component-based: CacheStorage (core ops), CacheEncryption (crypto), CacheTracking (eviction), CacheUtils (validation, dependency logic)
- Modular, maintainable, and extensible design
- Supports secure storage, expiry, LRU/LFU, grouping, and JSON utilities

## Type Safety Strategy
- All cache APIs guarantee `Map<String, dynamic>` for maps and proper typing for lists of maps, including nested structures
- Deep casting system ensures no LinkedMap or _JsonMap is ever returned
- Type safety is enforced at all API and storage layers

## Data Flow
- User Request → Cache Method → Storage Layer → Type Conversion → Safe Typed Result

## Guarantees
- No LinkedMap leakage
- Nested structure safety
- Performance optimized
- Backward compatible
