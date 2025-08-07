import 'package:pvcache/src/core/interface.dart';

class PVCacheConfig extends IPVCacheConfig {
  final Map<String, List<int>> _adapterOrder;
  final Map<String, dynamic> _options;

  PVCacheConfig({
    required super.env,
    required super.storage,
    required super.adapters,
    Map<String, List<int>> adapterOrder = const {},
    Map<String, dynamic> options = const {},
  }) : _adapterOrder = adapterOrder,
       _options = options;

  @override
  Map<String, List<int>> get adapterOrder {
    // if _adapterOrder is empty, populate it
    if (_adapterOrder.isEmpty) {
      return {};
    }
    return Map.unmodifiable(_adapterOrder);
  }

  @override
  Map<String, dynamic> get options => _options;



}
