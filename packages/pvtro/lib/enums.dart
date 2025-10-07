/// Enums for pvtro translation management

/// Unified language code enum that represents all supported languages
/// This enum should contain all language codes that any subpackage supports
/// The builder will generate this automatically based on discovered slang packages
enum UnifiedLanguage {
  en,
  da,
  es,
  fr,
  he,
  isIs,
  ko,
  nb,
  nl,
  no,
  sv,
  zh,
  zhHans,
}

/// Extension to convert UnifiedLanguage to language code string
extension UnifiedLanguageExtension on UnifiedLanguage {
  String get languageCode {
    switch (this) {
      case UnifiedLanguage.en:
        return 'en';
      case UnifiedLanguage.da:
        return 'da';
      case UnifiedLanguage.es:
        return 'es';
      case UnifiedLanguage.fr:
        return 'fr';
      case UnifiedLanguage.he:
        return 'he';
      case UnifiedLanguage.isIs:
        return 'is';
      case UnifiedLanguage.ko:
        return 'ko';
      case UnifiedLanguage.nb:
        return 'nb';
      case UnifiedLanguage.nl:
        return 'nl';
      case UnifiedLanguage.no:
        return 'no';
      case UnifiedLanguage.sv:
        return 'sv';
      case UnifiedLanguage.zh:
        return 'zh';
      case UnifiedLanguage.zhHans:
        return 'zh_hans';
    }
  }

  /// Parse language code string to UnifiedLanguage
  static UnifiedLanguage? fromLanguageCode(String code) {
    switch (code.toLowerCase()) {
      case 'en':
        return UnifiedLanguage.en;
      case 'da':
        return UnifiedLanguage.da;
      case 'es':
        return UnifiedLanguage.es;
      case 'fr':
        return UnifiedLanguage.fr;
      case 'he':
        return UnifiedLanguage.he;
      case 'is':
        return UnifiedLanguage.isIs;
      case 'ko':
        return UnifiedLanguage.ko;
      case 'nb':
        return UnifiedLanguage.nb;
      case 'nl':
        return UnifiedLanguage.nl;
      case 'no':
        return UnifiedLanguage.no;
      case 'sv':
        return UnifiedLanguage.sv;
      case 'zh':
        return UnifiedLanguage.zh;
      case 'zh_hans':
      case 'zh-hans':
        return UnifiedLanguage.zhHans;
      default:
        return null;
    }
  }
}
