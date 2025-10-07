import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:pvtro/cubit.dart';
import '../pvtro.unified_lang.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit<UnifiedLanguage>, UnifiedLanguage>(
      builder: (context, currentLocale) {
        return ShadSelect<UnifiedLanguage>(
          placeholder: const Text('Select Language'),
          initialValue: currentLocale,
          onChanged: (value) {
            if (value != null) {
              context.read<LocaleCubit<UnifiedLanguage>>().changeLocale(value);
            }
          },
          selectedOptionBuilder: (context, value) => Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(_getLanguageIcon(value), size: 16),
              const SizedBox(width: 8),
              Text(_getLanguageDisplayName(value)),
            ],
          ),
          options: UnifiedLanguage.values.map((language) {
            return ShadOption(
              value: language,
              child: Row(
                children: [
                  Icon(_getLanguageIcon(language), size: 16),
                  const SizedBox(width: 8),
                  Text(_getLanguageDisplayName(language)),
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }

  String _getLanguageDisplayName(UnifiedLanguage language) {
    switch (language) {
      case UnifiedLanguage.en:
        return 'English';
      case UnifiedLanguage.da:
        return 'Dansk';
      case UnifiedLanguage.es:
        return 'Español';
      case UnifiedLanguage.fr:
        return 'Français';
      case UnifiedLanguage.he:
        return 'עברית';
      case UnifiedLanguage.isIs:
        return 'Íslenska';
      case UnifiedLanguage.ko:
        return '한국어';
      case UnifiedLanguage.nb:
        return 'Norsk (Bokmål)';
      case UnifiedLanguage.nl:
        return 'Nederlands';
      case UnifiedLanguage.no:
        return 'Norsk';
      case UnifiedLanguage.sv:
        return 'Svenska';
      case UnifiedLanguage.zh:
        return '繁體中文';
      case UnifiedLanguage.zhHans:
        return '简体中文';
    }
  }

  IconData _getLanguageIcon(UnifiedLanguage language) {
    switch (language) {
      case UnifiedLanguage.en:
        return Icons.language;
      case UnifiedLanguage.da:
        return Icons.public;
      case UnifiedLanguage.es:
        return Icons.translate;
      case UnifiedLanguage.fr:
        return Icons.g_translate;
      case UnifiedLanguage.he:
        return Icons.text_fields;
      case UnifiedLanguage.isIs:
        return Icons.ice_skating;
      case UnifiedLanguage.ko:
        return Icons.translate_outlined;
      case UnifiedLanguage.nb:
      case UnifiedLanguage.no:
        return Icons.nordic_walking;
      case UnifiedLanguage.nl:
        return Icons.flag;
      case UnifiedLanguage.sv:
        return Icons.forest;
      case UnifiedLanguage.zh:
      case UnifiedLanguage.zhHans:
        return Icons.font_download_outlined;
    }
  }
}
