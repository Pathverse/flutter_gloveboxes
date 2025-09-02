# Technical Context

## Technology Stack
- **Language**: Dart
- **Framework**: Flutter (>=1.17.0)
- **SDK**: Dart ^3.8.1
- **Package Type**: Flutter Package

## Project Structure - CURRENT
```
lib/
├── pvcacher.dart          # Main export file (needs update)
├── src/                   # Core implementation - COMPLETE ✅
│   ├── cacher.dart       # Main PVCacher class with comprehensive docstrings
│   ├── adapter.dart      # Adapter base and mixins + preHandlerOperation hooks
│   ├── handle.dart       # Storage handle abstraction
│   └── ctx.dart          # Context class
└── templates/            # Template implementations - FUNCTIONAL ✅
    ├── adapters/         # Common adapter patterns
    │   ├── expired.dart  # Complete expiry adapter with auto-cleanup
    │   └── debug.dart    # Debug adapter infrastructure
    ├── cache/            # Cache type templates
    │   └── std/          # Standard Hive-based implementation
    └── shared/           # Shared utilities and infrastructure
```

## Major Enhancements Completed ✅
- **Hook System Extended**: preHandlerOperation/postHandlerOperation hooks added
- **Expiry Functionality**: Complete UTC-based expiry with automatic cleanup  
- **Debug Infrastructure**: Comprehensive logging and troubleshooting support
- **Documentation**: Full docstring coverage throughout codebase
- **Critical Bug Fixes**: Timing issues, missing returns, initialization problems resolved

## Technical Capabilities - PROVEN ✅
- **Automatic Expiry**: UTC timestamps, multiple input formats, auto-cleanup
- **Debug Support**: VerboseExpiredAdapter with detailed operation logging
- **Metadata Persistence**: SHA256-based metadata survives cache restarts
- **Hook Timing**: Critical adapter execution timing for metadata-dependent operations
- **Template Infrastructure**: Production-ready patterns for extension

## Dependencies
- **Runtime**: flutter (SDK), no external dependencies
- **Development**: flutter_test, flutter_lints ^5.0.0
- **Philosophy**: Minimal dependencies, maximize compatibility

## Development Tools
- **Linting**: flutter_lints ^5.0.0
- **Testing**: flutter_test (SDK)
- **IDE**: Supports VS Code, IntelliJ, Android Studio

## Technical Constraints
- **Async by Design**: All operations return `Future<void>`
- **Generic Value Support**: `dynamic` type for cached values
- **Memory Management**: Singleton pattern prevents instance proliferation
- **Null Safety**: Full null safety support

## Package Configuration
- **Name**: pvcacher
- **Version**: 0.0.1 (early development)
- **Description**: Generic placeholder (needs update)
- **Homepage**: Not set (needs update)

## Development Patterns
- **Async/Await**: Consistent async operation handling
- **Factory Constructors**: Singleton management
- **Mixin Composition**: Adapter capability system
- **Generic Programming**: Type-flexible value storage

## File Naming Conventions
- Core files: lowercase snake_case
- Template files: descriptive names in appropriate directories
- Test files: `*_test.dart` pattern

## Build & Test Setup
- Standard Flutter package structure
- Test directory with basic test file
- Analysis options for code quality
- Compatible with standard Flutter toolchain
