# Product Context

## Problem Space
Flutter web applications need flexible configuration management that can:
- Handle different configuration formats (ENV, JSON, TOML)
- Support environment-specific configurations
- Load configurations from assets at runtime
- Provide easy access to configuration values

## Solution Approach
PV WebEnv provides a unified configuration system that:
- Uses Flutter's asset loading mechanism
- Supports multiple configuration formats through pluggable parsers
- Implements file reference patterns for modular configurations
- Provides a global singleton for easy access

## User Experience Goals
- Simple initialization: `await env.init()`
- Easy value access: `env['key']` or `env.env['nested']['key']`
- Support for complex nested structures
- Automatic file reference resolution

## Configuration Flow
1. Load root.env from assets/envs/
2. Parse values and identify {{file}} references
3. Load referenced files and merge configurations
4. Provide unified access to all values

## Target Developers
- Flutter web developers needing configuration management
- Teams requiring multi-environment setups
- Projects with complex configuration hierarchies
