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

### Package Structure
```
packages/
├── pvtro/                    # Runtime package
│   ├── lib/
│   │   ├── cubit.dart       # Generic LocaleCubit<T>
│   │   ├── provider.dart    # MultiTranslationProvider widget
│   │   ├── enums.dart       # Common enum utilities
│   │   └── pvtro.dart       # Main export file
│   └── test/
│       └── cubit_test.dart  # Unit tests
│
└── pvtro_builder/           # Code generation package  
    ├── lib/src/builders/
    │   ├── applocale_scanner.dart      # Package discovery & analysis
    │   ├── unified_language_generator.dart # Code generation logic
    │   └── unified_language_builder.dart  # build_runner integration
    ├── bin/
    │   └── pvtro.dart       # CLI tool (future)
    └── builder.dart         # Main export
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

### Build Dependencies (pvtro_builder)  
```yaml
dependencies:
  analyzer: ^6.4.1      # Code analysis
  args: ^2.4.2          # CLI parsing
  build: ^2.4.1         # Build system core
  build_runner: ^2.4.7  # Build orchestration
  flutter:
    sdk: flutter
  glob: ^2.1.2          # File discovery
  path: ^1.9.0          # Path manipulation
  pvtro:
    path: ../pvtro      # Runtime package
  yaml: ^3.1.2          # Config parsing
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

### Development Workflow  
```bash
# Watch mode for active development
dart run build_runner watch

# Clean build (force regeneration)
dart run build_runner build --delete-conflicting-outputs

# Build specific packages only  
dart run build_runner build --filter="lib/pvtro.dart"
```

### Testing Patterns
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
# slang.yaml in each package
base_locale: en
output_directory: lib/i18n
output_file_name: strings.g.dart
class_name: Translations
translate_var: t
enum_name: AppLocale
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