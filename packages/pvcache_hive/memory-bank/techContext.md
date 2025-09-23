# Technical Context: pvcache_hive

## Technology Stack

### Core Dependencies
- **Dart SDK**: ^3.5.0
- **Flutter**: ^3.24.0
- **hive_ce**: ^4.0.0-dev.8 (Community edition of Hive)
- **pvcache**: Core caching framework (local dependency)

### Platform Support
- **Flutter Web**: Primary development target with IndexedDB backend
- **Flutter Desktop**: Windows, macOS, Linux support
- **Flutter Mobile**: Android and iOS support

### Development Tools
- **VS Code**: Primary IDE with Dart/Flutter extensions
- **Flutter DevTools**: Debugging and profiling
- **Dart Analysis**: Static code analysis with strict linting

## Technical Constraints

### Hive-Specific Limitations
- **32-byte Encryption Keys**: HiveAesCipher requires exactly 256-bit keys
- **Web Platform**: IndexedDB has strict type enforcement for CollectionBox
- **Box Configuration**: Must register perBoxConfigs before opening boxes
- **Global State**: HiveCipher and box configurations are global singletons

### Flutter Web Constraints
- **Buffer Sizes**: AES encryption requires larger buffers (32 bytes vs 16)
- **Type Safety**: CollectionBox<T> typing strictly enforced in IndexedDB
- **Debug Output**: Console logging essential for troubleshooting

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

### Encryption Setup
```dart
// Required before any Hive operations
final encryptionKey = Uint8List.fromList([
  1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16,
  17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32
]);
hboxcore.setHiveCipher(HiveAesCipher(encryptionKey));
```

## Tool Usage Patterns

### Debug Configuration
- **Console Logging**: Comprehensive logging for box configuration issues
- **Type Tracking**: Log object types at each serialization step
- **Configuration Tracing**: Track perBoxConfig registration and lookup

### Development Workflow
1. **Set Encryption**: Configure HiveAesCipher before any operations
2. **Register Configs**: Ensure proper box configuration registration
3. **Debug Logging**: Use temporary logging to trace issues
4. **Type Validation**: Verify CollectionBox<PVCo> vs CollectionBox<Map>
5. **Clean Up**: Remove debug prints in production

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

### Encryption Integration
- **Transparent**: PVCo objects automatically encrypt JSON when cipher present
- **String Utilities**: HiveCipherExt provides direct string encryption
- **Buffer Safety**: 32-byte buffers prevent range errors on web
- **UTF-8 Support**: Proper encoding for international characters

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
