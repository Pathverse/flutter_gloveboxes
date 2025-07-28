# CrosstabGoRouter

A powerful extension of GoRouter that enables **secure cross-tab navigation coordination** for Flutter web applications. Built on top of the `pv_crosstab` package, CrosstabGoRouter provides capabilities that regular GoRouter simply cannot achieve.

## 🚀 Powers You Can't Get with Regular GoRouter

### 1. **Cross-Tab Navigation Control**
```dart
// Tab A triggers navigation in Tab B
await router.sendNavigationCommand(
  command: 'go',
  path: '/dashboard',
  channelId: 'user-session',
);
// All tabs with matching channel automatically navigate to /dashboard
```

**What GoRouter can't do:** GoRouter is isolated to single tabs. You cannot trigger navigation in other browser tabs/windows from your current tab.

### 2. **Secure Navigation Commands**
```dart
// Send encrypted navigation commands for sensitive operations
await router.sendNavigationCommand(
  command: 'go',
  path: '/admin/sensitive-data',
  channelId: 'admin-panel',
  useEncryption: true, // ✨ Encrypted cross-tab communication
);
```

**What GoRouter can't do:** GoRouter has no concept of security or encryption for navigation commands.

### 3. **Navigation Confirmation & Error Handling**
```dart
router.createNavigationSync(
  requestPattern: 'nav-request',
  responsePattern: 'nav-response',
  onRequest: (payload) async {
    try {
      router.go(payload.data['path']);
      await router.sendNavigationResponse(
        originalPayload: payload,
        success: true,
        resultData: {'currentPath': router.location},
      );
    } catch (e) {
      await router.sendNavigationResponse(
        originalPayload: payload,
        success: false,
        error: e.toString(),
      );
    }
  },
  onResponse: (payload) {
    if (payload.data['success']) {
      showSuccess('Navigation completed in other tabs');
    } else {
      showError('Navigation failed: ${payload.data['error']}');
    }
  },
);
```

**What GoRouter can't do:** GoRouter cannot provide feedback about navigation success/failure across tabs, or implement request-response navigation patterns.

### 4. **Multi-Tab State Synchronization**
```dart
// Keep all tabs synchronized for authentication state
router.registerAppNavigationPattern(
  pattern: AppNavigationPattern.authentication,
  onLogin: (payload) {
    // User logged in elsewhere - sync this tab
    router.go('/dashboard');
    updateAuthState(payload.data['user']);
  },
  onLogout: (payload) {
    // User logged out elsewhere - sync this tab
    router.go('/login');
    clearAuthState();
  },
  onSessionExpired: (payload) {
    // Session expired in another tab - sync this tab
    router.go('/login?expired=true');
    showSessionExpiredMessage();
  },
);
```

**What GoRouter can't do:** GoRouter cannot coordinate authentication state or navigation across multiple tabs automatically.

### 5. **Pattern-Based Navigation Handling**
```dart
// Handle different security levels automatically
router.registerSecurityNavigationHandlers(
  unencryptedHandler: (payload) => handlePublicNavigation(payload),
  encryptedHandler: (payload) => handleSecureNavigation(payload),
  signedHandler: (payload) => handleVerifiedNavigation(payload),
  channelPattern: 'admin-*', // Matches admin-1, admin-panel, etc.
);

// Wildcard navigation patterns
router.registerWildcardNavigation(
  commandPattern: 'push*',     // Matches push, pushNamed, pushReplacement
  channelPattern: 'user-?',    // Matches user-1, user-a, etc.
  callback: (payload) => handleUserNavigation(payload),
);
```

**What GoRouter can't do:** GoRouter cannot handle navigation based on security levels or flexible pattern matching across tabs.

### 6. **Field-Based Navigation Logic**
```dart
// Different handlers based on navigation payload content
router.registerFieldBasedNavigation(
  fieldHandlers: {
    ['path']: (p) => handleSimpleNavigation(p),
    ['name', 'pathParameters']: (p) => handleNamedNavigation(p),
    ['path', 'extra', 'authToken']: (p) => handleAuthenticatedNavigation(p),
    ['deepLink', 'source']: (p) => handleDeepLinkNavigation(p),
  },
  channelId: 'main-nav',
);
```

**What GoRouter can't do:** GoRouter cannot dynamically route navigation commands based on payload content or implement field-based routing logic.

### 7. **Auto-Registration from Navigation History**
```dart
// Generate handlers automatically from existing navigation
final existingNavCommand = await CrosstabPayload.signed(
  data: {'command': 'go', 'path': '/profile'},
  type: 'navigation',
  channelId: 'user-profile',
);

// Auto-create handler for similar navigation patterns
router.autoRegisterNavigation(
  existingNavCommand,
  callback: (payload) => handleSimilarProfileNavigation(payload),
);
```

**What GoRouter can't do:** GoRouter cannot learn from navigation patterns or auto-generate route handlers.

### 8. **Channel-Based Tab Targeting**
```dart
// Target specific tabs or groups of tabs
await router.sendNavigationCommand(
  command: 'go',
  path: '/notifications',
  channelId: 'notifications-sidebar', // Only tabs listening to this channel
);

await router.sendNavigationCommand(
  command: 'refresh',
  channelId: 'admin-*', // All admin tabs
  force: true,
);
```

**What GoRouter can't do:** GoRouter cannot selectively target specific tabs or groups of tabs for navigation commands.

## 🎯 Real-World Use Cases

### **Multi-Tab Admin Dashboard**
```dart
// Admin performs action in Tab A
await performAdminAction();

// Refresh all admin tabs to show updated data
await router.sendRefreshCommand(
  channelId: 'admin-*',
  force: true,
);
```

### **E-commerce Checkout Flow**
```dart
// User completes payment in Tab A
await processPayment();

// Navigate all tabs to success page and sync cart state
await router.sendNavigationCommand(
  command: 'go',
  path: '/order-success',
  channelId: 'checkout-*',
  useEncryption: true, // Sensitive order data
);
```

### **Real-Time Collaboration**
```dart
// User joins a collaborative session
router.registerWildcardNavigation(
  channelPattern: 'collab-session-*',
  callback: (payload) {
    final sessionId = payload.data['sessionId'];
    router.go('/collaborate/$sessionId');
    joinCollaborationSession(sessionId);
  },
);
```

### **Security-Sensitive Navigation**
```dart
// Only handle encrypted admin navigation
router.registerSecurityNavigationHandlers(
  encryptedHandler: (payload) {
    if (userHasAdminAccess()) {
      router.go(payload.data['path']);
    } else {
      router.go('/access-denied');
    }
  },
  channelPattern: 'admin-secure',
);
```

## 🛠 Getting Started

### Installation
```yaml
dependencies:
  pv_crosstab_go: ^1.0.0
  go_router: ^13.0.0
```

### Basic Setup
```dart
import 'package:pv_crosstab_go/pv_crosstab_go.dart';

final router = CrosstabGoRouter(
  channelName: 'my-app-navigation',
  routes: [
    GoRoute(path: '/', builder: (context, state) => HomePage()),
    GoRoute(path: '/profile', builder: (context, state) => ProfilePage()),
  ],
);

// Set up cross-tab navigation handlers
router.registerSecurityNavigationHandlers(
  unencryptedHandler: (payload) => handlePublicNavigation(payload),
  encryptedHandler: (payload) => handleSecureNavigation(payload),
);

// Use in MaterialApp.router
MaterialApp.router(
  routerConfig: router.goRouter, // Access underlying GoRouter
);
```

### Advanced Pattern Setup
```dart
// Authentication synchronization across tabs
router.registerAppNavigationPattern(
  pattern: AppNavigationPattern.authentication,
  onLogin: (payload) => router.go('/dashboard'),
  onLogout: (payload) => router.go('/login'),
  onSessionExpired: (payload) => router.go('/login?expired=true'),
);

// Two-way navigation with confirmation
router.createNavigationSync(
  requestPattern: 'nav-request',
  responsePattern: 'nav-response',
  onRequest: handleNavigationRequest,
  onResponse: handleNavigationConfirmation,
  useEncryption: true,
);
```

## 🔒 Security Features

- **Encrypted Navigation Commands**: Protect sensitive route information
- **Digital Signatures**: Verify navigation command authenticity
- **Field-Level Encryption**: Encrypt only sensitive parts of navigation data
- **Channel-Based Access Control**: Restrict navigation commands to specific channels
- **Security-Aware Routing**: Different handlers for different security levels

## 📊 Comparison: CrosstabGoRouter vs GoRouter

| Feature | GoRouter | CrosstabGoRouter |
|---------|----------|------------------|
| Single-tab navigation | ✅ | ✅ |
| Cross-tab navigation | ❌ | ✅ |
| Navigation security | ❌ | ✅ |
| Multi-tab synchronization | ❌ | ✅ |
| Navigation confirmation | ❌ | ✅ |
| Pattern-based routing | ❌ | ✅ |
| Field-based navigation | ❌ | ✅ |
| Auto-registration | ❌ | ✅ |
| Channel targeting | ❌ | ✅ |
| Request-response navigation | ❌ | ✅ |

## 🤝 Contributing

CrosstabGoRouter is built on the `pv_crosstab` package. Contributions are welcome for both packages.

## 📄 License

This package is licensed under the MIT License.

---

**CrosstabGoRouter: Unlock the full potential of multi-tab navigation in Flutter web applications.** 🚀
