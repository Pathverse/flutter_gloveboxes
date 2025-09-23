class PVLogConfig {
  final String namespace;
  final List<String> scopes;
  final bool allowFormatterChain;
  final bool allowSyncInAsync;

  PVLogConfig({
    required this.namespace,
    required this.scopes,
    this.allowFormatterChain = false,
    this.allowSyncInAsync = false,
  });

  PVLogContext toContext({bool isAsync = false}) {
    return PVLogContext(
      namespace: namespace,
      scopes: scopes,
      allowFormatterChain: allowFormatterChain,
      allowSyncInAsync: allowSyncInAsync,
      isAsync: isAsync,
      
    );
  }
}

class PVLogContext extends PVLogConfig {

  final bool isAsync;

  static final Map<String, Map<String, dynamic>> _persistedNamespaceContext = {};

  Map<String, dynamic> get namespaceContext {
    if (!_persistedNamespaceContext.containsKey(namespace)) {
      _persistedNamespaceContext[namespace] = {};
    }
    return _persistedNamespaceContext[namespace]!;
  }

  final Map<String, dynamic> context = {};

  PVLogContext({
    required super.namespace,
    required super.scopes,
    this.isAsync = false,
    super.allowFormatterChain = false,
    super.allowSyncInAsync = false,
  });
}
