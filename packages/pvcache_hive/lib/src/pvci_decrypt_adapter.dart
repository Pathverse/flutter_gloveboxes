import 'package:pvcache/pvcache.dart';
import 'package:pvcache_hive/src/pvci.dart';

class DecryptErrorAdapter extends PVAdapter with OnError {
  DecryptErrorAdapter(super.uid);

  @override
  Future<void> onError(PVCtx ctx) async {
    if (ctx.exception is PVCoDecryptionException) {
      ctx.value = null;
      ctx.continueFlow = false;
      ctx.errorHandled = true;
      //NOTE could cause potential issues without checking existance
      try {
        if (ctx.key != null && ctx.value == null) {
          await ctx.storage!.delete(ctx);
          await ctx.metaStorage?.delete(ctx);
        }
      } catch (e) {
        await ctx.storage!.clear(ctx);
        await ctx.metaStorage?.clear(ctx);
      }
    }
  }
}

// ignore: non_constant_identifier_names
final DecryptErrorAdapter DECRYPT_ERROR_ADAPTER = DecryptErrorAdapter(
  'pvco_decrypt_error_adapter',
);
