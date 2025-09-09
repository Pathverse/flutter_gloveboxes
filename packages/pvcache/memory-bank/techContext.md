# Technical Context

## Technology Stack
- **Language**: Dart
- **Framework**: Flutter (but can work standalone)
- **Minimum SDK**: Dart 3.9.0+

## Dependencies
- `flutter`: Core Flutter framework
- `flutter_test`: Testing framework
- `flutter_lints`: Code quality rules

## Project Structure
```
lib/
├── pvcache.dart              # Main library export
├── src/                      # Core implementation
│   ├── adapter.dart          # Adapter system and mixins
│   ├── cache.dart           # Main PVCache class
│   ├── callframe.dart       # Call frame execution
│   ├── callframe_payload.dart # Call frame building logic
│   └── interface.dart       # Base classes and context
└── templates/               # Example implementations
    ├── adapters/
    │   └── expiry.dart      # TTL adapter template
    ├── helpers/
    │   └── test.dart        # Test utilities and LoggingAdapter
    └── storage/
        └── inmemory.dart    # In-memory storage template
                             # Custom storage can extend any framework
                             # (Hive CE, Flutter Secure Storage, etc.)

test/                        # Unit tests
```

## Development Setup
- Standard Flutter package structure
- Uses pubspec.yaml for dependency management
- Follows Dart/Flutter naming conventions

## Performance Considerations
- Pre-compilation of call frames eliminates runtime overhead
- Adapter priority system ensures predictable execution
- Minimal object allocation during operations
- Context reuse where possible
