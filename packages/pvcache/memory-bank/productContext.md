# Product Context

## Why PVCache Exists
Traditional caching libraries are often rigid and don't allow easy customization. PVCache solves this by providing a flexible adapter system that lets developers add exactly the features they need.

## Problems It Solves
1. **Performance Bottlenecks**: Eliminates runtime compilation overhead by pre-building call frames
2. **Limited Extensibility**: Other cache libraries are hard to extend with custom behavior
3. **Complex Setup**: Provides simple templates for common use cases
4. **Flexible Storage Options**: Works with any storage backend through adapters - memory, disk, network, or external frameworks like Hive CE, Flutter Secure Storage

## How It Works
- Developers create a cache instance with chosen adapters
- Adapters define custom behavior (expiry, eviction, logging, etc.)
- Call frames are built once at startup for maximum performance
- All operations flow through the adapter chain

## User Experience Goals
- **Simple Setup**: Basic caching should work with minimal configuration
- **Easy Extension**: Adding features should be straightforward with adapters
- **Clear Documentation**: Examples and templates for common patterns
- **Predictable Behavior**: Clear execution order and error handling
