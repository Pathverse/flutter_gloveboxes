import 'package:pvlogger/src/core/adapter.dart';
import 'package:pvlogger/src/core/logger.dart';

/// Central registry for managing logger instances and adapters.
///
/// This class maintains the global state of the PVLogger system, including:
/// - Logger instance caching and hierarchy management
/// - Adapter registration and organization
/// - System-wide configuration
///
/// The registry ensures that loggers with the same namespace return the same
/// instance (singleton pattern) and organizes adapters for efficient lookup.
class PVLoggerRegistry {
  /// Cache of root logger instances (namespaces without '.')
  static final Map<String, PVLogger> rootLoggers = {};

  /// Cache of child logger instances organized by root namespace
  static final Map<String, Map<String, PVLogger>> childLoggers = {};

  /// Reference to the most recently created logger
  static PVLogger? lastLogger;

  /// Namespace-specific adapters (key: namespace, value: adapters)
  static final Map<String, List<PVLogAdapter>> adapters = {};

  /// Global adapters that process events for all loggers
  static final List<PVLogAdapter> globalAdapters = [];
}
