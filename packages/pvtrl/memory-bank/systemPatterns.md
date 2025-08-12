# System Patterns: pvtrl

## Architecture
- Dart package with slang-generated translation classes
- Code generation approach for type-safe translations
- Simple export structure via main library file
- Asset-based JSON translation files

## Key Technical Decisions
- Use slang library for code generation
- JSON files as translation source
- Single export point (`t` variable)
- Resolved reserved word conflicts (is -> is_IS)

## Design Patterns
- Code generation for compile-time safety
- Single global access point via exported `t`
- Hierarchical translation structure
- Asset bundling for translation files

## Component Relationships
- `slang.yaml` configuration drives code generation
- JSON translation files in `assets/i18n/`
- Generated Dart classes in `lib/i18n/`
- Main export file `lib/pvtrl.dart`
