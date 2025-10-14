# Project Brief: pvtro

## Overview
`pvtro` (Provider-based Translation Orchestrator) is a Flutter package system that solves the complex problem of coordinating translations across multiple slang-enabled packages in a monorepo environment. It consists of two main packages: `pvtro` (runtime) and `pvtro_builder` (code generation).

## Naming
- **pv**: Pathverse (company initial)
- **tr**: translate 
- **o**: orchestrator

## Core Problem
When using slang translation library across multiple packages in a Flutter project, each package generates its own `AppLocale` enum and `LocaleSettings` class. This creates several challenges:

1. **Import Conflicts**: Cannot import multiple `AppLocale` enums from different packages due to naming conflicts
2. **Coordination Issues**: No unified way to change locales across all packages simultaneously
3. **Type Safety Loss**: Hard to maintain type-safe locale management across package boundaries
4. **Manual Synchronization**: Each package's locale must be manually updated when language changes

## Solution Architecture
pvtro solves this through a two-part system:

### 1. pvtro (Runtime Package)
- **LocaleCubit<T>**: Generic cubit that manages unified locale state
- **MultiTranslationProvider**: Widget for composing multiple translation providers
- **Type-safe Design**: Uses generics to avoid importing specific AppLocale enums

### 2. pvtro_builder (Code Generation Package)  
- **Automatic Discovery**: Scans all packages for slang-generated files
- **Unified Enum Generation**: Creates single `UnifiedLanguage` enum with all discovered locales
- **Setup Code Generation**: Creates cubit factory with package-specific locale setters
- **Build Runner Integration**: Seamless integration with standard Flutter tooling

## Goals
- **Zero Import Conflicts**: Avoid importing package-specific AppLocale enums
- **Automatic Coordination**: Single point of control for all package locales
- **Type Safety**: Maintain compile-time safety throughout
- **Developer Experience**: Simple setup with build_runner integration
- **Scalability**: Support unlimited number of slang packages

## Success Criteria
- Can coordinate locales across N slang packages without import conflicts
- Single `changeLocale()` call updates all packages simultaneously
- Generated code is clean, readable, and properly documented
- Setup requires minimal manual configuration
- Works with existing slang project structures without modification