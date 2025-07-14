# Technical Context: PV Cache

## Technology Stack

### Core Dependencies
- **Flutter SDK**: ^3.8.1 - Framework foundation
- **Dart SDK**: Compatible with Flutter requirements
- **Hive CE**: ^2.11.3 - Primary storage engine (community edition)
- **Flutter Secure Storage**: ^9.2.4 - Encryption key management
- **WebCrypto**: ^0.5.3 - Cryptographic operations
- **Crypto**: ^3.0.3 - Hash utilities and additional crypto support

### Development Dependencies
- **Flutter Test**: SDK - Testing framework
- **Flutter Lints**: ^5.0.0 - Code quality and style enforcement

## Development Setup

### Project Structure
```
pv_cache/
├── lib/
│   ├── lib.dart                 # Public API exports
│   └── src/
│       ├── cache.dart           # Main PVCache class
│       ├── options.dart         # CacheOptions configuration
│       ├── toplv.dart           # Top-level initialization
│       ├── utils.dart           # JSON utilities
│       └── worker/
│           ├── custom_cipher.dart    # Encryption implementation
│           └── custom_wrapper.dart   # CacheWrapper logic
├── test/
│   └── pv_cache_test.dart       # Comprehensive test suite
├── example/
│   └── lib/main.dart           # Visual testing app
└── memory-bank/                # Documentation and memory
```

### Environment Requirements
- **Flutter**: >=1.17.0 for package compatibility
- **Platform Support**: iOS, Android, Web
- **Testing**: Flutter Test framework with TestWidgetsFlutterBinding

## Technical Constraints

### Platform Limitations
- **Web**: WebCrypto availability for encryption operations
- **iOS**: Keychain access for secure storage
- **Android**: SharedPreferences encryption for secure storage
- **Testing**: flutter_secure_storage limitations in test environment

### Storage Constraints
- **Hive**: File-based storage with size limitations
- **Secure Storage**: Platform-specific key size limits
- **Memory**: LazyBox loading for large datasets
- **Persistence**: No explicit persistence configuration (always persistent)

### Security Constraints
- **Encryption**: Depends on platform secure storage availability
- **Key Management**: Limited to platform-provided secure storage
- **Algorithm**: Uses platform-default encryption algorithms
- **Validation**: CacheOptions rules enforced at runtime

## Tool Usage Patterns

### Hive Integration
```dart
// Initialization pattern
Hive.init(path);
final lazyBox = await Hive.openLazyBox('pv_cache');
final subscriberBox = await Hive.openBox('pv_cache_subscribers');

// Usage pattern
await lazyBox.put(key, value);
final value = await lazyBox.get(key);
```

### Secure Storage Integration
```dart
// Key storage pattern
const storage = FlutterSecureStorage();
await storage.write(key: 'encryption_key', value: keyValue);
final key = await storage.read(key: 'encryption_key');
```

### Testing Patterns
```dart
// Test setup pattern
TestWidgetsFlutterBinding.ensureInitialized();
final tempDir = Directory.systemTemp.createTempSync('pv_cache_test');
Hive.init(tempDir.path);
```

## Build and Deployment

### Build Configuration
- **Analysis Options**: Strict linting with flutter_lints
- **Version**: 0.0.1 (pre-release)
- **Publish**: Not published to pub.dev (publish_to: none)

### Testing Strategy
- **Unit Tests**: Comprehensive coverage of all public methods
- **Integration Tests**: End-to-end cache operations
- **Platform Tests**: Cross-platform compatibility verification
- **Visual Testing**: Example app for manual verification

### Development Workflow
1. **Code**: Implement features following architectural patterns
2. **Test**: Add/update tests for new functionality
3. **Lint**: Ensure code quality with flutter_lints
4. **Example**: Update example app to demonstrate features
5. **Document**: Update memory bank and README

## Performance Considerations

### Storage Performance
- **LazyBox**: On-demand loading reduces memory footprint
- **Batch Operations**: Minimize I/O operations where possible
- **Metadata Separation**: Fast access checks without data loading
- **Compression**: Hive handles data compression internally

### Memory Management
- **LRU/LFU**: Automatic eviction prevents memory bloat
- **Size Limits**: Configurable cache size management
- **Cleanup**: Proactive cleanup of expired entries
- **Isolation**: Separate metadata tracking

### Encryption Performance
- **Selective Encryption**: Only specified fields encrypted
- **Key Caching**: Secure storage keys cached during session
- **Algorithm Choice**: Platform-optimized encryption algorithms
- **Lazy Decryption**: Decryption only on access

## Debugging and Monitoring

### Debug Features
- **Debug Mode**: `PVCache.getInstance(debug: true)` for verbose logging
- **Test Output**: Comprehensive test logging with debugPrint
- **Visual App**: Real-time cache state visualization
- **Error Tracking**: Detailed error messages and stack traces

### Logging Patterns
```dart
debugPrint('🚀 Cache initialized successfully');
debugPrint('✅ PUT: $key = $value');
debugPrint('❌ Error: $operation -> $error');
```

### Monitoring Capabilities
- **Cache Size**: Track number of entries and storage usage
- **Access Patterns**: LRU/LFU statistics and eviction metrics
- **Error Rates**: Track operation success/failure rates
- **Performance**: Operation timing and throughput metrics

## Future Technical Considerations

### Scalability Improvements
- Multiple cache instance support
- Custom encryption algorithm plugins
- Network cache integration
- Background cleanup scheduling

### Performance Optimizations
- Streaming large data operations
- Compression configuration options
- Custom serialization strategies
- Memory usage optimization

### Developer Experience
- Code generation for type-safe cache keys
- IDE extensions for cache debugging
- Performance profiling tools
- Advanced configuration validation
