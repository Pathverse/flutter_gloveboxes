/// Utilities for string processing and code generation
class StringUtils {
  /// Sanitize locale code to be a valid Dart identifier
  static String sanitizeEnumName(String locale) {
    // Handle special cases
    final sanitized = locale
        .replaceAll('-', '_')
        .replaceAll(RegExp(r'[^a-zA-Z0-9_]'), '_');

    // Handle Dart keywords and special cases
    switch (sanitized.toLowerCase()) {
      case 'is':
        return 'isIs';
      case 'in':
        return 'inIn';
      case 'if':
        return 'ifIf';
      case 'do':
        return 'doDo';
      case 'try':
        return 'tryTry';
      case 'for':
        return 'forFor';
      case 'new':
        return 'newNew';
      case 'var':
        return 'varVar';
      case 'int':
        return 'intInt';
      default:
        return sanitized;
    }
  }

  /// Capitalize first letter of a string
  static String capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }

  /// Get common variations of a locale code for matching
  static List<String> getLocaleVariations(String locale) {
    final variations = <String>[locale.toLowerCase()];

    // Add common variations
    if (locale.contains('_')) {
      variations.add(locale.replaceAll('_', '-').toLowerCase());
    }
    if (locale.contains('-')) {
      variations.add(locale.replaceAll('-', '_').toLowerCase());
    }

    return variations.toSet().toList();
  }

  /// Check if a string looks like a language code rather than a Dart keyword
  static bool isLanguageCode(String token) {
    // Filter out obvious Dart keywords and syntax elements
    const dartKeywords = {
      'const',
      'required',
      'this',
      'AppLocale',
      'languageCode',
      'scriptCode',
      'countryCode',
      'ignore',
      'unused_element',
      'unused_element_parameter',
      'final',
      'String',
      'override',
      'BaseAppLocale',
      'Translations',
      'Map',
      'dynamic',
      'Node',
      'overrides',
      'cardinalResolver',
      'ordinalResolver',
      'meta',
      'import',
      'export',
      'part',
      'library',
      'class',
      'enum',
      'mixin',
      'typedef',
      'void',
      'bool',
      'int',
      'double',
      'num',
      'List',
      'Set',
    };

    // Check if it's a known Dart keyword
    if (dartKeywords.contains(token)) return false;

    // Check if it looks like a language code (2-5 characters, mostly lowercase)
    if (token.length < 2 || token.length > 8) return false;

    // Language codes are typically lowercase with possible camelCase for variants
    final hasValidPattern = RegExp(
      r'^[a-z]{2,3}([A-Z][a-z]*)?$',
    ).hasMatch(token);

    return hasValidPattern;
  }

  /// Convert camelCase or snake_case to kebab-case
  static String toKebabCase(String input) {
    return input
        .replaceAllMapped(
          RegExp(r'[A-Z]'),
          (match) => '-${match.group(0)!.toLowerCase()}',
        )
        .replaceAll('_', '-')
        .replaceAll(RegExp(r'^-'), '');
  }

  /// Convert kebab-case or snake_case to camelCase
  static String toCamelCase(String input) {
    final parts = input.split(RegExp(r'[-_]'));
    if (parts.isEmpty) return input;

    return parts.first + parts.skip(1).map((part) => capitalize(part)).join();
  }

  /// Convert any case to snake_case
  static String toSnakeCase(String input) {
    return input
        .replaceAllMapped(
          RegExp(r'[A-Z]'),
          (match) => '_${match.group(0)!.toLowerCase()}',
        )
        .replaceAll('-', '_')
        .replaceAll(RegExp(r'^_'), '');
  }
}
