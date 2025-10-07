# pvtro_builder

A build runner tool that automatically scans for slang translation providers across all subpackages and generates unified language management code.

## Features

- 🔍 **Automatic Discovery**: Scans all dependencies for slang-generated translation files
- 🌐 **Unified Language Enum**: Generates a single enum with all discovered language codes
- 🔧 **Locale Coordination**: Creates setup code to synchronize locale changes across all packages
- 📦 **Package Isolation**: Avoids importing specific package AppLocale enums to prevent compatibility issues

## How it Works

1. **Scanning**: The builder scans all packages in your project for slang translation files (`strings.g.dart`)
2. **Analysis**: Extracts available language codes from each package's `AppLocale` enum
3. **Generation**: Creates:
   - `UnifiedLanguage` enum with all discovered language codes
   - `LocaleCubit` setup code that coordinates locale changes across all packages
   - Helper functions to convert between unified enum and package-specific enums

## Usage

### 1. Add dependencies

Add to your `pubspec.yaml`:

```yaml
dependencies:
  pvtro: ^0.0.1

dev_dependencies:
  pvtro_builder: ^0.0.1
  build_runner: ^2.4.7
```

### 2. Create trigger file

Create `lib/pvtro.dart` (this triggers the builder):

```dart
// This file triggers pvtro_builder
// The generated files will be created in lib/generated/
export 'generated/pvtro_generated.dart';
```

### 3. Run the builder

```bash
dart run build_runner build
```

### 4. Use the generated code

```dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_app/pvtro.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => createUnifiedLocaleCubit(
        defaultLocale: UnifiedLanguage.en,
      ),
      child: BlocBuilder<LocaleCubit<UnifiedLanguage>, UnifiedLanguage>(
        builder: (context, locale) {
          return MaterialApp(
            title: 'Multi-package Translations',
            home: MyHomePage(),
          );
        },
      ),
    );
  }
}
```

## Generated Files

The builder generates these files in `lib/generated/`:

- **`unified_language.dart`**: Contains the `UnifiedLanguage` enum with all discovered language codes
- **`locale_setup.dart`**: Contains the `createUnifiedLocaleCubit()` function and package-specific locale setters
- **`pvtro_generated.dart`**: Barrel file that exports everything

## Requirements

- Flutter/Dart project with slang-generated translation files
- Each package should have a `strings.g.dart` file with `AppLocale` enum and `LocaleSettings` class
- Standard slang project structure
