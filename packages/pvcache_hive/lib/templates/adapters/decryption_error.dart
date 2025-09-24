import 'package:pvcache/pvcache.dart';

class DecryptionErrorAdapter extends PVAdapter with OnError {
  // 1 deletes the item on decryption error
  // 2 callback to a function to reset the item
  // 3 do nothing and return null
  DecryptionErrorAdapter(super.uid, this.strategy, {this.resetCallback}) {
    if (strategy < 1 || strategy > 3) {
      throw ArgumentError('Invalid strategy $strategy. It must be 1, 2, or 3.');
    }
  }

  final int strategy;
  final Future<void> Function(PVCtx ctx)? resetCallback;

  @override
  Future<void> onError(PVCtx ctx) async {
    // check if this is a decryption error of get
    if (ctx.key == null || ctx.initialValue != null) {
      return;
    }

    ctx.errorHandled = true;

    if (strategy == 1) {
      // delete the item
      await ctx.storage!.delete(ctx);
      await ctx.metaStorage?.delete(ctx);
      ctx.continueFlow = false;
    } else if (strategy == 2) {
      // call the reset callback if provided
      if (resetCallback != null) {
        resetCallback!(ctx);
      } else {
        throw ArgumentError('Reset callback must be provided for strategy 2.');
      }
      return;
    }
    // strategy 3: do nothing

    ctx.continueFlow = false;
    ctx.value = null;
    return;
  }
}
