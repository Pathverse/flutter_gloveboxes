# Technical Context

## Technology Stack

### Core Technologies
- **Flutter 3.32.2+**: Primary framework for cross-platform development
- **Dart 3.8.1+**: Programming language with strong typing and null safety
- **Flutter Web**: Specifically targeting web platform capabilities

### Cryptographic Stack
- **cryptography 2.7.0+**: Modern, well-maintained cryptographic operations
  - Replaced deprecated `encrypt` package for better security and maintenance
  - Provides RSA-PSS, SHA-256, and other cryptographic primitives
  - Cross-platform implementation with web crypto optimization
- **flutter_secure_storage 9.0.0+**: Platform-specific secure storage
  - Uses Keychain on iOS, Keystore on Android, credential store on desktop
  - Web implementation uses browser secure storage APIs

### Web Platform APIs
- **BroadcastChannel API**: Native browser API for cross-tab communication
- **Web Crypto API**: Browser's built-in cryptographic functions for secure random generation
- **web 1.1.0+**: Dart bindings for web platform APIs

### Development Tools
- **flutter_lints 5.0.0+**: Dart/Flutter linting rules for code quality
- **flutter_test**: Testing framework for unit and widget tests

## Technical Constraints

### Platform Limitations
- **Web-Only Target**: Package specifically designed for Flutter web applications
- **Browser Security Model**: Must work within browser security constraints
- **Same-Origin Policy**: Communication limited to same-origin tabs
- **Web Crypto Availability**: Requires modern browsers with Web Crypto API support

### Cryptographic Constraints
- **RSA Key Size**: Using 2048-bit keys for balance of security and performance
- **Storage Limitations**: Key storage depends on platform-specific secure storage availability
- **Web Crypto Limitations**: Some operations may require polyfills for older browsers

### Performance Considerations
- **Payload Size**: Encryption adds overhead - consider for large payloads
- **Key Generation**: RSA key generation is computationally expensive (done once)
- **Cross-Tab Latency**: BroadcastChannel has minimal latency but not zero

## Development Setup

### Environment Requirements
```yaml
environment:
  sdk: ^3.8.1
  flutter: ">=1.17.0"
```

### Key Dependencies
```yaml
dependencies:
  flutter:
    sdk: flutter
  go_router: ^14.6.2                    # Routing (if needed for examples)
  web: ^1.1.0                          # Web platform APIs
  flutter_secure_storage: ">=9.0.0 <10.0.0"  # Secure key storage
  cryptography: ">=2.7.0 <3.0.0"       # Modern cryptographic operations
  crypto: ">=3.0.3 <4.0.0"             # Additional crypto utilities
  uuid: ^4.5.1                         # Unique identifier generation
```

### Development Dependencies
```yaml
dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^5.0.0
```

## Architecture Patterns

### Security-First Design
- **Fail-Safe Defaults**: Operations fail rather than using unsafe fallbacks
- **Explicit Security Levels**: Developers must choose appropriate security level
- **Key Management**: Centralized cryptographic key handling in `crypt.dart`
- **Input Validation**: Strict validation of all security-critical inputs

### Package Structure
```
lib/
├── src/
│   ├── payload.dart     # Secure payload with 3 security levels
│   ├── channel.dart     # BroadcastChannel wrapper (to be implemented)
│   └── widget.dart      # Flutter UI components (to be implemented)
└── utils/
    └── crypt.dart       # Cryptographic utilities and key management
```

### API Design Principles
- **Factory Pattern**: Different payload types via factory constructors
- **Async/Await**: All cryptographic operations are asynchronous
- **Type Safety**: Strong typing with clear error handling
- **Immutable Data**: Payloads are immutable once created

## Integration Patterns

### Initialization Sequence
1. Call `initSecurity()` during app startup
2. Wait for key generation/loading to complete
3. Begin creating and sending payloads
4. Handle security errors gracefully

### Error Handling Strategy
- **Cryptographic Failures**: Throw specific exceptions with clear messages
- **Missing Keys**: Explicit errors directing to `initSecurity()`
- **Validation Failures**: Clear validation error messages
- **Network Issues**: Graceful degradation when BroadcastChannel unavailable

## Future Technical Considerations

### Production Cryptography
- **Current State**: Simplified implementations for demonstration
- **Production Goal**: Full AES-GCM encryption with proper key derivation
- **Security Audit**: Independent review of cryptographic implementations

### Performance Optimization
- **Key Caching**: Optimize key access patterns
- **Payload Compression**: Consider compression for large payloads
- **Batch Operations**: Support for sending multiple payloads efficiently

### Browser Compatibility
- **Modern Browsers**: Primary target (Chrome, Firefox, Safari, Edge)
- **Polyfills**: Consider for older browser support
- **Feature Detection**: Graceful degradation when APIs unavailable

## Tool Usage Patterns

### Development Workflow
1. **Flutter Development**: Standard Flutter web development practices
2. **Security Testing**: Manual testing of all three payload types
3. **Linting**: Strict adherence to Flutter linting rules
4. **Documentation**: Comprehensive inline documentation with examples

### Testing Strategy
- **Unit Tests**: Test cryptographic functions in isolation
- **Integration Tests**: Test full payload creation and verification flow
- **Security Tests**: Verify that tampering is detected
- **Performance Tests**: Measure latency and throughput 