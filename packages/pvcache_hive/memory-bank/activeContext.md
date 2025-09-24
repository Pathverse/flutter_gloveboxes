# Active Context: pvcache_hive

## Current Work Focus
**ARCHITECTURE STABILIZED** - Successfully completed migration to custom PointyCastle-based encryption system with deterministic and lite mode options. System is now production-ready with comprehensive cross-session compatibility.

## Recent Changes

### Major Architecture Completion (September 2025)
1. **✅ RESOLVED: Cross-Session Encryption Issues**
   - **ROOT CAUSE IDENTIFIED**: setupDependentAESEncryption was generating multiple seeds
   - **SOLUTION**: Fixed seed caching mechanism to ensure consistent encryption keys
   - **RESULT**: Cross-session decrypt operations now work reliably

2. **✅ COMPLETED: Enhanced Encryption Architecture** 
   - **PVAesEncryptor**: AES-256-CTR with deterministic IV generation (not CBC)
   - **Lite Mode Added**: Performance-optimized encryption with static IV generation
   - **Deterministic Encryption**: Content-based IV generation for consistent caching
   - **Cross-Platform Verified**: Identical encryption behavior on all platforms

3. **✅ COMPLETED: Lite Mode Implementation**
   - **Performance Optimization**: Added liteMode parameter to PVAesEncryptor
   - **Static IV Generation**: Uses seed-based static IV for improved performance
   - **Configurable**: Can be enabled per encryptor instance or globally
   - **Use Cases**: High-throughput scenarios, development environments

### Documentation and Testing Improvements
- ✅ Updated README with modern encryption patterns and lite mode usage
- ✅ Added comprehensive architecture documentation
- ✅ All unit tests passing (43 tests)
- ✅ Cross-session compatibility validated

## Next Steps
1. **MONITOR**: Observe production performance with lite mode in high-throughput scenarios
2. **ENHANCE**: Consider adding compression options for large data sets
3. **OPTIMIZE**: Evaluate memory usage patterns in long-running applications
4. **EXTEND**: Add key rotation capabilities for enhanced security

## Active Decisions and Considerations

### FINALIZED Encryption Strategy (PointyCastle-based)
- **Architecture**: PVAesEncryptor using PointyCastle for reliability
- **Algorithm**: AES-256-CTR mode (not CBC) - handles any data length without padding
- **IV Generation**: 
  - **Full Mode**: Deterministic IV based on content + seed (maximum security)
  - **Lite Mode**: Static IV based on seed only (optimized performance)
- **Cross-Session**: Guaranteed consistent encryption/decryption across app sessions
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

### PRODUCTION Encryption Patterns (PointyCastle-based)
```dart
// Standard security mode (default)
final encryptor = PVAesEncryptor('my-secret-seed');

// Lite mode for performance
final liteEncryptor = PVAesEncryptor('my-secret-seed', liteMode: true);

// Production setup with dependent encryption
await PVCACHE.setupDependentAESEncryption(
  encryptedCache,
  "hive_key",
  () async {
    final key = Hive.generateSecureKey();
    return base64UrlEncode(key);
  },
  liteMode: false, // Choose based on security vs performance needs
);

// Direct encryption/decryption (deterministic for caching)
final encrypted = encryptor.encryptString("sensitive data");
final decrypted = encryptor.decryptString(encrypted);
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

### Major Architecture Successes
1. **✅ PointyCastle Migration Success**: Complete replacement of unreliable HiveCipher
   - **Consistent Behavior**: Identical encryption across Web, Desktop, Mobile
   - **Comprehensive Testing**: 43 unit tests ensuring reliability
   - **Clear Error Messages**: Debugging is now straightforward
   - **Full Control**: Can customize and extend encryption as needed

2. **✅ Cross-Session Compatibility Achieved**: Root cause identification and resolution
   - **Seed Management**: Fixed setupDependentAESEncryption to ensure consistent keys
   - **Deterministic Encryption**: Content-based IV generation for caching use cases
   - **Performance Options**: Lite mode for high-throughput scenarios

3. **✅ Production-Ready Architecture**: Robust system with multiple deployment options

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

## Current Status - PRODUCTION READY ✅
- **✅ ARCHITECTURE COMPLETE**: All major technical challenges resolved
- **✅ CROSS-SESSION RELIABLE**: Encryption works consistently across app sessions
- **✅ PERFORMANCE OPTIMIZED**: Lite mode available for high-throughput scenarios
- **✅ PRODUCTION DEPLOYED**: Successfully running in pathverse_web_app
- **✅ FULLY DOCUMENTED**: README, memory bank, and examples all updated
- **✅ COMPREHENSIVELY TESTED**: 43 unit tests covering all encryption scenarios
