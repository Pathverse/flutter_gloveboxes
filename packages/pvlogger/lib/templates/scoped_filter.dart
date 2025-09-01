import 'package:pvlogger/src/logger.dart';

class ScopedFilter extends PVLogger {
  final List<String> currentScopes;

  factory ScopedFilter(
    String namespace, {
    String? nextLogger,
    PVLoggerConfig config = const PVLoggerConfig(),
    required List<String> currentScopes,
  }) {
    return ScopedFilter._internal(
      namespace,
      nextLogger: nextLogger,
      config: config,
      currentScopes: currentScopes,
    );
  }

  ScopedFilter._internal(
    String namespace, {
    super.nextLogger,
    required super.config,
    required this.currentScopes,
  }) : super.internal(namespace: namespace);

  @override
  bool shouldLog(PVLoggerEvent event) {
    if (!event.metadata.containsKey("scope")) {
      return false;
    }
    final eventScope = event.metadata["scope"];
    if (eventScope is String) {
      if (!currentScopes.contains(eventScope)) {
        return false;
      }
    } else if (eventScope is List<String>) {
      if (!eventScope.any((scope) => currentScopes.contains(scope))) {
        return false;
      }
    } else {
      return false;
    }
    return true;
  }
}
