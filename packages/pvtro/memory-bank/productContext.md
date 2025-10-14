# Product Context: pvtro

## Why This Project Exists
In the Flutter ecosystem, slang is a popular and powerful translation library that generates type-safe translation code. However, in enterprise applications built as monorepos with multiple packages, each using slang independently, developers face a coordination nightmare.

## Problems It Solves

### 1. The Import Conflict Problem
```dart
// This fails - can't import both AppLocale enums
import 'package:user_package/i18n/strings.g.dart'; // AppLocale
import 'package:admin_package/i18n/strings.g.dart'; // AppLocale (conflict!)
```

### 2. The Manual Synchronization Problem
```dart
// Current painful approach
void changeLanguage(String locale) {
  UserLocalSettings.setLocale(UserAppLocale.fromLanguageCode(locale));
  AdminLocalSettings.setLocale(AdminAppLocale.fromLanguageCode(locale));
  PaymentLocalSettings.setLocale(PaymentAppLocale.fromLanguageCode(locale));
  // ... repeat for every package
}
```

### 3. The Type Safety Loss Problem
- No unified enum means language codes become string-based
- Lost compile-time checking for supported languages
- Easy to make typos in language codes
- No single source of truth for supported languages

## How It Should Work

### Ideal Developer Experience
```dart
// 1. Add packages to pubspec.yaml
dependencies:
  pvtro: ^0.0.1
  user_package: ^1.0.0
  admin_package: ^1.0.0

dev_dependencies:
  pvtro_builder: ^0.0.1

// 2. Create trigger file
// lib/pvtro.dart - just this line triggers everything
export 'generated/pvtro_generated.dart';

// 3. Run build_runner
dart run build_runner build

// 4. Use unified locale management
final cubit = createUnifiedLocaleCubit();
cubit.changeLocale(UnifiedLanguage.fr); // Updates ALL packages
```

### Generated Code Experience
- **Clean Enums**: Generated `UnifiedLanguage` enum with all discovered locales
- **Automatic Setup**: Generated factory function handles all package coordination  
- **Type Safety**: Full compile-time checking restored
- **Documentation**: Generated code includes helpful comments and package mappings

## User Experience Goals

### For Package Authors
- **Zero Configuration**: Existing slang packages work without modification
- **Independence**: Packages remain independently usable
- **Standards Compliance**: Follows standard slang patterns

### for App Developers  
- **Simple Setup**: Add dependency + run build_runner = working system
- **Intuitive API**: Single cubit manages everything
- **Debugging Support**: Clear error messages and logging
- **IDE Support**: Full autocomplete and type checking

### For Team Collaboration
- **Consistent Patterns**: Same approach across all projects
- **Easy Onboarding**: New developers see familiar patterns
- **Maintainable**: Generated code is readable and well-documented

## Business Value
- **Faster Development**: Eliminates boilerplate and manual coordination
- **Fewer Bugs**: Type safety prevents common locale-related errors  
- **Better UX**: Seamless language switching across entire application
- **Scalability**: Easy to add new packages without touching existing code