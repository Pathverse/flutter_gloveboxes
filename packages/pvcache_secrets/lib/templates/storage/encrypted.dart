// ignore: implementation_imports
import 'package:pvcache/src/interface.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const secureStorage = FlutterSecureStorage();

class Encrypted extends PVBaseStorage {
  @override
  Future<void> clear(PVCtx ctx) {
    return secureStorage.deleteAll();
  }

  @override
  Future<void> delete(PVCtx ctx) {
    return secureStorage.delete(key: ctx.key!);
  }

  @override
  Future<void> exists(PVCtx ctx) async {
    final result = await secureStorage.containsKey(key: ctx.key!);
    ctx.value = result;
  }

  @override
  Future<void> get(PVCtx ctx) async {
    final result = await secureStorage.read(key: ctx.key!);
    ctx.value = result;
  }

  @override
  Future<void> init(PVBaseCache cache) async {
    // no init needed for flutter_secure_storage
    return;
  }

  @override
  Future<void> set(PVCtx ctx) {
    return secureStorage.write(key: ctx.key!, value: ctx.value);
  }
}
