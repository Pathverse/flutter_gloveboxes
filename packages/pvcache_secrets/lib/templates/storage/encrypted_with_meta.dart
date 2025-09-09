// ignore: implementation_imports
import 'package:pvcache/src/interface.dart';
import 'encrypted.dart';

class EncryptedAStorage extends PVBaseStorage {
  /// this is used with the assumption that we will share flutter_secure_storage usage between different apps
  final String prefix = 'pvsab::';
  final List<String> _keptTrackKeys = [];

  Future<List<String>> get _allKeys async {
    final retlist = <String>[];
    final allKeys = await secureStorage.readAll();
    for (final key in allKeys.keys) {
      if (key.startsWith(prefix)) {
        retlist.add(key.replaceFirst(prefix, ''));
      }
    }
    return retlist;
  }

  Future<void> _updateTrackedKeys() async {
    if (_keptTrackKeys.isNotEmpty) return;
    _keptTrackKeys.clear();
    _keptTrackKeys.addAll(await _allKeys);
  }

  @override
  Future<void> clear(PVCtx ctx) async {
    await _updateTrackedKeys();
    for (final key in _keptTrackKeys) {
      await secureStorage.delete(key: '$prefix$key');
    }
    _keptTrackKeys.clear();
  }

  @override
  Future<void> delete(PVCtx ctx) async {
    await _updateTrackedKeys();
    return secureStorage.delete(key: ctx.key!);
  }

  @override
  Future<void> exists(PVCtx ctx) {
    return secureStorage.containsKey(key: ctx.key!);
  }

  @override
  Future<void> get(PVCtx ctx) {
    return secureStorage.read(key: ctx.key!);
  }

  @override
  Future<void> init(PVBaseCache cache) async {
    // check self, if self is not the storage, throw error
    if (cache.metaStorage != this) {
      throw Exception("EncryptedAStorage can only be used as metaStorage");
    }
    if (cache.storage is! EncryptedBStorage) {
      throw Exception("Storage pair must be EncryptedBStorage");
    }
    (cache.storage as EncryptedBStorage).__prefix = prefix;
  }

  @override
  Future<void> set(PVCtx ctx) {
    return secureStorage.write(key: ctx.key!, value: ctx.value);
  }
}

class EncryptedBStorage extends PVBaseStorage {
  late final String _prefix;

  set __prefix(String p) => _prefix = p;

  EncryptedBStorage();

  @override
  Future<void> clear(PVCtx ctx) {
    // TODO: implement clear
    throw UnimplementedError();
  }

  @override
  Future<void> delete(PVCtx ctx) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<void> exists(PVCtx ctx) {
    // TODO: implement exists
    throw UnimplementedError();
  }

  @override
  Future<void> get(PVCtx ctx) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<void> init(PVBaseCache cache) {
    // TODO: implement init
    throw UnimplementedError();
  }

  @override
  Future<void> set(PVCtx ctx) {
    // TODO: implement set
    throw UnimplementedError();
  }
}
