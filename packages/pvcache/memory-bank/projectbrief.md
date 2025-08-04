# PVCache: Project Brief

## Overview
PVCache is a Flutter caching package providing secure, flexible data storage with support for multiple environments and advanced adapter patterns. It's designed as a testing ground and alternative implementation approach within the Pathverse flutter_gloveboxes ecosystem.

## Goals
- Multi-environment caching with `env:key` format support
- Secure data storage with encryption capabilities
- Flexible adapter pattern for custom storage implementations
- Advanced metadata management with pre/post operation hooks
- Type-safe APIs with clear error handling
- Cross-platform support: iOS, Android, Web

## Architecture Philosophy
- **Adapter-driven**: Pluggable storage backends through adapter pattern
- **Environment isolation**: Each environment operates independently with its own configuration
- **Security-first**: Automatic adapter selection based on security requirements
- **Flexible serialization**: Configurable serialization for different data types

## Key Features
- **Multi-Environment Support**: `kv:`, `encrypted:`, and custom environment prefixes
- **Adapter Pattern**: StdAdapter for Hive storage, SecureAdapter for encrypted storage
- **Automatic Configuration**: Smart adapter selection based on secureData/secureMeta flags
- **Metadata Management**: Rich metadata support with expiry and custom fields
- **Pre/Post Hooks**: Extensible operation lifecycle hooks
- **Secure Meta Format**: Special format for storing metadata with encrypted data

## Scope
- Core caching functionality with adapter pattern
- Environment-based data isolation
- Security and encryption features
- Metadata and expiry management
- Testing and example applications
- Documentation and usage guides

## Target Users
- Flutter developers experimenting with adapter-based caching
- Apps requiring multi-environment data storage
- Projects needing flexible storage backend switching
- Developers wanting to understand alternative PVCache architectures

## Current Status
- ✅ Core adapter pattern implemented
- ✅ Multi-environment support (`env:key` format)
- ✅ Secure storage adapter created
- ✅ Automatic adapter configuration
- ✅ Metadata management system
- ⚠️ Testing and debugging in progress
- 🔄 Active development and refinement
