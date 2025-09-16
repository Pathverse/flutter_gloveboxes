# Active Context: pvcache_hive

## Current Work Focus
**Encryption & Serialization Bug Fixes** - Resolving critical issues with Hive encryption configuration and PVCo serialization in CollectionBox storage.

## Recent Changes

### Major Bug Fixes (September 2025)
1. **Encryption Implementation**
   - Added `HiveCipherExt` extension with `encryptString()` and `decryptString()` methods
   - Fixed buffer size issues in AES encryption (increased from 16 to 32 bytes)
   - Added proper UTF-8 encoding/decoding for string encryption
   - Fixed encryption key initialization in example2.dart (32-byte key requirement)

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

### Encryption Strategy
- **Buffer Sizing**: Use generous 32-byte buffers for AES encryption to avoid range errors
- **String Handling**: UTF-8 encoding for proper internationalization support
- **Key Management**: 32-byte keys required for HiveAesCipher (256-bit encryption)

### Box Configuration Pattern
- **Critical Pattern**: Meta boxes need separate configs or shared config registration
- **Debug Strategy**: Temporary logging to identify configuration flow issues
- **Type Safety**: Ensure CollectionBox<PVCo> vs CollectionBox<Map> consistency

### Serialization Architecture
- **Automatic Handling**: Let Hive handle toJson()/fromJson() calls automatically
- **Type Consistency**: PVCo objects throughout the storage chain
- **Error Recovery**: Better handling of serialization mismatches

## Important Patterns and Preferences

### Encryption Patterns
```dart
// Proper encryption key creation
final encryptionKey = Uint8List.fromList([1,2,3...32]);
hboxcore.setHiveCipher(HiveAesCipher(encryptionKey));

// String encryption/decryption
final encrypted = cipher.encryptString("plain text");
final decrypted = cipher.decryptString(encrypted);
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
1. **Box Type Mismatch**: Most storage issues stem from CollectionBox<Map> vs CollectionBox<PVCo> confusion
2. **Meta Box Problem**: Meta boxes inherit intent but don't get separate configs registered
3. **Encryption Buffer**: AES encryption needs generous buffer sizes for web platform
4. **Configuration Timing**: Box configs must be registered before box opening

### Debugging Strategies That Work
- **Comprehensive Logging**: Print box names, types, and config presence
- **Type Tracking**: Log object types at each serialization step
- **Configuration Tracing**: Track perBoxConfig registration and lookup

### Platform-Specific Considerations
- **Web Platform**: Requires larger encryption buffers than native platforms
- **IndexedDB**: CollectionBox typing is strictly enforced in web environment
- **Debug Output**: Console logging is essential for web debugging
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
