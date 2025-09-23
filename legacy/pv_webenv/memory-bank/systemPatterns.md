# System Patterns

## Architecture Overview
```
ENV (Singleton)
├── init() - Main initialization
├── _loadFile() - Asset loading + parser selection
├── _processFileReferences() - {{file}} pattern resolution
├── _mergeEnv() - Deep merge configuration
└── operator[] - Value access

Parsers (Strategy Pattern)
├── PVEnvBaseParser (Abstract)
├── ENVParser - Key=value format
├── JSONParser - JSON with comment support
└── TOMLParser - TOML sections and types

Testing Architecture
├── pv_webenv/test/ - Unit tests for parsers
├── pv_webenv_test/test/ - Integration tests
├── complete_test.dart - Comprehensive end-to-end
├── simple_test.dart - Basic validation
└── testing-strategy.md - Documented patterns
```

## Key Design Patterns

### Singleton Pattern
- `ENV.instance` provides global access
- `env` getter for convenience
- Single source of truth for configuration
- `ENV.reset()` for test isolation

### Strategy Pattern
- `PVEnvBaseParser` abstract base
- Format-specific implementations
- Runtime parser selection based on file extension

### Asset Loading Pattern
- Uses `rootBundle.loadString('envs/filename')`
- Expects configurations in assets/envs/ directory
- Supports multiple file formats in same directory

### Testing Patterns
- **Two-Package Strategy**: Unit tests in main package, integration in separate package
- **Test Isolation**: ENV.reset() before each test
- **Flutter Binding**: TestWidgetsFlutterBinding.ensureInitialized() pattern
- **Realistic Assets**: Complete test configurations in envs/

## File Reference System
- Pattern: `{{filename}}` in values
- Triggers recursive loading and merging
- Supports nested file references
- Graceful failure for missing files
- **Key Cleanup**: Removes {{file}} keys after processing

## Configuration Merging
- Deep merge for nested objects
- Later values override earlier ones
- Preserves data types from parsers
- Recursive merge strategy

## Error Handling
- Graceful file loading failures
- Parser-specific error handling
- Unsupported format exceptions
- Missing file tolerance

## Test Reliability Patterns

### Hanging Prevention
- Use regular `test()` functions instead of `testWidgets()`
- Initialize Flutter binding once: `TestWidgetsFlutterBinding.ensureInitialized()`
- Proper test isolation with ENV.reset()

### Data Validation
- Type preservation testing (int, double, bool, string)
- Nested object access validation
- File reference cleanup verification
- Configuration merging validation
