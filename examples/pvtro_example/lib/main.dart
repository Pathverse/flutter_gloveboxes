import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:pvtro/helper.dart';
import 'package:pvtro/cubit.dart';
import 'package:pvtro_example/i18n/strings.g.dart' as example_strings;
import 'package:pvtro_common/i18n/strings.g.dart' as common_strings;
import 'package:pvtro_conver/i18n/strings.g.dart' as conver_strings;

import 'pvtro.unified_lang.dart';
import 'widgets/language_selector.dart';
import 'widgets/welcome_section.dart';
import 'widgets/conversion_section.dart';
import 'widgets/pvtro_stats_card.dart';

void main() {
  runApp(const PvtroExampleApp());
}

class PvtroExampleApp extends StatelessWidget {
  const PvtroExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    final localeCubit = createUnifiedLocaleCubit(UnifiedLanguage.en);

    return createPvtroApp<UnifiedLanguage>(
      localeCubit: localeCubit,
      additionalProviders: [
        // Add slang TranslationProviders for all 3 packages
        createSlangProvider(example_strings.TranslationProvider.new),
        createSlangProvider(common_strings.TranslationProvider.new),
        createSlangProvider(conver_strings.TranslationProvider.new),
      ],
      child: BlocBuilder<LocaleCubit<UnifiedLanguage>, UnifiedLanguage>(
        builder: (context, currentLocale) {
          return ShadApp(
            title: 'Pvtro Example - Multi-Package Translation Coordination',
            theme: ShadThemeData(
              colorScheme: ShadColorScheme.fromName('blue'),
              brightness: Brightness.light,
            ),
            darkTheme: ShadThemeData(
              colorScheme: ShadColorScheme.fromName('blue'),
              brightness: Brightness.dark,
            ),
            home: const HomePage(),
          );
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.pvtroExample.app.title),
        backgroundColor: ShadTheme.of(context).colorScheme.background,
        foregroundColor: ShadTheme.of(context).colorScheme.foreground,
        elevation: 1,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(width: 200, child: const LanguageSelector()),
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Welcome Section
              WelcomeSection(),
              SizedBox(height: 24),

              // Two Column Layout for larger screens
              ResponsiveRow(
                children: [
                  ResponsiveColumn(
                    md: 6,
                    child: Column(
                      children: [ConversionSection(), SizedBox(height: 24)],
                    ),
                  ),
                  ResponsiveColumn(
                    md: 6,
                    child: Column(
                      children: [PvtroStatsCard(), SizedBox(height: 24)],
                    ),
                  ),
                ],
              ),

              // Demo Actions Section
              DemoActionsSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class ResponsiveRow extends StatelessWidget {
  final List<ResponsiveColumn> children;

  const ResponsiveRow({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 768) {
          // Desktop layout
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children.map((child) {
              return Expanded(
                flex: child.md,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: child.child,
                ),
              );
            }).toList(),
          );
        } else {
          // Mobile layout
          return Column(
            children: children.map((child) => child.child).toList(),
          );
        }
      },
    );
  }
}

class ResponsiveColumn {
  final int md;
  final Widget child;

  const ResponsiveColumn({required this.md, required this.child});
}

class DemoActionsSection extends StatelessWidget {
  const DemoActionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadCard(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.science, size: 28, color: Colors.purple),
                const SizedBox(width: 12),
                Text('Demo Actions', style: ShadTheme.of(context).textTheme.h3),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Test various pvtro features and see real-time translation coordination.',
              style: ShadTheme.of(context).textTheme.p.copyWith(
                color: ShadTheme.of(context).colorScheme.mutedForeground,
              ),
            ),
            const SizedBox(height: 24),

            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                ShadButton(
                  onPressed: () => _testLanguageSwitch(context),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.translate, size: 16),
                      SizedBox(width: 8),
                      Text('Test Language Switch'),
                    ],
                  ),
                ),
                ShadButton.outline(
                  onPressed: () => _showSystemInfo(context),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.info, size: 16),
                      SizedBox(width: 8),
                      Text('System Info'),
                    ],
                  ),
                ),
                ShadButton.outline(
                  onPressed: () => _cycleThroughLanguages(context),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.refresh, size: 16),
                      SizedBox(width: 8),
                      Text('Cycle Languages'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _testLanguageSwitch(context) {
    final cubit = context.read<LocaleCubit<UnifiedLanguage>>();
    final languages = [
      UnifiedLanguage.en,
      UnifiedLanguage.es,
      UnifiedLanguage.fr,
      UnifiedLanguage.da,
    ];
    final currentIndex = languages.indexOf(cubit.state);
    final nextLanguage = languages[(currentIndex + 1) % languages.length];

    cubit.changeLocale(nextLanguage);

    // Use ShadToast instead of SnackBar
    showShadDialog(
      context: context,
      builder: (context) => ShadDialog(
        title: const Text('Language Switched'),
        description: Text(
          'Switched to ${nextLanguage.name} - Both packages updated!',
        ),
        actions: [
          ShadButton.outline(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showSystemInfo(BuildContext context) {
    final cubit = context.read<LocaleCubit<UnifiedLanguage>>();

    showShadDialog(
      context: context,
      builder: (context) => ShadDialog(
        title: const Text('Pvtro System Information'),
        description: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('• Runtime Package: pvtro v0.0.1'),
            Text('• Builder Package: pvtro_builder v0.0.1'),
            Text('• Current Language: ${cubit.state.name}'),
            Text('• Language Code: ${cubit.currentLanguageCode}'),
            Text('• Total Languages: ${UnifiedLanguage.values.length}'),
            Text('• Packages: pvtro_common, pvtro_conver'),
            const SizedBox(height: 12),
            const Text('✅ Zero import conflicts'),
            const Text('✅ Automatic locale coordination'),
            const Text('✅ Type-safe enum management'),
            const Text('✅ Build-runner integration'),
          ],
        ),
        actions: [
          ShadButton.outline(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _cycleThroughLanguages(BuildContext context) async {
    final cubit = context.read<LocaleCubit<UnifiedLanguage>>();
    final languages = UnifiedLanguage.values
        .take(5)
        .toList(); // First 5 languages

    for (int i = 0; i < languages.length; i++) {
      await cubit.changeLocale(languages[i]);
      await Future.delayed(const Duration(milliseconds: 800));
    }

    // Check if the widget is still mounted before using context
    if (context.mounted) {
      // Use ShadDialog instead of SnackBar
      showShadDialog(
        context: context,
        builder: (context) => ShadDialog(
          title: const Text('Language Cycling Complete'),
          description: const Text(
            'Language cycling complete! All packages stayed synchronized.',
          ),
          actions: [
            ShadButton.outline(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}
