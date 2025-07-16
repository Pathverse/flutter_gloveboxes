# PV WebEnv Project Brief

## Project Overview
PV WebEnv is a Flutter package for web environment management that provides a flexible system for loading and parsing configuration files in various formats.

## Core Purpose
- Load configuration from multiple file formats (ENV, JSON, TOML)
- Support nested file references using {{filename}} patterns
- Provide unified access to environment variables
- Enable flexible configuration management for Flutter web applications

## Key Features
- Multiple parser support (ENV, JSON, TOML)
- File reference resolution ({{file}} patterns)
- Hierarchical configuration merging
- Asset-based configuration loading
- Global singleton access pattern

## Target Use Cases
- Web application configuration management
- Environment-specific settings
- Multi-format configuration support
- Dynamic configuration loading

## Package Structure
- Core library: `lib/core.dart` - Main ENV class and initialization
- Parsers: `lib/parsers/` - Format-specific parsers (base, env, json, toml)
- Tests: `test/parsers/` - Comprehensive test coverage for all parsers
- Companion test package: `pv_webenv_test` - Integration testing
