# Tech Context: pvtro

## Technologies Used

### Core Technologies
- **Dart SDK**: 3.9.2+ (leverages modern language features)
- **Flutter**: 3.35.4+ (for flutter_bloc and widget system)
- **build_runner**: 2.4.13 (code generation pipeline)
- **flutter_bloc**: 8.1.6 (state management pattern)
- **slang**: 4.9.0+ (translation framework this orchestrates)

### Analysis & Code Generation
- **analyzer**: 6.4.1+ (Dart code analysis for enum parsing)
- **code_builder**: 4.11.0+ (programmatic Dart code generation)
- **glob**: 2.1.2+ (file pattern matching for package discovery)
- **path**: 1.9.0+ (cross-platform path manipulation)

### Development Tools  
- **yaml**: 3.1.2+ (parsing configuration files)
- **args**: 2.4.2+ (CLI argument handling in pvtro_builder bin)

## Development Setup

### Package Structure (Enhanced)
```
packages/
├── pvtro/                    # Runtime package
│   ├── lib/
│   │   ├── cubit.dart       # Generic LocaleCubit<T>
│   │   ├── provider.dart    # MultiTranslationProvider widget
│   │   ├── enums.dart       # Common enum utilities
│   │   ├── helper.dart      # Helper functions
│   │   └── pvtro.dart       # Main export file
│   └── test/
│       └── cubit_test.dart  # Unit tests
│
└── pvtro_builder/           # Code generation package (Enhanced)
    ├── lib/
    │   ├── src/
    │   │   ├── utils/       # NEW: Utility framework
    │   │   │   ├── package_config.dart    # Package configuration
    │   │   │   ├── file_system.dart       # File operations
    │   │   │   ├── string_utils.dart      # String processing
    │   │   │   ├── codegen.dart           # Code generation
    │   │   │   └── slang_analysis.dart    # Slang analysis
    │   │   ├── utils.dart   # Utility exports
    │   │   └── builders/    # Refactored builders
    │   │       ├── applocale_scanner.dart      # Streamlined scanner
    │   │       ├── unified_language_generator.dart # Enhanced generator
    │   │       └── unified_language_builder.dart  # Enhanced builder
    │   ├── builder.dart     # Main export
    │   └── pvtro_builder.dart # Library export
    ├── bin/
    │   └── pvtro_builder.dart # CLI tool (IMPLEMENTED)
    └── pubspec.yaml         # Enhanced with executables
```

### Example Project Structure
```
examples/
└── pvtro_example/
    ├── lib/
    │   ├── main.dart        # Demo app
    │   ├── pvtro.dart       # Trigger file  
    │   └── pvtro.unified_lang.dart  # Generated file
    ├── pubspec.yaml         # Dependencies
    └── build.yaml           # Build configuration
```

## Technical Constraints

### Design Constraints
- **No Import Conflicts**: Cannot import multiple AppLocale enums
- **Generic Type Safety**: Must maintain compile-time type checking
- **Package Independence**: Packages must work standalone
- **Build Performance**: Fast incremental builds required

### Runtime Constraints  
- **Memory Efficiency**: Minimal overhead for locale management
- **Error Resilience**: Gracefully handle missing packages/locales
- **Flutter Integration**: Standard flutter_bloc patterns

### Build-Time Constraints
- **File System Access**: Limited to package boundaries
- **Regex Complexity**: Parse complex slang-generated code structures
- **Path Resolution**: Handle monorepo local dependencies correctly

## Dependencies

### Runtime Dependencies (pvtro)
```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_bloc: ^8.1.3  # State management
```

### Build Dependencies (pvtro_builder) - Enhanced
```yaml
dependencies:
  analyzer: ^6.2.0      # Code analysis (updated)
  args: ^2.4.2          # CLI parsing
  build: ^2.4.1         # Build system core
  build_runner: ^2.4.7  # Build orchestration
  flutter:
    sdk: flutter
  glob: ^2.1.2          # File discovery
  path: ^1.8.3          # Path manipulation (updated)
  pvtro:
    path: ../pvtro      # Runtime package
  yaml: ^3.1.2          # Config parsing

# NEW: CLI executable configuration
executables:
  pvtro_builder: pvtro_builder  # CLI tool executable
```

### Example Project Dependencies
```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_bloc: ^8.1.6
  pvtro:
    path: ../../packages/pvtro
  # Slang packages being orchestrated
  pvtro_common:
    path: ../../packages/pvtro_common  
  pvtro_conver:
    path: ../../packages/pvtro_conver

dev_dependencies:
  build_runner: ^2.4.7
  pvtro_builder:
    path: ../../packages/pvtro_builder
```

## Tool Usage Patterns

### Code Generation Workflow
```bash
# 1. Add pvtro dependencies to pubspec.yaml
# 2. Create trigger file: lib/pvtro.dart
# 3. Run build_runner
dart run build_runner build

# 4. Generated files appear
# lib/pvtro.unified_lang.dart
```

### Streamlined App Setup (NEW)
```dart
// Single-line setup with helper function
return createPvtroApp<UnifiedLanguage>(
  localeCubit: createUnifiedLocaleCubit(),
  additionalProviders: [
    createSlangProvider(CommonTranslationProvider.new),
    createSlangProvider(ConverTranslationProvider.new),
  ],
  child: YourApp(),
);
```

### Development Workflow (Enhanced)
```bash
# Traditional build_runner workflow
dart run build_runner watch
dart run build_runner build --delete-conflicting-outputs
dart run build_runner build --filter="lib/pvtro.dart"

# NEW: CLI tool workflow
dart run pvtro_builder --help              # Show usage information
dart run pvtro_builder --verbose           # Verbose scanning output
dart run pvtro_builder --output lib/custom_translations.dart  # Custom output
dart run pvtro_builder --scan-packages     # Scan all dependencies

# Enhanced debugging
dart run pvtro_builder --verbose --scan-packages  # Detailed package discovery
```

### Testing Patterns (Enhanced)
```dart
// Unit test LocaleCubit with mock locale setters
testWidgets('changeLocale updates all packages', (tester) async {
  final mockSetters = <String>[];
  final cubit = LocaleCubit<TestEnum>(
    defaultLocale: TestEnum.en,
    enumToLanguageCode: (e) => e.name,
    languageCodeToEnum: (s) => TestEnum.values.byName(s),
    subpackageLocaleSetters: [
      (code) => mockSetters.add('package1:$code'),
      (code) => mockSetters.add('package2:$code'),
    ],
  );
  
  await cubit.changeLocale(TestEnum.fr);
  
  expect(mockSetters, ['package1:fr', 'package2:fr']);
});

// NEW: Utility function testing patterns
test('StringUtils sanitizes enum names correctly', () {
  expect(StringUtils.sanitizeEnumName('is'), 'isIs');
  expect(StringUtils.sanitizeEnumName('zh-Hans'), 'zh_Hans');
  expect(StringUtils.sanitizeEnumName('valid'), 'valid');
});

test('PackageConfigUtils filters pvtro packages', () {
  final packages = [
    PackageInfo(name: 'pvtro', rootPath: '/path'),
    PackageInfo(name: 'pvtro_builder', rootPath: '/path'),
    PackageInfo(name: 'user_package', rootPath: '/path'),
  ];
  
  final filtered = PackageConfigUtils.filterPvtroPackages(packages);
  expect(filtered.length, 1);
  expect(filtered.first.name, 'user_package');
});

// CLI tool testing
test('CLI argument parsing', () {
  final args = ['--verbose', '--output', 'custom.dart'];
  // Test CLI argument handling
});
```

## Supported Language Matrix

Currently tested with 13 language codes across multiple packages:
- **en** (English) - base/fallback language
- **da** (Danish), **es** (Spanish), **fr** (French)  
- **he** (Hebrew), **isIs** (Icelandic), **ko** (Korean)
- **nb** (Norwegian Bokmål), **nl** (Dutch), **no** (Norwegian)
- **sv** (Swedish), **zh** (Chinese Traditional), **zhHans** (Chinese Simplified)

## Integration Patterns

### Standard slang Project Integration
```yaml
# slang.yaml in each package (with unique translate_var)
base_locale: en
output_directory: lib/i18n
output_file_name: strings.g.dart
class_name: Translations
translate_var: pvtroCommon  # Unique per package to avoid conflicts
enum_name: AppLocale
```

### Usage Pattern
```dart
// Access translations with package-specific variable names
context.pvtroCommon.buttons.close      // pvtro_common package
context.pvtroConver.units.temperature  // pvtro_conver package
```

### Build Configuration
```yaml
# build.yaml in consumer project
targets:
  $default:
    builders:
      pvtro_builder:pvtro_unified_language_builder:
        enabled: true
        runs_before: [build_resolvers:transitive_digests]
```