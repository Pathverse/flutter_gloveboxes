# Product Context

## Problem Statement
Flutter/Dart applications need sophisticated caching solutions that handle complex scenarios (persistent storage, encrypted storage, metadata management, cache expiration, hash-based keys) while maintaining API simplicity.

## System Architecture

### Multi-Tier Usage
```dart
// Simple static interface
PVCACHER.register('app', handle: StdHandler());
await PVCACHER.set('key', value);

// Direct instance access
final cache = PVCacher(namespace: 'app', handle: StdHandler());
await cache.set('key', value, options: {'priority': 'high'});

// Template-level customization
class CustomHandler extends PVCacheHandle {
  // Custom lifecycle implementation
}
```

### Core Workflow
1. **Static Interface**: Namespace/alias resolution with conflict detection
2. **Instance Management**: Singleton pattern with exposed access
3. **Context Enrichment**: SHA256 hashing, metadata loading
4. **Lifecycle Execution**: Complex before/after hooks with adapter coordination
5. **Storage Implementation**: Template handles (StdHandler, etc.) manage persistence

## Implementation Tiers

### Tier 1: Static Interface Users
- Register cache configurations
- Use simple static methods
- Benefit from alias support and conflict detection
- Progressive enhancement available

### Tier 2: Direct Instance Users
- Access PVCacher instances directly
- Use rich context options and metadata
- Compose adapters for complex behaviors
- Select appropriate templates

### Tier 3: Template Developers
- Build custom handles with full lifecycle
- Leverage shared infrastructure (HiveCollectionTop0)
- Implement sophisticated patterns (hash-based keys, metadata persistence)
- Create reusable template patterns

## Key Features

### Architecture Features
- Multi-level singleton management
- Complex lifecycle with ordering control
- Hash-based metadata management
- Template-driven development

### StdHandler Capabilities - ENHANCED ✅
- Hive persistence with collection management
- SHA256-based keys with metadata separation
- **Automatic expiry support** with UTC timestamps
- **Debug logging infrastructure** for troubleshooting
- Persistent metadata across cache restarts
- **Multiple expiry formats**: seconds, absolute timestamps, Duration objects

### Adapter Ecosystem - COMPLETE ✅
- **ExpiredAdapter**: Automatic cache expiration with cleanup
- **VerboseExpiredAdapter**: Debug version with comprehensive logging
- **ExpiryUtils**: Convenience methods for common expiry patterns
- **Custom adapter support**: Full mixin system with advanced hooks

## Recent Major Achievements

### Hook Timing Resolution ✅
Solved critical timing issue where expiry adapters couldn't access metadata:
- **Problem**: preGet ran before metadata loading
- **Solution**: Implemented preHandlerOperation hooks
- **Result**: Expiry functionality now works perfectly

### Complete Expiry System ✅
- Multiple input formats (seconds, ISO8601 timestamps, Duration)
- UTC-based expiry calculation and storage
- Automatic cleanup during get operations
- Graceful handling of expired items (removal + null return)
- Debug logging for troubleshooting expiry behavior

### Documentation Excellence ✅
- Comprehensive docstrings throughout PVCacher core
- Complete ExpiredAdapter documentation with usage examples
- Hook timing and execution order fully documented
- Debug infrastructure documented for troubleshooting
- SHA256-based key hashing
- Metadata caching and warming
- Namespace safety and conflict prevention

### Static Interface Features
- Namespace and alias management
- Conflict detection and resolution
- Cache-or-compute patterns
- Lifecycle management utilities

## Success Metrics
- Simple usage: 2 lines (register + use)
- Template selection for common patterns
- Custom template development for complex needs
- Progressive enhancement from simple to sophisticated usage
