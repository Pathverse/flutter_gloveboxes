import 'package:hive_ce/hive.dart';
import 'package:pvcache/pvcache.dart';
import 'package:pvcache_hive/src/hboxcore.dart' as hboxcore;
import 'package:pvcache_hive/src/pvco.dart';

class StdBox<T extends PVCi> extends PVBaseStorage with MetadataStorage {
  final T Function(dynamic) tconstructor;
  final T Function(Map<String, dynamic>) fromJsonConstructor;

  StdBox({
    T Function(dynamic)? tconstructor,
    T Function(Map<String, dynamic>)? fromJsonConstructor,
  }) : tconstructor = tconstructor ?? ((data) => PVCo(data) as T),
       fromJsonConstructor =
           fromJsonConstructor ?? ((json) => PVCo.fromJson(json) as T);

  late final hboxcore.HBoxIntent _intent;

  String get boxName => '';

  Future<CollectionBox> getBox() async {
    await hboxcore.initHBox();
    return await hboxcore.getBox(boxName, _intent);
  }

  @override
  Future<void> clear(PVCtx ctx) async {
    await getBox().then((box) => box.clear());
  }

  @override
  Future<void> delete(PVCtx ctx) async {
    await getBox().then((box) => box.delete(ctx.key!));
  }

  @override
  Future<void> exists(PVCtx ctx) async {
    final box = await getBox();
    for (var key in await box.getAllKeys()) {
      if (key == ctx.key) {
        ctx.value = true;
        return;
      }
    }
  }

  @override
  Future<void> get(PVCtx ctx) async {
    final box = await getBox();
    final value = await box.get(ctx.key!);
    if (value != null) {
      T obj = fromJsonConstructor(value as Map<String, dynamic>);
      ctx.value = obj.real;
    }
  }

  @override
  Future<void> set(PVCtx ctx) async {
    final box = await getBox();
    T value;
    if (ctx.value is! T) {
      value = tconstructor(ctx.value);
    } else {
      value = ctx.value;
    }

    await box.put(ctx.key!, value.toJson());
  }

  @override
  Future<void> init(PVBaseCache cache) async {}
}

class StdStorageBox<T extends PVCo> extends StdBox<T> {
  @override
  final String boxName;

  final String metaBoxName;
  final hboxcore.HPerBoxConfig? boxConfig;

  StdMetaBox<T>? _metaBoxRef;

  StdStorageBox(
    this.boxName, {
    String? metaBoxName,
    this.boxConfig,
    super.tconstructor,
    super.fromJsonConstructor,
  }) : metaBoxName = metaBoxName ?? '${boxName}_meta' {
    _intent = hboxcore.HBoxIntent(
      boxName,
      {boxName, metaBoxName ?? '${boxName}_meta'},
      perBoxConfigs: [?boxConfig],
    );
  }

  @override
  Future<void> init(PVBaseCache cache) async {}

  StdMetaBox<T> get metaBox {
    if (_metaBoxRef != null) return _metaBoxRef!;
    _metaBoxRef = StdMetaBox<T>(this);
    return _metaBoxRef!;
  }
}

class StdMetaBox<T extends PVCo> extends StdBox<T> {
  final StdStorageBox _storageBoxRef;

  StdMetaBox(this._storageBoxRef);

  @override
  get boxName => _storageBoxRef.metaBoxName;

  @override
  get _intent => _storageBoxRef._intent;

  @override
  get tconstructor => _storageBoxRef.tconstructor as T Function(dynamic);

  @override
  get fromJsonConstructor =>
      _storageBoxRef.fromJsonConstructor as T Function(Map<String, dynamic>);

  get storageBox => _storageBoxRef;
}

(StdMetaBox<T>, StdStorageBox<T>) createPair<T extends PVCo>(
  String boxName, {
  String? metaBoxName,
  hboxcore.HPerBoxConfig? boxConfig,
  T Function(dynamic)? tconstructor,
  T Function(Map<String, dynamic>)? fromJsonConstructor,
}) {
  final storageBox = StdStorageBox<T>(
    boxName,
    metaBoxName: metaBoxName,
    boxConfig: boxConfig,
    tconstructor: tconstructor,
    fromJsonConstructor: fromJsonConstructor,
  );
  return (storageBox.metaBox, storageBox);
}
