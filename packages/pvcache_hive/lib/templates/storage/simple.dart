import 'package:pvcache/pvcache.dart';
import 'package:hive_ce/hive.dart';

class SimpleHive<T> extends PVBaseStorage {
  late final Box<T> box;
  final Future<Box<T>> Function() _initBox;

  SimpleHive()
    : _initBox = (() async {
        // await Hive.initFlutter();
        return await Hive.openBox<T>('pvcache_hive');
      }) {
    _initBox().then((value) => box = value);
  }

  @override
  Future<void> clear(PVCtx ctx) async {
    await box.clear();
  }

  @override
  Future<void> delete(PVCtx ctx) async {
    await box.delete(ctx.key);
  }

  @override
  Future<void> exists(PVCtx ctx) async {
    ctx.value = box.containsKey(ctx.key);
  }

  @override
  Future<void> get(PVCtx ctx) async {
    ctx.value = box.get(ctx.key);
  }

  @override
  Future<void> init(PVBaseCache cache) async {
    await _initBox();
  }

  @override
  Future<void> set(PVCtx ctx) async {
    await box.put(ctx.key, ctx.value);
  }
}
