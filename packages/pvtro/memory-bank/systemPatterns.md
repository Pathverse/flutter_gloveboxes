# System Patterns: pvtro

## Architecture Overview

pvtro uses a **two-package architecture** with revolutionary automation that separates runtime concerns from build-time code generation:

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
│ ┌─────────────┐ │    │                  │
│ │🚀AUTO-SETUP │ │    │                  │
│ │createUnified│ │    │                  │
│ │PvtroApp()   │ │    │                  │
│ └─────────────┘ │    │                  │
└─────────────────┘    └──────────────────┘
         │                       │
         └───────────────────────┘
              build_runner
         🚀 GENERATES COMPLETE
            AUTOMATION SETUP
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

### Builder Package (pvtro_builder) - Enhanced Architecture
```
Utility Framework (NEW)
├── PackageConfigUtils - Package configuration management
├── FileSystemUtils - File operations and path handling
├── StringUtils - String processing and sanitization
├── CodeGenUtils - Professional code generation helpers
└── SlangAnalysisUtils - Slang package analysis

AppLocaleScanner (Refactored)
├── Orchestrates utility functions
├── Delegates to PackageConfigUtils.getPackageConfig()
├── Uses SlangAnalysisUtils.scanPackageForSlang()
└── Reduced from 280+ lines to 25 lines

UnifiedLanguageGenerator (Enhanced)
├── Uses CodeGenUtils for clean code generation
├── Leverages StringUtils for identifier sanitization
├── Professional documentation generation
└── Type-safe switch statement generation

UnifiedLanguageBuilder (Streamlined)
├── Implements Builder interface
├── Uses utility framework for coordination
├── Enhanced error reporting and logging
└── Improved file header generation

CLI Tool (NEW)
├── pvtro_builder executable
├── Command-line interface for operations
├── Help, verbose, and custom output options
└── Enhanced developer workflow support
```

## Critical Implementation Paths (Enhanced with Utilities)

### Path 1: Package Discovery (Utility-Based)
1. **Package Config Analysis**: PackageConfigUtils.getPackageConfig() handles JSON parsing
2. **Path Resolution**: Utility handles relative vs absolute paths with adjustment logic
3. **Package Filtering**: PackageConfigUtils.filterPvtroPackages() removes internal packages
4. **File Discovery**: FileSystemUtils.findStringsFile() searches standard slang locations
5. **Content Validation**: SlangAnalysisUtils.hasSlangSupport() verifies package compatibility

### Path 2: Enum Extraction (Utility-Based)
1. **File Analysis**: SlangAnalysisUtils.analyzeStringsFile() handles content reading
2. **Regex Parsing**: SlangAnalysisUtils.extractLocalesFromEnum() uses robust patterns
3. **Value Filtering**: StringUtils.isLanguageCode() removes Dart keywords and validates
4. **Language Validation**: Centralized validation with enhanced keyword filtering
5. **Data Structuring**: SlangPackage and SlangAnalysis classes for type safety

### Path 3: Code Generation (Utility-Based)
1. **File Headers**: CodeGenUtils.generateFileHeader() creates professional headers
2. **Enum Creation**: CodeGenUtils.generateEnum() with EnumValue helper classes
3. **Extension Methods**: CodeGenUtils.generateMethod() for type-safe method generation
4. **Switch Statements**: CodeGenUtils.generateSwitch() with SwitchCase helper classes
5. **Import Management**: Organized import generation with proper structure

### 🚀 Path 4: BREAKTHROUGH - Complete Automation Generation (NEW)
1. **Auto-Discovery**: Scans ALL packages including transitive dependencies
2. **Provider Generation**: Automatically creates TranslationProvider setup for each package
3. **Complete App Function**: Generates `createUnifiedPvtroApp()` with all providers included
4. **Zero Manual Setup**: No imports or configuration required from developer
5. **Future-Proof**: Automatically adapts when new packages are added

### Path 5: Build Integration (Enhanced)
1. **Trigger Detection**: Enhanced file watching with better error handling
2. **Asset Management**: Improved build_runner integration with proper coordination
3. **Output Generation**: Professional code generation with comprehensive documentation
4. **Error Handling**: Enhanced diagnostic information and build failure reporting
5. **CLI Integration**: Command-line tools for advanced developer workflows

### Path 6: CLI Operations (NEW)
1. **Argument Parsing**: ArgParser integration for command-line interface
2. **Verbose Logging**: Enhanced diagnostic output for debugging
3. **Custom Output**: Flexible output path configuration
4. **Help System**: Comprehensive help and usage information
5. **Error Recovery**: Graceful handling of CLI operation failures

## Design Patterns in Use

### 🚀 Revolutionary Automation Pattern (BREAKTHROUGH)
**Complete Automation**: Zero-setup developer experience
```dart
// BEFORE: Manual setup (~20 lines)
return createPvtroApp<UnifiedLanguage>(
  localeCubit: createUnifiedLocaleCubit(UnifiedLanguage.en),
  additionalProviders: [
    createSlangProvider(package1_strings.TranslationProvider.new),
    createSlangProvider(package2_strings.TranslationProvider.new),
    // ... manual imports for each package
  ],
  child: /* app */,
);

// 🚀 AFTER: Complete automation (2 lines)
return createUnifiedPvtroApp(
  /* app */,
  UnifiedLanguage.en, // optional
);
```

### Core Design Patterns
- **Builder Pattern**: build_runner integration
- **Factory Pattern**: createUnifiedLocaleCubit() generated function
- **Observer Pattern**: Cubit state management with BlocBuilder
- **Composite Pattern**: MultiTranslationProvider widget composition  
- **Strategy Pattern**: Function-based locale conversion strategies
- **Code Generation**: Compile-time metaprogramming for type safety