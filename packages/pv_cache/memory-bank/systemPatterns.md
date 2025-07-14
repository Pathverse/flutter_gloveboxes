# System Patterns: PV Cache

##### 2. Simplified Box Structure (NEW)
- **Decision**: Use direct box naming for better compatibility
- **Rationale**: Improved web platform support and initialization reliability
- **Implementation**: 
  - Data boxes use consistent naming pattern
  - Metadata box uses dedicated naming for fast access
  - Simplified initialization sequence

#### 3. Simplified Orchestrator Pattern
- **Decision**: Main wrapper becomes a simple delegator
- **Rationale**: Single entry point with clear responsibility delegation
- **Implementation**: Minimal wrapper that delegates to appropriate components

#### 4. Component Specialization
- **Decision**: Each component handles one aspect of functionality
- **Rationale**: Single responsibility principle and easier maintenance
- **Implementation**: Focused modules with clear boundariese Overview

### Core System Design (Updated)
```
PVCache (Singleton)
├── CacheWrapper (Simple Orchestrator)
    ├── CacheStorage (Core Operations)
    ├── CacheEncryption (Crypto Operations)
    ├── CacheTracking (LRU/LFU Management)
    └── CacheUtils (Shared Utilities)
├── Hive LazyBox (Primary Storage)
├── Hive SubscriberBox (Metadata/LRU Tracking)
└── Flutter Secure Storage (Encryption Keys)
```

### Key Architectural Decisions

#### 1. Component-Based Architecture (IMPLEMENTED)
- **Decision**: Split monolithic wrapper into focused components
- **Rationale**: Better maintainability, testability, and separation of concerns
- **Implementation**: Four specialized classes + simplified orchestrator

#### 2. Simplified Box Structure (NEW)
- **Decision**: Use direct box naming instead of collection parameters
- **Rationale**: Better web compatibility and initialization reliability
- **Implementation**: 
  - Data boxes: `__pv_cache__box_{name}` (LazyBox for memory efficiency)
  - Metadata box: `__pv_cache__meta` (Regular Box for fast access)
  - Consistent naming pattern across all storage

#### 3. Simplified Orchestrator Pattern
- **Decision**: CacheWrapper becomes a simple delegator
- **Rationale**: Single entry point with clear responsibility delegation
- **Implementation**: 22-line wrapper that delegates to appropriate components

#### 4. Component Specialization
- **Decision**: Each component handles one aspect of caching
- **Rationale**: Single responsibility principle and easier maintenance
- **Components**:
  - `CacheStorage`: All storage operations and metadata
  - `CacheEncryption`: Cryptographic operations and key management
  - `CacheTracking`: LRU/LFU tracking and eviction
  - `CacheUtils`: Pattern matching and utilities

## Component Relationships

### PVCache → Component Flow (Updated)
```dart
PVCache.putWithOptions(key, value, options)
  ↓
CacheWrapper.store(key, value, options)
  ↓
CacheStorage.store(key, value, options)
  ↓
- CacheUtils.validateOptions(options)
- CacheUtils.matchesSensitive(key, patterns)
- CacheEncryption.encryptWithPrivateKey(...) [if needed]
- CacheTracking.updateOnStore(key, options)
  ↓
Store in appropriate Hive box
```

### Component Interaction Pattern (Updated)
```dart
Component Dependencies:
Main Component → Supporting Components
Encryption Component → (isolated, no dependencies)
Tracking Component → (isolated, minimal dependencies)
Utilities Component → (isolated, pure utilities)
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
