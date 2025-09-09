# PVCacher - Project Brief

## Core Purpose
PVCacher is a very flexible and powerful caching system for Flutter/Dart that maintains simplicity as its key strength. It's designed to be an extensible, adapter-based caching solution that can handle various caching scenarios through a clean, consistent API.

## Key Requirements
1. **Flexibility**: Support multiple caching strategies through adapters
2. **Power**: Handle complex caching scenarios (expiration, encryption, etc.)
3. **Simplicity**: Maintain an easy-to-use API despite underlying complexity
4. **Extensibility**: Allow custom adapters and handlers

## Project Scope
- Core caching engine with adapter pattern
- Template system for common cache implementations
- Pluggable storage handlers
- Context-aware operations with pre/post hooks
- Namespace-based cache management

## Success Criteria
- Simple API: `set()`, `get()`, `remove()`, `clear()`, `has()`
- Adapter system for extensibility
- Template implementations for common use cases
- Clean separation between core engine and storage implementations
- Comprehensive test coverage

## Current State
- Core architecture implemented
- Adapter pattern established
- Context system in place
- Template structure created but incomplete
- Main library file still has placeholder content

## Non-Goals
- Built-in storage implementations (these are handled by separate handlers)
- Complex configuration systems (keep it simple)
- Heavy dependencies
