import 'package:pvcacher/src/adapter.dart';
import 'package:pvcacher/src/cacher.dart';
import 'package:pvcacher/templates/cache/encrypted/handler.dart';

export 'package:pvcacher/templates/cache/encrypted/handler.dart';

PVCacher createEncrypted({String namespace = "encrypted", List<PVCacheAdapter> adapters = const []}) {
  final cacher = PVCacher(namespace: namespace, adapters: adapters, handle: EncryptedHandler());
  return cacher;
}
