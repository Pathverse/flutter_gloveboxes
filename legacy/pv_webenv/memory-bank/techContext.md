# Technical Context

## Technology Stack
- **Framework**: Flutter (>=1.17.0)
- **Language**: Dart (SDK ^3.8.1)
- **Testing**: flutter_test, flutter_lints
- **Asset Loading**: Flutter rootBundle

## Dependencies
### Runtime Dependencies
- `flutter`: Flutter SDK for asset loading

### Development Dependencies
- `flutter_test`: Testing framework
- `flutter_lints`: Code quality and linting

## File Format Support
- **.env**: Key=value pairs, # comments
- **.json**: Standard JSON with // comments
- **.toml**: Sections, nested objects, typed values

## Parser Capabilities
### ENVParser
- Simple key=value parsing
- Ignores # comments and empty lines
- Trims whitespace from keys and values

### JSONParser
- Standard JSON parsing with dart:convert
- Strips // comment lines before parsing
- Supports all JSON data types

### TOMLParser
- Section headers [section] and [nested.section]
- Type inference (string, int, double, bool)
- Quoted and unquoted string support
- Two-level nesting maximum

## Asset Structure
```
assets/
  envs/
    root.env       # Main configuration file
    config.json    # Referenced JSON config
    settings.toml  # Referenced TOML config
    *.env          # Additional env files
```

## Development Setup
- Standard Flutter package structure
- Comprehensive test coverage in test/parsers/
- No external runtime dependencies
- Lint-compliant code
