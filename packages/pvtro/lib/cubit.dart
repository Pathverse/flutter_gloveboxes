import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:ui' as ui;

// Type definition for locale setter functions from subpackages
// Each subpackage will provide a function that takes a language code string
typedef LocaleSetter = void Function(String languageCode);

/// Generic locale cubit that works with a unified language code enum
/// T should be an enum that defines all available language codes (e.g., en, da, es, etc.)
/// This avoids importing any specific package's AppLocale enum
class LocaleCubit<T extends Enum> extends Cubit<T> {
  // List of locale setters from subpackages
  // Each function will be called with the language code string when locale changes
  final List<LocaleSetter> _subpackageLocaleSetters;

  // Function to convert the unified enum to language code string
  final String Function(T) _enumToLanguageCode;

  // Function to parse language code string back to unified enum
  final T? Function(String) _languageCodeToEnum;

  // Default locale enum value
  final T _defaultLocale;

  LocaleCubit({
    required T defaultLocale,
    required String Function(T) enumToLanguageCode,
    required T? Function(String) languageCodeToEnum,
    List<LocaleSetter>? subpackageLocaleSetters,
  }) : _subpackageLocaleSetters = subpackageLocaleSetters ?? [],
       _enumToLanguageCode = enumToLanguageCode,
       _languageCodeToEnum = languageCodeToEnum,
       _defaultLocale = defaultLocale,
       super(defaultLocale);

  /// Change the locale and notify all subpackages
  Future<void> changeLocale(T locale) async {
    if (state == locale) return;

    // Convert enum to language code string
    final languageCode = _enumToLanguageCode(locale);

    // Update all subpackage locales using the language code
    _updateSubpackageLocales(languageCode);

    // Update cubit state
    emit(locale);
  }

  /// Update all subpackage locales when main locale changes
  void _updateSubpackageLocales(String languageCode) {
    for (final localeSetter in _subpackageLocaleSetters) {
      try {
        localeSetter(languageCode);
      } catch (e) {
        // Handle error - could add logging here
        // In a real app, you might want to use a proper logger
      }
    }
  }

  /// Set locale to system default
  Future<void> setSystemLocale() async {
    final systemLocale = ui.PlatformDispatcher.instance.locale;
    final appLocale =
        _languageCodeToEnum(systemLocale.languageCode) ?? _defaultLocale;
    await changeLocale(appLocale);
  }

  /// Add a new subpackage locale setter
  void addSubpackageLocaleSetter(LocaleSetter setter) {
    _subpackageLocaleSetters.add(setter);
  }

  /// Remove a subpackage locale setter
  void removeSubpackageLocaleSetter(LocaleSetter setter) {
    _subpackageLocaleSetters.remove(setter);
  }

  /// Get current language code as string
  String get currentLanguageCode => _enumToLanguageCode(state);
}
