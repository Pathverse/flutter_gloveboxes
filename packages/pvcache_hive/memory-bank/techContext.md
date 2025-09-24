# Technical Context: pvcache_hive

## Technology Stack

### Core Dependencies  
- **Dart SDK**: ^3.9.0
- **Flutter**: >=1.17.0
- **hive_ce**: >=2.11.0 <3.0.0 (Community edition of Hive)
- **pvcache**: >=0.0.4 <1.0.0 (Core caching framework)
- **NEW: pointycastle**: ^3.7.3 (Reliable crypto library - replaced HiveCipher)

### Platform Support
- **Flutter Web**: Primary development target with IndexedDB backend
- **Flutter Desktop**: Windows, macOS, Linux support
- **Flutter Mobile**: Android and iOS support

### Development Tools
- **VS Code**: Primary IDE with Dart/Flutter extensions
- **Flutter DevTools**: Debugging and profiling
- **Dart Analysis**: Static code analysis with strict linting

## Technical Constraints

### Technical Constraints - RESOLVED ✅
- **✅ RESOLVED: All Encryption Issues**: PointyCastle provides stable, cross-platform encryption
- **✅ RESOLVED: Cross-Session Issues**: Fixed seed management ensures consistent encryption keys
- **✅ RESOLVED: Platform Inconsistencies**: Identical behavior on Web, Desktop, and Mobile
- **✅ Production Ready**: Successfully deployed with configurable error handling strategies

### Current Technical Requirements
- **Performance Considerations**: Choose between security (deterministic) and performance (lite) modes
- **Error Handling**: Configure decryption error strategies based on application needs
- **Seed Management**: Use setupDependentAESEncryption for secure key generation and storage

### PVCache Integration
- **Adapter System**: Must implement PVBaseStorage interface
- **Context Pattern**: All operations use PVCtx for parameter passing
- **Metadata Support**: MetadataStorage mixin for TTL and expiry

## Development Setup

### Project Structure
```
pvcache_hive/
├── lib/
│   ├── src/
│   │   ├── hboxcore.dart       # Core Hive management
│   │   └── pvci.dart           # PVCo serialization
│   ├── templates/
│   │   ├── storage/            # Storage implementations
│   │   └── helper/             # Extension methods
│   └── pvcache_hive.dart       # Main export file
├── example/                    # Usage examples
├── memory-bank/               # Documentation
└── pubspec.yaml              # Dependencies
```

### Build Configuration
- **Analysis Options**: Strict linting with custom rules
- **Export Strategy**: Selective exports from main library file
- **Example Apps**: Multiple example apps for different use cases

### NEW Encryption Setup (PointyCastle-based)
```dart
// No global state required - create encryptor with seed
final encryptor = PVAesEncryptor('your-app-secret-seed');

// Direct encryption/decryption
final encrypted = encryptor.encryptString('sensitive data');
final decrypted = encryptor.decryptString(encrypted);

// For PVCi integration
class AppCipher extends PVCiEncryptor {
  final PVAesEncryptor _encryptor;
  AppCipher(String seed) : _encryptor = PVAesEncryptor(seed);
  
  @override
  String encryptString(String data) => _encryptor.encryptString(data);
  
  @override
  String decryptString(String encrypted) => _encryptor.decryptString(encrypted);
}
```

## Tool Usage Patterns

### Debug Configuration
- **Console Logging**: Comprehensive logging for box configuration issues
- **Type Tracking**: Log object types at each serialization step
- **Configuration Tracing**: Track perBoxConfig registration and lookup

### NEW Development Workflow (Post-HiveCipher)
1. **Create Encryptor**: Instantiate PVAesEncryptor with app-specific seed
2. **No Global Setup**: No need to configure global cipher state
3. **Register Configs**: Ensure proper box configuration registration  
4. **Debug Logging**: Use temporary logging to trace issues
5. **Type Validation**: Verify CollectionBox<PVCo> vs CollectionBox<Map>
6. **Test Encryption**: Run unit tests to verify encryption behavior
7. **Clean Up**: Remove debug prints in production

### Testing Strategy
- **Unit Tests**: Focus on encryption and serialization
- **Integration Tests**: End-to-end storage operations
- **Platform Tests**: Verify behavior across web, desktop, mobile
- **Configuration Tests**: Test various box configuration scenarios

### Performance Considerations
- **Lazy Loading**: Boxes opened on-demand
- **Buffer Management**: Pre-allocate encryption buffers
- **Type Safety**: Compile-time type checking prevents runtime errors
- **Caching**: Box instances cached to avoid repeated opening

## Critical Implementation Details

### Box Configuration Flow
1. **HBoxIntent Creation**: Defines box names and configurations
2. **Config Registration**: perBoxConfigs stored in global map
3. **Box Opening**: Configuration presence determines box type
4. **Type Enforcement**: Web platform strictly enforces typing

### NEW Encryption Integration (PointyCastle)
- **Reliable Implementation**: PVAesEncryptor provides consistent cross-platform encryption
- **No Global Dependencies**: Each encryptor instance is self-contained
- **Proper IV Generation**: Random IV per encryption for security
- **UTF-8 Support**: Proper encoding for international characters
- **Comprehensive Testing**: 21 unit tests ensure reliability
- **Standard Algorithms**: AES-256-CBC with PKCS7 padding (industry standard)

### Error Handling Patterns
- **Configuration Errors**: Clear messages for box config mismatches
- **Type Errors**: Detailed information about expected vs actual types
- **Encryption Errors**: Buffer size and key validation
- **Debug Support**: Comprehensive logging for issue resolution

### Build Configuration
- **analysis_options.yaml**: Linting rules and analysis configuration
- **pubspec.yaml**: Package metadata and dependencies
- **pubspec.lock**: Locked dependency versions

## Technical Constraints

### Platform Compatibility
- Targets Flutter's supported platforms (iOS, Android, Web, Desktop)
- Uses Hive's cross-platform storage capabilities
- No platform-specific code required

### Performance Requirements
- Must handle large datasets efficiently
- Image caching should not block UI thread
- Memory usage should be reasonable for mobile devices

### Security Considerations
- Supports Hive encryption via `HiveCipher`
- No sensitive data exposed in logs or errors
- Secure storage path configuration

## Development Tools

### Code Quality
- **flutter_lints**: Enforces Dart/Flutter best practices
- **analysis_options.yaml**: Custom linting rules
- Consistent code formatting

### Testing Strategy
- Unit tests for core functionality
- Integration tests for storage operations
- Example apps for manual testing

### Documentation
- Inline code documentation
- README with usage examples
- API documentation via dartdoc

## Integration Patterns

### With pvcache
- Implements `PVBaseStorage` interface
- Supports `MetadataStorage` mixin
- Compatible with pvcache adapter system

### With Hive
- Uses `BoxCollection` for multi-box management
- Supports custom box creators and configurations
- Handles Hive initialization and cleanup

### With Flutter
- Widget-friendly image caching
- Async/await pattern throughout
- Proper resource management

## Deployment Considerations

### Package Publishing
- Version: 0.0.1 (initial release)
- Homepage: https://github.com/Pathverse/pvcache_hive
- Follows pub.dev publishing guidelines

### Version Management
- Semantic versioning (semver)
- Breaking changes require major version bump
- Backward compatibility maintained where possible

## Known Technical Debt
- README needs completion (currently has TODO placeholders)
- Some example implementations could be more robust
- Error handling could be more comprehensive in edge cases
