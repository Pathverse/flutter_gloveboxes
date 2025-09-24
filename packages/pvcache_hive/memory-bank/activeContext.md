# Active Context: pvcache_hive

## Current Work Focus
**MAJOR ARCHITECTURE CHANGE** - Migrating away from Hive's problematic HiveCipher to custom PointyCastle-based encryption solution due to critical reliability issues.

## Recent Changes

### Major Architecture Changes (September 2025)
1. **Critical Decision: Abandon Hive's Cipher**
   - **BREAKING**: Moved away from HiveCipher due to persistent reliability issues
   - **ROOT CAUSE**: Buffer size problems, platform inconsistencies, complex debugging
   - **SOLUTION**: Implemented custom PVAesEncryptor using PointyCastle library
   - **IMPACT**: More reliable, testable, and maintainable encryption system

2. **New Encryption Architecture**
   - **PVAesEncryptor**: Custom AES-256-CBC implementation with PKCS7 padding
   - **PointyCastle Integration**: Battle-tested crypto library with consistent behavior
   - **Random IV Generation**: Each encryption uses unique IV for security
   - **Proper Error Handling**: Clear exceptions instead of cryptic Hive errors

2. **Box Configuration Critical Fix**
   - **MAJOR**: Fixed `[?boxConfig]` syntax causing null elements in perBoxConfigs list
   - Updated to `boxConfig != null ? [boxConfig!] : []` pattern
   - Fixed type mismatch errors between `PVCo` and `Map<dynamic, dynamic>`
   - Added debug logging to trace box configuration issues

3. **Serialization Flow Corrections**
   - Fixed StdBox storage to work with CollectionBox<PVCo> instead of CollectionBox<Map>
   - Proper toJson()/fromJson() automatic handling by Hive
   - Meta boxes still need configuration (identified issue with meta box registration)

### Code Quality Improvements
- Added comprehensive debug logging for box creation and configuration
- Improved error messages for troubleshooting
- Better buffer management for encryption operations

## Next Steps
1. **CRITICAL**: Fix meta box configuration issue (ctx_meta, data_meta boxes opening as Map instead of PVCo)
2. Remove debug prints once issues are resolved
3. Add comprehensive encryption documentation
4. Create unit tests for encryption functionality
5. Document the box configuration patterns

## Active Decisions and Considerations

### NEW Encryption Strategy (Post-HiveCipher)
- **Custom Implementation**: PVAesEncryptor using PointyCastle for reliability
- **Standard AES-256-CBC**: Industry-standard encryption with PKCS7 padding
- **Random IV per Operation**: Each encryption gets unique IV for security
- **Base64 Encoding**: Safe string storage of encrypted binary data
- **Empty String Handling**: Converts empty strings to single space to avoid block issues
- **Key Derivation**: SHA-256 hash of seed string produces consistent 32-byte keys

### Box Configuration Pattern
- **Critical Pattern**: Meta boxes need separate configs or shared config registration
- **Debug Strategy**: Temporary logging to identify configuration flow issues
- **Type Safety**: Ensure CollectionBox<PVCo> vs CollectionBox<Map> consistency

### Serialization Architecture
- **Automatic Handling**: Let Hive handle toJson()/fromJson() calls automatically
- **Type Consistency**: PVCo objects throughout the storage chain
- **Error Recovery**: Better handling of serialization mismatches

## Important Patterns and Preferences

### NEW Encryption Patterns (PointyCastle-based)
```dart
// Create encryptor with seed-based key derivation
final encryptor = PVAesEncryptor('my-secret-seed');

// Direct string encryption/decryption
final encrypted = encryptor.encryptString("plain text");
final decrypted = encryptor.decryptString(encrypted);

// Integration with PVCi system
class MyCustomCipher extends PVCiEncryptor {
  final PVAesEncryptor _encryptor;
  MyCustomCipher(String seed) : _encryptor = PVAesEncryptor(seed);
  
  @override
  String encryptString(String data) => _encryptor.encryptString(data);
  
  @override
  String decryptString(String encrypted) => _encryptor.decryptString(encrypted);
}
```

### Box Configuration Patterns
```dart
// CORRECT: Handle nullable boxConfig properly
perBoxConfigs: boxConfig != null ? [boxConfig!] : []

// WRONG: Creates list with null element
perBoxConfigs: [?boxConfig]
```

### Debug Patterns
- **Box Creation**: Log which boxes are opened as Map vs PVCo
- **Config Registration**: Log when perBoxConfigs are registered
- **Type Flow**: Track PVCo object flow through storage chain

## Learnings and Project Insights

### Critical Architecture Issues Discovered
1. **HiveCipher Reliability Crisis**: Major stability issues forced architectural change
   - **Buffer Size Inconsistencies**: Different platforms required different buffer sizes
   - **Cryptic Error Messages**: Debugging HiveCipher issues was extremely difficult
   - **Platform Dependencies**: Web vs native behavior was unpredictable
   - **Limited Control**: Could not customize or fix underlying cipher issues

2. **Box Type Mismatch**: Most storage issues stem from CollectionBox<Map> vs CollectionBox<PVCo> confusion
3. **Meta Box Problem**: Meta boxes inherit intent but don't get separate configs registered
4. **Configuration Timing**: Box configs must be registered before box opening

### Debugging Strategies That Work
- **Comprehensive Logging**: Print box names, types, and config presence
- **Type Tracking**: Log object types at each serialization step
- **Configuration Tracing**: Track perBoxConfig registration and lookup

### Platform-Specific Considerations
- **IndexedDB**: CollectionBox typing is strictly enforced in web environment
- **Debug Output**: Console logging is essential for web debugging
- **PointyCastle Consistency**: New encryption solution works identically across all platforms
- **No More Platform-Specific Buffers**: Eliminated web vs native encryption differences
2. **Type safety**: Generic implementations maintain compile-time checking
3. **Integration-friendly**: Clean integration with existing pvcache system
4. **Performance-oriented**: Leverages Hive's efficient storage

### Areas for Improvement
1. **Documentation**: README needs completion and better examples
2. **Error handling**: Could be more comprehensive in edge cases
3. **Testing**: More comprehensive test coverage would be beneficial
4. **Examples**: Could include more complex real-world scenarios

### Key Technical Insights
- Hive's `BoxCollection` provides excellent multi-box management
- Custom JSON serialization enables efficient image caching
- Extension methods provide clean API for common use cases
- Template pattern allows for easy customization and extension

## Current Status
- Package structure is well-designed and functional
- Core functionality is implemented and working
- Examples demonstrate basic usage patterns
- Memory bank documentation is being initialized
- Ready for further development and enhancement
