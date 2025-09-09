import 'package:pvcache/src/interface.dart';

/// Concrete adapter implementation with singleton factory pattern.
///
/// Ensures only one adapter instance exists per unique identifier,
/// preventing conflicts and duplicate registrations.
class PVAdapter extends PVBaseAdapter {
  static final Map<String, PVAdapter> _instances = {};

  PVAdapter(super.uid){
    _instances[uid] = this;
  }

  /// Retrieves an existing adapter by its unique identifier.
  ///
  /// Returns adapter
  static PVBaseAdapter? getInstance(String uid) {
    return _instances[uid];
  }
}

/// Base mixin for adapters that participate in operation flow.
///
/// All operation-related mixins implement this to indicate they
/// hook into the cache operation execution pipeline.
mixin OpFlow on PVBaseAdapter {}

/// Mixin for adapters that need to run before get operations.
///
/// Implement this to add behavior like cache validation, key transformation,
/// or conditional logic before values are retrieved from storage.
mixin PreGet on PVBaseAdapter implements OpFlow {
  /// Execution priority (0 = highest priority, executes first)
  int get preGetPriority => 0;

  /// Called before the main get operation
  Future<void> preGet(PVCtx ctx);
}

/// Mixin for adapters that need to run after get operations.
///
/// Implement this to add behavior like result transformation, logging,
/// or post-processing after values are retrieved from storage.
mixin PostGet on PVBaseAdapter implements OpFlow {
  /// Execution priority (0 = highest priority, executes first)
  int get postGetPriority => 0;

  /// Called after the main get operation
  Future<void> postGet(PVCtx ctx);
}

/// Mixin for adapters that need to run before set operations.
///
/// Implement this to add behavior like value validation, transformation,
/// or conditional logic before values are stored.
mixin PreSet on PVBaseAdapter implements OpFlow {
  /// Execution priority (0 = highest priority, executes first)
  int get preSetPriority => 0;

  /// Called before the main set operation
  Future<void> preSet(PVCtx ctx);
}

/// Mixin for adapters that need to run after set operations.
///
/// Implement this to add behavior like cleanup, notifications,
/// or post-processing after values are stored.
mixin PostSet on PVBaseAdapter implements OpFlow {
  /// Execution priority (0 = highest priority, executes first)
  int get postSetPriority => 0;

  /// Called after the main set operation
  Future<void> postSet(PVCtx ctx);
}

/// Mixin for adapters that need to run before delete operations.
mixin PreDelete on PVBaseAdapter implements OpFlow {
  /// Execution priority (0 = highest priority, executes first)
  int get preDeletePriority => 0;

  /// Called before the main delete operation
  Future<void> preDelete(PVCtx ctx);
}

/// Mixin for adapters that need to run after delete operations.
mixin PostDelete on PVBaseAdapter implements OpFlow {
  /// Execution priority (0 = highest priority, executes first)
  int get postDeletePriority => 0;

  /// Called after the main delete operation
  Future<void> postDelete(PVCtx ctx);
}

/// Mixin for adapters that need to run before clear operations.
mixin PreClear on PVBaseAdapter implements OpFlow {
  /// Execution priority (0 = highest priority, executes first)
  int get preClearPriority => 0;

  /// Called before the main clear operation
  Future<void> preClear(PVCtx ctx);
}

/// Mixin for adapters that need to run after clear operations.
mixin PostClear on PVBaseAdapter implements OpFlow {
  /// Execution priority (0 = highest priority, executes first)
  int get postClearPriority => 0;

  /// Called after the main clear operation
  Future<void> postClear(PVCtx ctx);
}

/// Mixin for adapters that need to run before exists operations.
mixin PreExists on PVBaseAdapter implements OpFlow {
  /// Execution priority (0 = highest priority, executes first)
  int get preExistsPriority => 0;

  /// Called before the main exists operation
  Future<void> preExists(PVCtx ctx);
}

/// Mixin for adapters that need to run after exists operations.
mixin PostExists on PVBaseAdapter implements OpFlow {
  /// Execution priority (0 = highest priority, executes first)
  int get postExistsPriority => 0;

  /// Called after the main exists operation
  Future<void> postExists(PVCtx ctx);
}

/// Convenience mixin that implements all pre-operation hooks.
///
/// Instead of implementing individual PreGet, PreSet, etc. mixins,
/// you can implement this single mixin and define one preOp method
/// that will be called for all operations.
mixin PreOp on PVBaseAdapter
    implements PreGet, PreSet, PreDelete, PreClear, PreExists {
  /// Execution priority (0 = highest priority, executes first)
  int get preOpPriority => 0;

  /// Called before any cache operation
  Future<void> preOp(PVCtx ctx);

  @override
  Future<void> preClear(PVCtx ctx) {
    return preOp(ctx);
  }

  @override
  Future<void> preDelete(PVCtx ctx) {
    return preOp(ctx);
  }

  @override
  Future<void> preExists(PVCtx ctx) {
    return preOp(ctx);
  }

  @override
  Future<void> preGet(PVCtx ctx) {
    return preOp(ctx);
  }

  @override
  Future<void> preSet(PVCtx ctx) {
    return preOp(ctx);
  }
}

/// Convenience mixin that implements all post-operation hooks.
///
/// Instead of implementing individual PostGet, PostSet, etc. mixins,
/// you can implement this single mixin and define one postOp method
/// that will be called for all operations.
mixin PostOp on PVBaseAdapter
    implements PostGet, PostSet, PostDelete, PostClear, PostExists {
  /// Execution priority (0 = highest priority, executes first)
  int get postOpPriority => 0;

  /// Called after any cache operation
  Future<void> postOp(PVCtx ctx);

  @override
  Future<void> postClear(PVCtx ctx) {
    return postOp(ctx);
  }

  @override
  Future<void> postDelete(PVCtx ctx) {
    return postOp(ctx);
  }

  @override
  Future<void> postExists(PVCtx ctx) {
    return postOp(ctx);
  }

  @override
  Future<void> postGet(PVCtx ctx) {
    return postOp(ctx);
  }

  @override
  Future<void> postSet(PVCtx ctx) {
    return postOp(ctx);
  }
}

// Metadata processing mixins

/// Base mixin for adapters that process metadata.
///
/// Metadata adapters run before the main operation to process
/// the metadata Map passed to cache operations.
mixin OnMetadata on PVBaseAdapter {
  /// Execution priority (0 = highest priority, executes first)
  int get onMetadataPriority => 0;

  /// Called to process metadata before the operation
  Future<void> onMetadata(PVCtx ctx);
}

/// Metadata adapter that only runs when specific keys are present.
///
/// This allows adapters to filter themselves based on metadata keys,
/// preventing unnecessary execution when the adapter's functionality
/// isn't needed for the current operation.
mixin ScopedMetadataKeys on PVBaseAdapter implements OnMetadata {
  /// List of metadata keys this adapter cares about
  List<String> get scopedMetadataKeys => [];

  /// How to match keys: 'all' means all keys must be present,
  /// 'any' means at least one key must be present
  String get scopedMetadataKeysMatch => 'all'; // 'all' | 'any'

  /// Whether this adapter allows other adapters to use the same metadata keys
  bool get allowSharedKeys => false;
}

/// Metadata adapter with custom scope matching logic.
///
/// For complex scenarios where simple key matching isn't sufficient,
/// implement this mixin to define custom logic for when the adapter
/// should run based on the operation context.
mixin ScopedMetadataCustom on PVBaseAdapter implements OnMetadata {
  /// Custom logic to determine if this adapter should run
  Future<bool> matchesScope(PVCtx ctx) async {
    return false;
  }
}

// Error handling mixins

/// Mixin for adapters that handle exceptions during operations.
///
/// When an exception occurs, adapters with this mixin will be called
/// to handle the error. They can modify the context, log the error,
/// or perform cleanup actions.
mixin OnError on PVBaseAdapter {
  /// Execution priority (0 = highest priority, executes first)
  int get onErrorPriority => 0;

  /// Whether this handler only runs for errors in the main storage function
  /// (true) or for errors in any part of the operation (false)
  bool get mainFuncExclusive => false;

  /// Called when an exception occurs during the operation
  Future<void> onError(PVCtx ctx);
}

/// Mixin for adapters that need cleanup logic regardless of success/failure.
///
/// Finally handlers always run after an operation completes, whether it
/// succeeded or failed. Use this for cleanup tasks like closing connections
/// or releasing resources.
mixin OnFinally on PVBaseAdapter {
  /// Execution priority (0 = highest priority, executes first)
  int get onFinallyPriority => 0;

  /// Whether this handler only runs for the main storage function
  /// (true) or for any part of the operation (false)
  bool get mainFuncExclusive => false;

  /// Called after the operation completes (success or failure)
  Future<void> onFinally(PVCtx ctx);
}
