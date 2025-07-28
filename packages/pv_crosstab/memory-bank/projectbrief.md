# PV Crosstab - Project Brief

## Overview
PV Crosstab is a Flutter package designed to enable secure cross-tab communication in web applications. The package provides cryptographically secure messaging between browser tabs of the same application, with multiple security levels based on data sensitivity.

## Core Requirements

### Primary Goals
1. **Secure Cross-Tab Communication**: Enable browser tabs to communicate securely using the BroadcastChannel API
2. **Multiple Security Levels**: Support unencrypted, signed, and fully encrypted payloads
3. **Cryptographic Security**: Implement proper RSA key generation, digital signatures, and encryption
4. **Flutter Web Integration**: Seamless integration with Flutter web applications
5. **Secure Storage**: Utilize platform-specific secure storage for cryptographic keys

### Security Requirements
- RSA key pair generation and secure storage
- Digital signatures for payload integrity verification
- Encryption for sensitive data protection
- Nonce-based replay attack prevention
- No security fallbacks - fail gracefully when security cannot be guaranteed

### Technical Scope
- Flutter package targeting web platforms
- BroadcastChannel API for inter-tab communication
- RSA-PSS with SHA-256 for signatures
- AES encryption for sensitive payloads (production implementation pending)
- Platform-specific secure storage (flutter_secure_storage)

## Package Structure
```
lib/
├── src/
│   ├── payload.dart     # Secure payload implementation with multiple security levels
│   ├── channel.dart     # BroadcastChannel communication (to be implemented)
│   └── widget.dart      # Flutter widgets for cross-tab UI (to be implemented)
└── utils/
    └── crypt.dart       # Cryptographic utilities and key management
```

## Dependencies
- **cryptography**: Modern cryptographic operations (replacing deprecated encrypt package)
- **flutter_secure_storage**: Platform-specific secure key storage
- **web**: Web platform APIs including BroadcastChannel
- **crypto**: Additional cryptographic utilities
- **uuid**: Unique identifier generation

## Development Status
- ✅ Cryptographic foundation (crypt.dart) - Complete with RSA key generation
- ✅ Secure payload system (payload.dart) - Complete with 3 security levels
- 🔄 BroadcastChannel implementation - To be developed
- 🔄 Flutter widget components - To be developed
- 🔄 Documentation and examples - To be completed

## Success Criteria
1. Secure key generation and storage working reliably
2. Three payload types (unencrypted, signed, encrypted) functioning correctly
3. Cross-tab communication via BroadcastChannel API
4. Comprehensive documentation and usage examples
5. Production-ready cryptographic implementations
6. No security vulnerabilities or unsafe fallbacks 