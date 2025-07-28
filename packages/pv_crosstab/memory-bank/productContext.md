# Product Context

## Why PV Crosstab Exists

### Problem Statement
Modern web applications often need to coordinate between multiple browser tabs or windows of the same application. Common scenarios include:

1. **User Authentication**: When a user logs out in one tab, all other tabs should reflect this change
2. **Real-time Updates**: Data changes in one tab should propagate to other tabs
3. **State Synchronization**: Shopping carts, form data, or user preferences need to stay in sync
4. **Security Events**: Security-sensitive actions need to be communicated across all tabs

### Current Limitations
- **Basic BroadcastChannel**: Provides communication but no security
- **Vulnerable to Tampering**: Messages can be intercepted or modified
- **No Identity Verification**: Can't verify which tab sent a message
- **Sensitive Data Exposure**: Credentials or personal data transmitted in plain text

## How PV Crosstab Solves This

### Security-First Design
- **Multiple Security Levels**: Choose the right security for your data
  - Unencrypted: Fast, for non-sensitive data
  - Signed: Integrity protection against tampering
  - Encrypted: Full confidentiality and integrity protection

### Cryptographic Foundation
- **RSA Key Pairs**: Each app instance has unique cryptographic identity
- **Digital Signatures**: Verify message authenticity and prevent tampering
- **Secure Storage**: Keys stored using platform-specific secure storage
- **Nonce Protection**: Prevents replay attacks

### Developer Experience
- **Simple API**: Three factory methods for different security levels
- **Flutter Integration**: Built specifically for Flutter web applications
- **Fail-Safe Design**: No unsafe fallbacks - fails gracefully when security cannot be guaranteed
- **Comprehensive Documentation**: Clear examples and security guidance

## Target Use Cases

### 1. Authentication Systems
```dart
// User logs out - notify all tabs
final payload = await CrosstabPayload.signed(
  data: {'action': 'logout', 'userId': currentUser.id}
);
```

### 2. Sensitive Data Updates
```dart
// Share encrypted user preferences
final payload = await CrosstabPayload.encrypted(
  data: {'preferences': userPreferences}
);
```

### 3. Real-time Notifications
```dart
// Simple notifications without security overhead
final payload = await CrosstabPayload.unencrypted(
  data: {'notification': 'New message received'}
);
```

## User Experience Goals

### For Developers
- **Easy Integration**: Add secure cross-tab communication with minimal setup
- **Security Guidance**: Clear documentation on when to use each security level
- **Type Safety**: Strong typing and compile-time error checking
- **Debugging Support**: Clear error messages and validation

### For End Users
- **Seamless Experience**: Tabs stay synchronized without manual refresh
- **Security**: Sensitive data protected from interception or tampering
- **Performance**: Minimal overhead for high-frequency updates
- **Reliability**: Graceful handling of security failures

## Success Metrics

### Technical Success
- Zero security vulnerabilities in production
- Sub-10ms latency for typical payloads
- 99.9% successful message delivery
- Comprehensive test coverage

### Developer Adoption
- Clear, comprehensive documentation
- Active community usage and feedback
- Integration examples and tutorials
- Support for common Flutter patterns

### Security Validation
- Independent security audit (future)
- Penetration testing against common attacks
- Compliance with web security best practices
- Regular cryptographic library updates 