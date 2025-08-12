# Tech Context: pvtrl

## Technologies Used
- Dart
- slang (translation library and code generator)
- JSON for translation data

## Development Setup
- Standard Dart package structure
- `pubspec.yaml` with slang dependency
- `slang.yaml` configuration file
- Asset directory structure for translations

## Technical Constraints
- Must remain lightweight (constants only)
- No runtime translation updates
- Fixed set of supported languages

## Dependencies
- slang: ^3.x (code generation)

## Supported Languages (13 total)
- en (English) - base/fallback
- da (Danish), es (Spanish), fr (French)
- he (Hebrew), is_IS (Icelandic), ko (Korean)
- nb (Norwegian Bokmål), nl (Dutch), no (Norwegian)
- sv (Swedish), zh_Hans (Chinese Simplified), zh (Chinese Traditional)

## Tool Usage Patterns
- `dart run slang` for code generation
- Asset bundling for translation files
- Export pattern for clean API surface
