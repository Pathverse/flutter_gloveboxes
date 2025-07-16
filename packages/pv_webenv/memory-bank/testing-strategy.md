# Testing Strategy

## Testing Architecture

### Two-Package Testing Approach
- **pv_webenv**: Unit tests for individual components
- **pv_webenv_test**: Integration tests for complete flows

### Test Coverage Levels

#### Unit Tests (pv_webenv/test/)
- **Parser Tests**: Individual parser functionality
  - `parsers/env_test.dart`: ENV key=value parsing
  - `parsers/json_test.dart`: JSON parsing with comments
  - `parsers/toml_test.dart`: TOML section parsing
  - `parsers/base_test.dart`: Abstract parser functionality

#### Integration Tests (pv_webenv_test/test/)
- **complete_test.dart**: Comprehensive end-to-end testing
- **simple_test.dart**: Basic functionality validation

## Test Asset Strategy

### Realistic Test Data
Located in `pv_webenv_test/envs/`:
- `root.env`: Main configuration with file references
- `database.json`: Nested JSON configuration
- `api.toml`: TOML configuration with sections
- `cache.env`: Additional ENV configuration

### File Reference Testing
```env
# root.env demonstrates {{file}} pattern
DATABASE_CONFIG={{database.json}}
API_CONFIG={{api.toml}}
CACHE_CONFIG={{cache.env}}
```

## Test Isolation Patterns

### ENV Singleton Management
- **Reset Strategy**: `ENV.reset()` before each test
- **Clean State**: Ensures no test interdependencies
- **Singleton Validation**: Tests verify singleton behavior

### Flutter Binding Initialization
```dart
// One-time initialization for asset loading
TestWidgetsFlutterBinding.ensureInitialized();

// Use regular test() functions for non-widget tests
test('should load configuration', () async {
  ENV.reset();
  await env.init();
  // assertions...
});
```

## Test Reliability Solutions

### Resolved Hanging Issues
- **Problem**: testWidgets() causing hangs in non-widget tests
- **Solution**: Use regular test() functions
- **Pattern**: TestWidgetsFlutterBinding.ensureInitialized() + test()

### Data Type Validation
- **Type Safety**: Verify preserved data types (int, double, bool, string)
- **Nested Access**: Test deep object traversal
- **Null Checking**: Validate file reference removal

## Testing Patterns

### Standard Test Structure
```dart
test('should perform specific behavior', () async {
  // 1. Reset state
  ENV.reset();
  
  // 2. Initialize environment
  await env.init();
  
  // 3. Get environment map
  final envMap = env.env;
  
  // 4. Assert expected behavior
  expect(envMap['key'], equals('value'));
});
```

### File Reference Validation
```dart
// Verify {{file}} patterns are removed
expect(env['DATABASE_CONFIG'], isNull);

// Verify content is merged
expect(envMap.containsKey('host'), isTrue);
```

## Test Categories

### Core Functionality Tests
1. **Asset Loading**: Configuration files load from assets
2. **Parser Selection**: Correct parser chosen by file extension
3. **File References**: {{file}} patterns resolve and merge
4. **Reference Cleanup**: {{file}} keys removed after processing
5. **Data Preservation**: Types maintained through parsing
6. **Error Handling**: Graceful failure for missing files

### Integration Flow Tests
1. **Complete Configuration**: All formats work together
2. **Nested Access**: Deep object traversal works
3. **Singleton Behavior**: Instance management correct
4. **Reinitialization**: Multiple init() calls handled
5. **Configuration Merging**: Proper merge order and precedence

## Quality Metrics

### Current Test Status
- **Total Tests**: 10 integration tests + unit tests
- **Pass Rate**: 100%
- **Execution Time**: ~1-2 seconds for all tests
- **Reliability**: Zero hanging issues
- **Coverage**: All core functionality covered

### Test Validation
- **Asset-based loading**: ✅
- **Multi-format parsing**: ✅
- **File reference resolution**: ✅
- **Configuration merging**: ✅
- **Type preservation**: ✅
- **Error handling**: ✅
- **Singleton behavior**: ✅

## Best Practices

### Test Organization
- Keep unit tests close to implementation
- Use separate package for integration tests
- Provide realistic test assets
- Document test patterns in comments

### Isolation Principles
- Reset ENV state before each test
- Use proper Flutter binding initialization
- Avoid testWidgets for non-widget logic
- Validate assumptions about test order

### Maintainability
- Clear test names describing behavior
- Comprehensive assertions
- Separate concerns (unit vs integration)
- Regular test reliability validation
