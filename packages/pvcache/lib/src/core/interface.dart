abstract class IPVCacheStorage {
  bool get useHiveCollection => false;
  List<String> get hiveCollectionBoxes => [];

  Future<void> onInit(IPVCacheConfig config) async {
    // default implementation does nothing
  }

  // concretely sets to storage
  Future<void> set(
    String key,
    dynamic value,
    IPVCacheConfig config, {
    Map<String, dynamic>? metadata,
  });
  Future<void> setMeta(
    String key,
    Map<String, dynamic> metadata,
    IPVCacheConfig config,
  );
  Future<dynamic> get(String key, IPVCacheConfig config);
  Future<Map<String, dynamic>> getMeta(String key, IPVCacheConfig config);

  Future<void> delete(String key, IPVCacheConfig config);
  Future<void> deleteMeta(String key, IPVCacheConfig config);
  Future<void> clear(IPVCacheConfig config);
  Future<void> clearMeta(IPVCacheConfig config);

  Future<bool> has(String key, IPVCacheConfig config);
  Future<bool> hasMeta(String key, IPVCacheConfig config);
  Future<Iterator<String>> iterKeys(IPVCacheConfig config);
  Future<Iterator<String>> iterMetaKeys(IPVCacheConfig config);
  
}

abstract class IPVCacheConfig {
  final String env;
  final IPVCacheStorage storage;
  final List<IPVCacheAdapter> adapters;

  IPVCacheConfig({
    required this.env,
    required this.storage,
    required this.adapters,
  });

  Map<String, List<int>> get adapterOrder;

  Map<String, dynamic> get options;

  List<int> getAdapterOrder(String type) {
    var orderList = <int>[];
    if (adapterOrder.containsKey(type)) {
      orderList = adapterOrder[type]!;
    } else {
      for (int i = 0; i < adapters.length; i++) {
        final adapter = adapters[i];
        if (adapter.handleMap.containsKey(type)) {
          orderList.add(i);
        }
      }
    }
    return orderList;
  }

  Future<void> handle({required PVCacheAdapterCtx ctx}) {
    var orderList = getAdapterOrder(ctx.handleType);
    if (orderList.isEmpty) {
      return Future.value();
    }
    for (int i = 0; i < orderList.length; i++) {
      final adapter = adapters[orderList[i]];
      if (adapter.handleMap.containsKey(ctx.handleType)) {
        if (!ctx.isPropagationAllowed) {
          break;
        }
        if (ctx.clearMetadata) {
          ctx.metadata.clear();
        }

        adapter.handle(ctx: ctx, storage: storage, config: this);
      }
    }
    return Future.value();
  }
}

abstract class IPVCacheAdapter {
  Map<String, Function> get handleMap => {};
  Map<String, List<String>> get functionParamMap => {};

  List<String> get supportedTypes => handleMap.keys.toList();

  Future<void> handle({
    required PVCacheAdapterCtx ctx,
    IPVCacheStorage? storage,
    IPVCacheConfig? config,
    dynamic data,
    Map<String, dynamic>? metadata,
  }) async {
    if (!handleMap.containsKey(ctx.handleType)) {
      throw Exception('Unsupported type: ${ctx.handleType}');
    }
    var functype = functionParamMap[ctx.handleType];

    // not sure if this is going to work, but hopefully it can handle all cases
    if (functype == null) {
      var func = handleMap[ctx.handleType];
      if (func is Function(PVCacheAdapterCtx)) {
        functype = ['ctx'];
      } else if (func
          is Function(PVCacheAdapterCtx, IPVCacheStorage, IPVCacheConfig)) {
        functype = ['ctx', 'storage', 'config'];
      } else if (func
          is Function(PVCacheAdapterCtx, dynamic, Map<String, dynamic>)) {
        functype = ['ctx', 'data', 'metadata'];
      } else if (func
          is Function(
            PVCacheAdapterCtx,
            IPVCacheStorage,
            IPVCacheConfig,
            dynamic,
            Map<String, dynamic>,
          )) {
        functype = ['ctx', 'storage', 'config', 'data', 'metadata'];
      } else if (func
          is Function(
            PVCacheAdapterCtx,
            IPVCacheStorage,
            dynamic,
            Map<String, dynamic>,
          )) {
        functype = ['ctx', 'storage', 'data', 'metadata'];
      } else if (func
          is Function(
            PVCacheAdapterCtx,
            IPVCacheStorage,
            IPVCacheConfig,
            dynamic,
          )) {
        functype = ['ctx', 'storage', 'config', 'data'];
      } else {
        throw Exception('Invalid function type for ${ctx.handleType}');
      }
    }

    switch (functype) {
      case ['storage', 'config', 'data', 'metadata']:
        handleMap[ctx.handleType]!(ctx, storage, config, data, metadata);
      case ['storage', 'data', 'metadata']:
        handleMap[ctx.handleType]!(ctx, storage, data, metadata);
      case ['data', 'metadata']:
        handleMap[ctx.handleType]!(ctx, data, metadata);
      case ['storage', 'config']:
        handleMap[ctx.handleType]!(ctx, storage, config);
      case ['storage']:
        handleMap[ctx.handleType]!(ctx, storage);
      case ['config']:
        handleMap[ctx.handleType]!(ctx, config);
      default:
        handleMap[ctx.handleType]!(ctx);
    }
  }
}

class PVCacheAdapterCtx {
  final String handleType;

  dynamic value;
  final dynamic _orginalValue;
  bool _isPropagationAllowed = true;
  bool _isPrimaryOverride = false;
  bool _clearMetadata = false;

  final Map<String, dynamic> _metadata;

  PVCacheAdapterCtx({
    required String handle,
    this.value,
    Map<String, dynamic>? metadata,
  }) : _metadata = metadata ?? {},
       _orginalValue = value,
       handleType = handle.toUpperCase();

  dynamic get originalValue => _orginalValue;

  bool get isPropagationAllowed => _isPropagationAllowed;

  bool get clearMetadata => _clearMetadata;

  void setClearMetadata() {
    _clearMetadata = true;
  }

  void stopPropagation() {
    _isPropagationAllowed = false;
  }

  bool get isPrimaryOverride => _isPrimaryOverride;

  void setPrimaryOverride() {
    _isPrimaryOverride = true;
  }

  Map<String, dynamic> get metadata => _metadata;
}
