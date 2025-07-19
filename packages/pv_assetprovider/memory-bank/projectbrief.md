# Project Brief: pv_assetprovider

## Overview
pv_assetprovider is a Flutter/Dart package that provides annotations, classes, and utilities for asset management in Flutter applications. It works as part of a larger asset building system alongside pv_assetbuilder.

## Core Purpose
- Provide base classes for generated asset maps (`PVAssetMap`)
- Offer lazy loading capabilities for assets with automatic type detection
- Enable path-based asset navigation with type safety
- Support build.yml configuration-driven asset mapping generation

## Key Components
1. **LazyObject**: Handles lazy loading of assets with automatic type detection based on file extensions
2. **PVAssetMap**: Base class for generated asset map hierarchies
3. **PVAssetProvider**: Path-based asset provider with directory navigation capabilities

## Integration
Works in conjunction with:
- pv_assetbuilder: Code generation tool that processes annotations
- Flutter asset system: Provides typed access to Flutter assets

## Target Use Case
Developers who want type-safe, lazy-loaded access to Flutter assets with automatic code generation based on file system structure.

## Package Information
- Name: pv_assetprovider  
- Version: 0.0.1
- Homepage: https://github.com/Pathverse/flutter_gloveboxes
- Flutter SDK requirement: >=1.17.0
- Dart SDK requirement: ^3.8.1 