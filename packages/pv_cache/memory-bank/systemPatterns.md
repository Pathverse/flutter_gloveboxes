# System Patterns: PV Cache

## Architecture Overview

### Core System Design
```
PVCache (Singleton)
├── CacheWrapper (Custom Implementation Layer)
├── Hive LazyBox (Primary Storage)
├── Hive SubscriberBox (Metadata/LRU Tracking)
└── Flutter Secure Storage (Encryption Keys)
```

### Key Architectural Decisions

#### 1. Singleton Pattern for Cache Instance
- **Decision**: Use singleton pattern for PVCache instance
- **Rationale**: Ensures consistent state across app, prevents multiple storage instances
- **Implementation**: `PVCache.getInstance()` with null-safe lazy initialization

#### 2. Wrapper-Based Options System
- **Decision**: CacheWrapper handles all CacheOptions logic
- **Rationale**: Separates concerns, allows complex option combinations without polluting main API
- **Implementation**: `CacheWrapper.store/get/delete` methods process options

#### 3. Dual Box Strategy
- **Decision**: Separate boxes for data (`lazyBox`) and metadata (`subscriberBox`)
- **Rationale**: Optimizes performance, enables LRU tracking without data corruption
- **Implementation**: Main storage in lazyBox, LRU counters and metadata in subscriberBox

## Component Relationships

### PVCache → CacheWrapper Flow
```dart
PVCache.putWithOptions(key, value, options)
  ↓
CacheWrapper.store(key, value, options)
  ↓
- Process encryption (if options.encrypted)
- Handle sensitive fields (if options.sensitive)
- Apply expiry logic (if options.lifetime)
- Update LRU tracking (if options.lru)
  ↓
Store in appropriate Hive box
```

### CacheOptions Processing Pattern
```dart
CacheOptions validation → 
Security checks → 
Storage strategy selection → 
Data transformation → 
Storage execution → 
Metadata updates
```

## Design Patterns in Use

### 1. Options Pattern
- **Purpose**: Configure cache behavior without method explosion
- **Implementation**: CacheOptions class with validation rules
- **Benefits**: Type safety, clear configuration, extensibility

### 2. Facade Pattern
- **Purpose**: Simplify complex storage operations
- **Implementation**: PVCache provides simple API, delegates to CacheWrapper
- **Benefits**: Clean public API, hidden complexity

### 3. Strategy Pattern (Implicit)
- **Purpose**: Different storage strategies based on options
- **Implementation**: CacheWrapper selects strategy based on CacheOptions
- **Benefits**: Flexible behavior, single interface

### 4. Factory Pattern
- **Purpose**: Consistent cache instance creation
- **Implementation**: `getInstance()` method with initialization
- **Benefits**: Controlled instantiation, proper setup

## Critical Implementation Paths

### 1. Sensitive Data Protection Path
```
1. CacheOptions validation (sensitive requires depends)
2. Master key retrieval from secure storage
3. JSON field identification and extraction
4. Selective encryption of sensitive fields
5. Recombination of encrypted/plain data
6. Storage with dependency metadata
```

### 2. Expiry Management Path
```
1. Timestamp recording at storage time
2. Expiry calculation (current + lifetime)
3. Metadata storage with expiry info
4. Retrieval time validation
5. Automatic cleanup if expired
6. Return null for expired entries
```

### 3. LRU/LFU Eviction Path
```
1. Access tracking in subscriberBox
2. Count increment on each access
3. Size limit enforcement
4. Eviction candidate selection (LRU vs LFU)
5. Cleanup of least used entries
6. Metadata synchronization
```

## Data Flow Patterns

### Storage Flow
```
User Data → Validation → Transformation → Encryption → Storage → Metadata Update
```

### Retrieval Flow
```
Key Lookup → Expiry Check → Decryption → Transformation → Type Casting → Return
```

### Cleanup Flow
```
Expiry Scan → Eviction Selection → Batch Deletion → Metadata Cleanup → Synchronization
```

## Error Handling Patterns

### Graceful Degradation
- Encryption failures fall back to secure storage warnings
- Test environment handling for flutter_secure_storage
- Non-critical failures logged but don't crash operations

### Validation-First Approach
- CacheOptions validated at construction time
- Early failure prevents invalid state
- Clear error messages for constraint violations

### Isolation Pattern
- Each cache operation isolated in try-catch
- Failures in one operation don't affect others
- Consistent error types and messages

## Performance Optimization Patterns

### Lazy Loading
- Hive LazyBox for on-demand data loading
- Metadata cached separately for fast access checks
- Initialization deferred until first use

### Batch Operations
- Multiple key retrieval optimized
- Bulk cleanup operations
- Metadata updates batched when possible

### Memory Management
- LRU/LFU automatic cleanup
- Configurable size limits
- Proactive eviction before memory pressure

## Security Patterns

### Defense in Depth
- Multiple encryption layers (secure storage + field encryption)
- Key isolation (master keys separate from data)
- Dependency validation prevents orphaned encrypted data

### Principle of Least Privilege
- Only specified fields encrypted in sensitive mode
- Encryption keys accessible only when needed
- Clear separation between encrypted and plain data

### Fail-Secure Design
- Invalid encryption keys cause access denial
- Expired dependencies invalidate dependent data
- Unknown decryption errors return null safely
