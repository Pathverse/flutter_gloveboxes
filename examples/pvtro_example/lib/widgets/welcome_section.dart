import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:pvtro/cubit.dart';
import 'package:pvtro_example/i18n/strings.g.dart';
import 'package:pvtro_common/i18n/strings.g.dart' as common;
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
                    context.pvtroExample.welcome.title,
                    style: ShadTheme.of(context).textTheme.h2,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              context.pvtroExample.welcome.description,
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
                      Text(context.pvtroExample.welcome.getStarted),
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
                      Text(context.pvtroExample.actions.help),
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
        title: Text(context.pvtroExample.dialogs.about.title),
        description: Text(context.pvtroExample.dialogs.about.description),
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
