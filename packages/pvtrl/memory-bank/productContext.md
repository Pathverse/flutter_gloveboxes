# Product Context: pvtrl

## Why This Project Exists
Pathverse projects require a simple, reliable way to provide translated constants (labels, messages, etc.) across apps. Existing solutions are often too complex or heavy for baseline needs.

## Problems Solved
- Reduces boilerplate for translation setup
- Ensures consistency for constant translations across projects
- Provides comprehensive multilingual support (13 languages)
- Eliminates need to recreate common translation constants

## How It Should Work
- Import the package and use the generated `t` variable
- Access translated constants via simple dot notation
- Automatic language switching based on locale
- No runtime configuration needed

## User Experience Goals
- Developers can add translations with a single import
- Zero learning curve - just use `t.common.message.loading`
- Comprehensive coverage of common UI constants
- Immediate multilingual support
