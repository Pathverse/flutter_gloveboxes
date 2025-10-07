import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:pvtro/cubit.dart';
import 'package:pvtro_common/i18n/strings.g.dart';
import '../pvtro.unified_lang.dart';

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({super.key});

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
                const Icon(Icons.waving_hand, size: 32, color: Colors.amber),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Welcome to Pvtro!',
                    style: ShadTheme.of(context).textTheme.h2,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'This example demonstrates pvtro\'s ability to coordinate translations across multiple slang packages seamlessly.',
              style: ShadTheme.of(context).textTheme.p.copyWith(
                color: ShadTheme.of(context).colorScheme.mutedForeground,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                ShadButton(
                  onPressed: () => _showInfoDialog(context),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.info_outline, size: 16),
                      const SizedBox(width: 8),
                      Text(context.pvtroCommon.commonWebFeatures.help),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                ShadButton.outline(
                  onPressed: () => _showCurrentLocaleInfo(context),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.language, size: 16),
                      const SizedBox(width: 8),
                      Text(context.pvtroCommon.commonWebFeatures.settings),
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

  void _showInfoDialog(BuildContext context) {
    showShadDialog(
      context: context,
      builder: (context) => ShadDialog(
        title: Text(context.pvtroCommon.commonWebFeatures.aboutUs),
        description: const Text(
          'Pvtro is a Provider-based Translation Orchestrator that automatically coordinates slang translations across multiple packages, eliminating import conflicts and providing unified locale management.',
        ),
        actions: [
          ShadButton.outline(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(context.pvtroCommon.buttons.close),
          ),
        ],
      ),
    );
  }

  void _showCurrentLocaleInfo(BuildContext context) {
    final currentLocale = context.read<LocaleCubit<UnifiedLanguage>>().state;
    final languageCode = context
        .read<LocaleCubit<UnifiedLanguage>>()
        .currentLanguageCode;

    showShadDialog(
      context: context,
      builder: (context) => ShadDialog(
        title: Text('${context.pvtroCommon.commonWebFeatures.settings} Info'),
        description: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Current Language: ${currentLocale.name}'),
            const SizedBox(height: 8),
            Text('Language Code: $languageCode'),
            const SizedBox(height: 8),
            Text('Packages Coordinated: 2 (pvtro_common, pvtro_conver)'),
          ],
        ),
        actions: [
          ShadButton.outline(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(context.pvtroCommon.buttons.close),
          ),
        ],
      ),
    );
  }
}
