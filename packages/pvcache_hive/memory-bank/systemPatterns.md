# System Patterns: pvcache_hive

## Architecture Overview

### Core Components
1. **hboxcore.dart**: Central Hive management system with encryption support
2. **pvci.dart**: JSON serialization with encryption and image support
3. **Storage Templates**: Multiple storage implementations with type safety
4. **Helper Extensions**: Convenience methods for common use cases

### Design Patterns

#### 1. Template Pattern
Storage implementations follow a consistent template structure:
- `SimpleHive<T>`: Basic Hive box wrapper
- `LiteHive`: PVCo-serialized simple storage
- `StdBox<T>`: Advanced storage with metadata support

#### 2. Factory Pattern
- `HBoxIntent`: Factory for creating box configurations with perBoxConfigs
- `createPair<T>()`: Factory function for creating storage/metadata pairs

#### 3. Extension Pattern
- `PVCacheAddHive`: Extension for creating standard Hive caches
- `PVCacheAddImageHive`: Extension for image-specific caches
- `HiveCipherExt`: Extension for string encryption/decryption

#### 4. Adapter Pattern
- Integrates with pvcache's adapter system
- Supports ExpiryAdapter for TTL management

#### 5. Configuration Pattern
- **HPerBoxConfig**: Type-safe box configuration with fromJson
- **Box Registration**: Configuration-driven box type determination
- **Intent-Based Access**: HBoxIntent controls box access and configuration

## Key Technical Decisions

### Hive Integration Strategy
- Uses `BoxCollection` for multi-box management
- Supports encryption via `HiveCipher` with proper key management
- Implements lazy loading for boxes with configuration-driven typing

### PRODUCTION Encryption Architecture (PointyCastle-based)
- **✅ STABLE**: Replaced unreliable HiveCipher with robust PointyCastle solution
- **PVAesEncryptor**: AES-256-CTR (not CBC) - handles any data length without padding
- **Dual IV Modes**: 
  - **Deterministic**: Content + seed based IV for caching consistency
  - **Lite Mode**: Static seed-based IV for performance optimization
- **Cross-Session Reliable**: Fixed seed management ensures consistent encryption keys
- **Cross-Platform Verified**: Identical behavior on web, desktop, and mobile
- **SHA-256 Key Derivation**: Seed strings converted to consistent 32-byte keys
- **Base64 Encoding**: Safe string representation of encrypted binary data

### Serialization Approach
- **PVCo Wrapper**: All data wrapped in PVCo with typeCode system
- **Automatic JSON**: Hive handles toJson()/fromJson() calls automatically
- **Type Safety**: CollectionBox<PVCo> vs CollectionBox<Map> strict enforcement
- **Encryption Layer**: JSON encrypted transparently when cipher configured

### Box Configuration System
- **Configuration-Driven**: Box type determined by presence of HPerBoxConfig
- **Strict Typing**: CollectionBox<PVCo> when configured, CollectionBox<Map> when not
- **Meta Box Challenge**: Meta boxes need separate config registration
- **Registration Timing**: Configs must be registered before box opening

## Component Relationships

```
HBoxIntent → HPerBoxConfig → CollectionBox<PVCo>
    ↓              ↓              ↓
Box Names → fromJson Config → Auto Serialization
    ↓              ↓              ↓
Registration → Type Safety → PVCo Storage

PRODUCTION Encryption Flow (PointyCastle-based):
PVCo.data → JSON → PVAesEncryptor.encryptString() → Base64 → Storage
Storage → Base64 → PVAesEncryptor.decryptString() → JSON → PVCo.data

Production Benefits:
✅ Cross-session compatibility (fixed seed management)
✅ Deterministic encryption for caching use cases
✅ Performance optimization with lite mode
✅ Consistent cross-platform behavior
✅ Comprehensive error handling with recovery strategies
✅ Unit testable encryption (43 tests)
✅ No Hive dependency for crypto operations
```

### Critical Configuration Pattern
```dart
// CORRECT: Proper nullable handling
perBoxConfigs: boxConfig != null ? [boxConfig!] : []

// WRONG: Creates list with null element
perBoxConfigs: [?boxConfig]
```

### PRODUCTION Encryption Setup Pattern (PointyCastle-based)
```dart
// 1. Standard security mode (deterministic IV)
final encryptor = PVAesEncryptor('my-secret-seed-2024');

// 2. Lite mode for performance (static IV)
final liteEncryptor = PVAesEncryptor('my-secret-seed-2024', liteMode: true);

// 3. Production setup with dependent encryption
await PVCACHE.setupDependentAESEncryption(
  encryptedCache,
  "hive_key",
  () async {
    final key = Hive.generateSecureKey();
    return base64UrlEncode(key);
  },
  liteMode: false, // Choose based on security vs performance needs
);

// 4. Direct encryption/decryption (cross-session compatible)
final encrypted = encryptor.encryptString("sensitive data");
final decrypted = encryptor.decryptString(encrypted);

// 5. Production deployment with error handling
final cache = PVCACHE.createStdHive(
  env: "production",
  decryptionErrorStrategy: 3, // Reset cache on corruption
);
  CustomCipher(String seed) : _aes = PVAesEncryptor(seed);
  
  @override
  String encryptString(String data) => _aes.encryptString(data);
  
  @override  
  String decryptString(String encrypted) => _aes.decryptString(encrypted);
}
```

### Box Type Determination Flow
1. **HBoxIntent Created**: With box names and perBoxConfigs
2. **Configs Registered**: perBoxConfigs stored in global _perBoxConfigs map
3. **Box Opening**: Check if config exists for box name
   - **Config Found**: Open as CollectionBox<PVCo> with fromJson
   - **No Config**: Open as CollectionBox<Map> (default)
4. **Storage Operations**: Type must match box configuration

## Current Architecture Issues

### Meta Box Problem
- **Issue**: Meta boxes inherit intent but don't get separate configs
- **Symptom**: Meta boxes open as CollectionBox<Map> instead of CollectionBox<PVCo>
- **Root Cause**: createPair() only creates config for main box, not meta box
- **Impact**: Type mismatch errors when storing PVCo in meta boxes

### Configuration Dependencies
- **Timing Critical**: setHiveCipher() must be called before any box operations
- **Global State**: _perBoxConfigs is global, can cause conflicts between intents
- **Type Enforcement**: Web platform strictly enforces CollectionBox typing

### Debug Patterns
```dart
// Box configuration debugging
print('Opening box $boxName with config: $boxConfig');
print('Registering perBoxConfig for: ${config.boxName}');
print('Opening box $boxName as Map - no config found');
print('Opening box $boxName as PVCo with config');
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
