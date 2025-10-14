import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'provider.dart';
import 'cubit.dart';

/// Helper function to create a complete pvtro setup with all necessary providers
/// This wraps the LocaleCubit and any additional translation providers
Widget createPvtroApp<T extends Enum>({
  required Widget child,
  required LocaleCubit<T> localeCubit,
  List<Widget Function(Widget child)> additionalProviders = const [],
}) {
  return MultiTranslationProvider(
    providers: [
      // Always include the LocaleCubit provider with explicit type
      (child) => BlocProvider<LocaleCubit<T>>(
        create: (_) => localeCubit,
        child: child,
      ),
      // Add any additional providers (like slang TranslationProviders)
      ...additionalProviders,
    ],
    child: child,
  );
}

/// Helper function to create slang TranslationProvider wrapper
/// This is a convenience function to wrap individual slang TranslationProviders
Widget Function(Widget child) createSlangProvider(
  Widget Function({required Widget child}) providerBuilder,
) {
  return (child) => providerBuilder(child: child);
}

/// Convert Flutter Locale to language code string
/// Handles both simple locales (en) and complex ones (en_US, zh_Hans_CN)
String localeToLanguageCode(Locale locale) {
  if (locale.scriptCode != null && locale.countryCode != null) {
    // Handle full format: zh_Hans_CN
    return '${locale.languageCode}_${locale.scriptCode!}_${locale.countryCode!}';
  } else if (locale.scriptCode != null) {
    // Handle script codes like zhHans (camelCase to match generated format)
    return '${locale.languageCode}${locale.scriptCode!}';
  } else if (locale.countryCode != null) {
    // Handle country codes like en_US (convert to en_us for consistency)
    return '${locale.languageCode}_${locale.countryCode!.toLowerCase()}';
  } else {
    // Simple language code like en, fr, de
    return locale.languageCode;
  }
}

/// Convert language code string to Flutter Locale
/// Parses common patterns: en, en_US, zhHans, zh_Hans_CN
Locale languageCodeToLocale(String languageCode) {
  // First check for camelCase script codes like zhHans
  if (languageCode.length > 2) {
    final match = RegExp(
      r'^([a-z]{2,3})([A-Z][a-z]+)$',
    ).firstMatch(languageCode);
    if (match != null) {
      // Script code in camelCase: zhHans
      return Locale.fromSubtags(
        languageCode: match.group(1)!,
        scriptCode: match.group(2)!,
      );
    }
  }

  // Then check underscore-separated formats
  final parts = languageCode.split('_');

  if (parts.length == 1) {
    // Simple: en, fr, de
    return Locale(parts[0]);
  } else if (parts.length == 2) {
    final first = parts[0]; // en
    final second = parts[1]; // US or Hans

    // Check if second part looks like a script code (starts with uppercase)
    if (second.length > 2 && second[0].toUpperCase() == second[0]) {
      // Script code: zh_Hans
      return Locale.fromSubtags(languageCode: first, scriptCode: second);
    } else {
      // Country code: en_US
      return Locale(first, second.toUpperCase());
    }
  } else if (parts.length == 3) {
    // Full format: zh_Hans_CN
    return Locale.fromSubtags(
      languageCode: parts[0],
      scriptCode: parts[1],
      countryCode: parts[2].toUpperCase(),
    );
  }

  // Fallback to simple locale
  return Locale(parts[0]);
}

/// Convert Flutter Locale to unified enum using a LocaleCubit
/// This requires the cubit's languageCodeToEnum converter
T? localeToEnum<T extends Enum>(
  Locale locale,
  T? Function(String) languageCodeToEnum,
) {
  final languageCode = localeToLanguageCode(locale);
  return languageCodeToEnum(languageCode);
}

/// Convert unified enum to Flutter Locale using a LocaleCubit
/// This requires the cubit's enumToLanguageCode converter
Locale enumToLocale<T extends Enum>(
  T enumValue,
  String Function(T) enumToLanguageCode,
) {
  final languageCode = enumToLanguageCode(enumValue);
  return languageCodeToLocale(languageCode);
}
