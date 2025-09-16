import 'package:pvcache/pvcache.dart';
import 'package:pvcache_hive/src/pvci.dart';

class DecryptErrorAdapter extends PVAdapter with OnError {
  DecryptErrorAdapter(super.uid);

  @override
  Future<void> onError(PVCtx ctx) async {
    if (ctx.exception is PVCoDecryptionException) {
      ctx.value = null;
      ctx.continueFlow = false;
    }
  }
}


// ignore: non_constant_identifier_names
final DecryptErrorAdapter DECRYPT_ERROR_ADAPTER = DecryptErrorAdapter('pvco_decrypt_error_adapter');