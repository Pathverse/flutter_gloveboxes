# System Patterns: PV Cache

## Architecture
- Component-based: CacheStorage (core ops), CacheEncryption (crypto), CacheTracking (eviction), CacheUtils (validation, dependency logic).
- Dependency logic is handled in CacheUtils and enforced in CacheStorage.
- Supports `ENCRYPTED:x`, `X:Y`, `X:*` dependency patterns.
- If `sensitive` is set, `depends` always refers to a secure storage key.
- Error handling and validation are centralized for maintainability.
- Design is modular, maintainable, and easy to extend.
