# System Patterns: pvtro

## Architecture Overview

pvtro uses a **two-package architecture** that separates runtime concerns from build-time code generation:

```
┌─────────────────┐    ┌──────────────────┐
│  pvtro_builder  │    │      pvtro       │
│ (Code Generator)│    │    (Runtime)     │
│                 │    │                  │
│ ┌─────────────┐ │    │ ┌──────────────┐ │
│ │AppLocaleScan│ │    │ │LocaleCubit<T>│ │
│ │ner          │ │    │ │              │ │
│ └─────────────┘ │    │ └──────────────┘ │
│ ┌─────────────┐ │    │ ┌──────────────┐ │
│ │UnifiedLang  │ │    │ │MultiTranslat │ │
│ │Generator    │ │    │ │ionProvider   │ │
│ └─────────────┘ │    │ └──────────────┘ │
└─────────────────┘    └──────────────────┘
         │                       │
         └───────────────────────┘
              build_runner
```

## Key Technical Decisions

### 1. Generic Cubit Design
**Pattern**: `LocaleCubit<T extends Enum>`
**Rationale**: Avoids importing specific AppLocale enums, maintains type safety
```dart
class LocaleCubit<T extends Enum> extends Cubit<T> {
  final String Function(T) _enumToLanguageCode;
  final T? Function(String) _languageCodeToEnum;
  // ...
}
```

### 2. Function-Based Locale Setters
**Pattern**: `typedef LocaleSetter = void Function(String languageCode);`
**Rationale**: Package-agnostic way to trigger locale changes
```dart
final List<LocaleSetter> subpackageLocaleSetters = [
  (code) => UserLocalSettings.setLocale(parseUserLocale(code)),
  (code) => AdminLocalSettings.setLocale(parseAdminLocale(code)),
];
```

### 3. Build-Time Package Discovery
**Pattern**: Scan package_config.json + analyze strings.g.dart files
**Rationale**: Automatic discovery without manual configuration
```dart
// Discovers: pvtro_common, pvtro_conver, user_package, etc.
// Analyzes: Each package's AppLocale enum values
// Generates: Unified enum + setup functions
```

### 4. Regex-Based Enum Parsing  
**Pattern**: Parse AppLocale declarations with filtered regex
**Rationale**: Handles complex slang-generated enum structures
```dart
final enumPattern = RegExp(r'enum\s+AppLocale\s+.*?\{(.*?)\}', dotAll: true);
final valuePattern = RegExp(r'(\w+)(?:\s*\([^)]*\))?(?:\s*,)?');
// Filter out Dart keywords: implements, mixin, with, etc.
```

## Component Relationships

### Runtime Package (pvtro)
```
LocaleCubit<T>
├── Generic type parameter avoids import conflicts
├── Function-based locale conversion
├── List of LocaleSetter functions
└── State management via flutter_bloc

MultiTranslationProvider  
├── Composes multiple Provider widgets
├── Reduces boilerplate in app setup
└── Standard provider pattern
```

### Builder Package (pvtro_builder)
```
AppLocaleScanner
├── Reads package_config.json
├── Scans for strings.g.dart files  
├── Parses AppLocale enums with regex
└── Extracts language codes

UnifiedLanguageGenerator
├── Creates UnifiedLanguage enum
├── Generates enum extension methods
├── Creates package-specific parsers
└── Generates cubit factory function

UnifiedLanguageBuilder (build_runner integration)
├── Implements Builder interface
├── Watches pvtro.dart trigger files
├── Coordinates scanning + generation
└── Outputs to lib/generated/
```

## Critical Implementation Paths

### Path 1: Package Discovery
1. **Package Config Analysis**: Read .dart_tool/package_config.json
2. **Path Resolution**: Handle relative vs absolute paths for local packages  
3. **File Discovery**: Search standard slang locations (lib/i18n/, lib/l10n/)
4. **Content Validation**: Verify AppLocale + LocaleSettings exist

### Path 2: Enum Extraction
1. **File Analysis**: Read strings.g.dart content
2. **Regex Parsing**: Extract enum declarations with complex patterns
3. **Value Filtering**: Remove Dart keywords (implements, mixin, etc.)
4. **Language Validation**: Ensure extracted values are valid language codes

### Path 3: Code Generation
1. **Enum Creation**: Generate UnifiedLanguage with all discovered codes
2. **Extension Methods**: Add .languageCode and .fromLanguageCode() 
3. **Package Parsers**: Create converter functions for each package
4. **Cubit Factory**: Generate createUnifiedLocaleCubit() with all setters

### Path 4: Build Integration
1. **Trigger Detection**: Watch for pvtro.dart files
2. **Asset Management**: Handle build_runner asset system
3. **Output Generation**: Write to proper locations with imports
4. **Error Handling**: Provide clear error messages for build failures

## Design Patterns in Use

- **Builder Pattern**: build_runner integration
- **Factory Pattern**: createUnifiedLocaleCubit() generated function
- **Observer Pattern**: Cubit state management with BlocBuilder
- **Composite Pattern**: MultiTranslationProvider widget composition  
- **Strategy Pattern**: Function-based locale conversion strategies
- **Code Generation**: Compile-time metaprogramming for type safety