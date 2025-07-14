# Project Brief: PV Cache

## Project Overview
PV Cache is a sophisticated Flutter caching package that provides an abstract layer for secure, flexible, and feature-rich data caching. It's part of the Pathverse flutter_gloveboxes monorepo ecosystem.

## Core Requirements

### Primary Goals
1. **Secure Caching**: Provide encrypted storage capabilities for sensitive data
2. **Flexible Storage**: Support multiple data types (strings, numbers, JSON objects, arrays)
3. **Advanced Cache Management**: Implement expiry, LRU/LFU eviction, and dependency-based invalidation
4. **Developer Experience**: Type-safe APIs with comprehensive options and clear error handling
5. **Cross-Platform**: Work seamlessly across iOS, Android, and Web

### Key Features
- **Basic CRUD Operations**: Store, retrieve, delete, and check existence of cache entries
- **Encryption Support**: Automatic encryption/decryption for sensitive data
- **Expiry Management**: Time-based automatic cleanup of expired entries
- **Sensitive Field Protection**: Selective encryption of specific JSON fields with master key dependencies
- **LRU/LFU Eviction**: Intelligent cache size management with configurable strategies
- **Grouping**: Logical organization of cache entries
- **JSON Utilities**: Specialized methods for handling JSON data structures

### Technical Constraints
- Must use Hive as the underlying storage engine
- Flutter Secure Storage for encryption key management
- WebCrypto for cryptographic operations
- Maintain backward compatibility with legacy JSON methods
- Singleton pattern for cache instance management

### Success Criteria
1. Comprehensive test coverage for all cache operations
2. Visual example app demonstrating all features
3. Clear documentation with practical examples
4. Type-safe API with proper error handling
5. Performance optimization for large data sets
6. Cross-platform compatibility verified

## Project Scope

### In Scope
- Core caching functionality with CacheOptions configuration
- Encryption and security features
- Expiry and eviction mechanisms
- JSON data handling utilities
- Comprehensive testing suite
- Example application for demonstration
- Complete documentation

### Out of Scope (for now)
- Network caching integration
- Image/file caching capabilities
- Cache warming strategies
- Multiple cache instance management
- Custom encryption algorithms
- Cache persistence configuration options

## Target Users
- Flutter developers needing secure local data storage
- Applications requiring session management
- Apps handling sensitive user data
- Projects needing intelligent cache management
- Developers wanting type-safe caching solutions
