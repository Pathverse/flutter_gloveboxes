# System Patterns: pvcache_hive

## Architecture Overview

### Core Components
1. **hboxcore.dart**: Central Hive management system
2. **pvco.dart**: JSON serialization with image support
3. **Storage Templates**: Multiple storage implementations
4. **Helper Extensions**: Convenience methods for common use cases

### Design Patterns

#### 1. Template Pattern
Storage implementations follow a consistent template structure:
- `SimpleHive<T>`: Basic Hive box wrapper
- `LiteHive`: PVCo-serialized simple storage
- `StdBox<T>`: Advanced storage with metadata support

#### 2. Factory Pattern
- `HBoxIntent`: Factory for creating box configurations
- `createPair<T>()`: Factory function for creating storage/metadata pairs

#### 3. Extension Pattern
- `PVCacheAddHive`: Extension for creating standard Hive caches
- `PVCacheAddImageHive`: Extension for image-specific caches

#### 4. Adapter Pattern
- Integrates with pvcache's adapter system
- Supports ExpiryAdapter for TTL management

## Key Technical Decisions

### Hive Integration Strategy
- Uses `BoxCollection` for multi-box management
- Supports encryption via `HiveCipher`
- Implements lazy loading for boxes

### Serialization Approach
- Custom JSON encoder/decoder for image data
- `PVCo` class wraps data with serialization capabilities
- Base64 encoding for ByteData in JSON

### Type Safety
- Generic implementations maintain compile-time type checking
- Constructor functions allow custom type handling
- Interface-based design (`PVCi`) for extensibility

## Component Relationships

```
pvcache_hive.dart (main export)
├── src/
│   ├── hboxcore.dart (Hive management)
│   └── pvco.dart (serialization)
└── templates/
    ├── storage/
    │   ├── simple.dart (basic storage)
    │   ├── lite.dart (PVCo storage)
    │   └── std.dart (advanced storage)
    └── helper/
        ├── basic.dart (standard extensions)
        └── image.dart (image-specific extensions)
```

## Critical Implementation Paths

### 1. Initialization Flow
1. Create `HBoxIntent` with environment and box names
2. Call `initHBox()` to initialize BoxCollection
3. Use `getBox()` to access specific boxes

### 2. Data Storage Flow
1. Data wrapped in `PVCo` for serialization
2. Custom encoder handles special types (images)
3. Stored in Hive box with metadata support

### 3. Image Caching Flow
1. Image converted to ByteData
2. ByteData encoded as base64 in JSON
3. Stored with automatic cache key generation
4. Retrieved and converted back to Image widget

## Error Handling Patterns
- Validation in `HBoxIntent` constructor
- Exception throwing for invalid operations
- Graceful handling of missing data
- Clear error messages for debugging

## Performance Considerations
- Lazy box loading to reduce startup time
- Efficient serialization for large data
- Memory management for image caching
- Batch operations where possible
