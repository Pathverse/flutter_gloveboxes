
### 1. Add Dependencies

```yaml
# pubspec.yaml
dependencies:
  pvtro: ^0.0.1
  # Your existing slang packages
  user_package: ^1.0.0
  admin_package: ^1.0.0

dev_dependencies:
  pvtro_builder: ^0.0.1
  build_runner: ^2.4.7
```

### 2. Create Trigger File

```dart
// lib/pvtro.dart - This triggers automatic code generation
library;

// pvtro will scan all packages and generate coordination code
```

### 3. Generate Coordination Code

```bash
dart run build_runner build
```

### 4. Use in Your App

```dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pvtro/helper.dart';

// Generated imports (no conflicts!)
import 'pvtro.unified_lang.dart';
import 'package:user_package/i18n/strings.g.dart' as user_strings;
import 'package:admin_package/i18n/strings.g.dart' as admin_strings;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // One-line setup for all packages
    return createPvtroApp<UnifiedLanguage>(
      localeCubit: createUnifiedLocaleCubit(UnifiedLanguage.en),
      additionalProviders: [
        createSlangProvider(user_strings.TranslationProvider.new),
        createSlangProvider(admin_strings.TranslationProvider.new),
      ],
      child: BlocBuilder<LocaleCubit<UnifiedLanguage>, UnifiedLanguage>(
        builder: (context, currentLocale) {
          return MaterialApp(
            title: 'Multi-Package App',
            home: HomePage(),
          );
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Language: ${context.read<LocaleCubit<UnifiedLanguage>>().state.name}'),
        actions: [
          // Change language across ALL packages with one call
          IconButton(
            icon: Icon(Icons.language),
            onPressed: () {
              context.read<LocaleCubit<UnifiedLanguage>>()
                  .changeLocale(UnifiedLanguage.es); // Updates everything!
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Use translations from different packages
          Text(context.userPackage.welcome.title),     // user_package
          Text(context.adminPackage.dashboard.title),  // admin_package
        ],
      ),
    );
  }
}
```