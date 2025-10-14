# pvtro

**Provider-based Translation Orchestrator** - A Flutter package that automatically coordinates translations across multiple slang-enabled packages.

## The Problem

Using [slang](https://pub.dev/packages/slang) across multiple packages creates several critical challenges:

> **⚠️ Import Conflicts**: Cannot import multiple `AppLocale` enums from different packages due to naming conflicts
> 
> **⚠️ Coordination Issues**: No unified way to change locales across all packages simultaneously
> 
> **⚠️ Type Safety Loss**: Hard to maintain type-safe locale management across package boundaries
> 
> **⚠️ Manual Synchronization**: Each package's locale must be manually updated when language changes

## The Solution

pvtro eliminates these problems through **automatic discovery and unified coordination**:

✅ **Zero Import Conflicts** - Never import package-specific `AppLocale` enums  
✅ **Single Point of Control** - One `changeLocale()` call updates all packages  
✅ **Type Safety Preserved** - Full compile-time checking with generated unified enum  
✅ **Automatic Discovery** - Scans all packages and generates coordination code  
✅ **Simple Setup** - Works with existing slang packages without modification  

## Quick Start
to see full example, visit the [example project](https://github.com/Pathverse/flutter_gloveboxes/tree/main/examples/pvtro_example)


## How It Works

1. **🔍 Discovery**: pvtro scans all your packages for slang-generated files
2. **🏗️ Generation**: Creates a unified `UnifiedLanguage` enum with all found locales  
3. **🔗 Coordination**: Generates setup code that connects all packages
4. **🎯 Usage**: Single cubit manages locale state across your entire app

## Generated Code Example

pvtro automatically generates clean, documented code:

```dart
// Generated: lib/pvtro.unified_lang.dart
enum UnifiedLanguage {
  en,    // English
  es,    // Spanish  
  fr,    // French
  de,    // German
  // ... all discovered locales
}

// Generated cubit factory
LocaleCubit<UnifiedLanguage> createUnifiedLocaleCubit({
  UnifiedLanguage defaultLocale = UnifiedLanguage.en,
}) {
  return LocaleCubit<UnifiedLanguage>(
    defaultLocale: defaultLocale,
    enumToLanguageCode: (locale) => locale.languageCode,
    languageCodeToEnum: (code) => UnifiedLanguageExtension.fromLanguageCode(code),
    subpackageLocaleSetters: [
      // Automatically generated setters for each package
      (languageCode) {
        final locale = _parseUserPackageLocale(languageCode);
        if (locale != null) user_i18n.LocaleSettings.setLocale(locale);
      },
      (languageCode) {
        final locale = _parseAdminPackageLocale(languageCode);
        if (locale != null) admin_i18n.LocaleSettings.setLocale(locale);
      },
    ],
  );
}
```

## CLI Tool

pvtro includes a command-line tool for advanced operations:

```bash
# Show help
dart run pvtro_builder --help

# Verbose package scanning
dart run pvtro_builder --verbose

# Custom output location
dart run pvtro_builder --output lib/custom_translations.dart
```

## Package Requirements

- **Flutter SDK**: 3.35.4+
- **Dart SDK**: 3.9.2+
- **slang**: Any version (pvtro works with your existing setup)

## Example Project Structure

```
your_app/
├── lib/
│   ├── main.dart
│   ├── pvtro.dart                    # Trigger file
│   └── pvtro.unified_lang.dart       # Generated coordination
├── packages/
│   ├── user_package/
│   │   └── lib/i18n/strings.g.dart   # slang generated
│   └── admin_package/
│       └── lib/i18n/strings.g.dart   # slang generated
└── pubspec.yaml
```

## Key Benefits

- 🚫 **No Import Conflicts** - Eliminates `AppLocale` naming conflicts
- 🎯 **Single Source of Truth** - One enum, one cubit, one call
- 🔒 **Type Safety** - Full compile-time checking preserved
- 🤖 **Zero Configuration** - Works with existing slang packages
- 📦 **Unlimited Packages** - Supports any number of slang-enabled packages
- 🔄 **Real-time Sync** - All packages update simultaneously

## Contributing

This package is part of the [flutter_gloveboxes](https://github.com/Pathverse/flutter_gloveboxes) monorepo.

## License

MIT License - see [LICENSE](LICENSE) file for details.
