import 'package:pvcache/src/callframe_payload.dart';
import 'package:pvcache/src/interface.dart';

/// Pre-compiled execution frame for cache operations.
///
/// This class builds the complete execution pipeline at startup, including
/// metadata processing, pre/post operation adapters, error handlers, and
/// the main storage function. This eliminates runtime compilation overhead.
class PVCFrame {
  /// Ordered list of functions to execute (metadata + pre-ops + main + post-ops)
  final List<Function(PVCtx ctx)> callstack;

  /// Index of the main storage function in the callstack
  int mainFuncIndex;

  /// Error handlers for adapter-level exceptions
  final List<Function(PVCtx ctx)> onError;

  /// Cleanup handlers for adapter-level operations
  final List<Function(PVCtx ctx)> onFinally;

  /// Error handlers specific to main storage function exceptions
  final List<Function(PVCtx ctx)> onErrorMain;

  /// Cleanup handlers specific to main storage function
  final List<Function(PVCtx ctx)> onFinallyMain;

  PVCFrame({
    this.callstack = const [],
    required this.mainFuncIndex,
    this.onError = const [],
    this.onFinally = const [],
    this.onErrorMain = const [],
    this.onFinallyMain = const [],
  });

  /// Executes the complete operation pipeline.
  ///
  /// Runs through all functions in the callstack in order, handling
  /// exceptions and flow control. If an adapter sets ctx.continueFlow = false,
  /// execution stops early.
  ///
  /// Error handling flow:
  /// - Main function errors: Run main-specific handlers first, then general handlers
  /// - Adapter errors: Run only general handlers
  /// - Adapters can set ctx.errorHandled = true to prevent rethrowing
  /// - If ctx.errorHandled = true during main-specific handlers, general handlers are skipped
  Future<void> call(PVCtx ctx) async {
    int currentIndex = 0;
    for (var func in callstack) {
      try {
        await func(ctx);
        if (!ctx.continueFlow) {
          break;
        }
      } on Exception catch (e, stackTrace) {
        // Exception handling - route to appropriate error handlers
        ctx.exception = e;
        ctx.stackTrace = stackTrace;
        ctx.errorHandled = false;

        if (currentIndex == mainFuncIndex && onErrorMain.isNotEmpty) {
          // Run main-specific error handlers first
          for (var func in onErrorMain) {
            await func(ctx);
            if (ctx.errorHandled) {
              break;
            }
            if (!ctx.continueFlow) {
              break;
            }
          }
        }

        // Run general error handlers (for all errors, including main)
        if (onError.isNotEmpty && !ctx.errorHandled) {
          for (var func in onError) {
            await func(ctx);
            if (!ctx.continueFlow) {
              break;
            }
          }
        }

        // Only rethrow if no handler marked the error as handled
        if (!ctx.errorHandled) {
          rethrow;
        }
      } finally {
        // Cleanup handling - route to appropriate finally handlers
        if (currentIndex == mainFuncIndex && onFinallyMain.isNotEmpty) {
          // Run main-specific finally handlers first
          for (var func in onFinallyMain) {
            await func(ctx);
            if (!ctx.continueFlow) {
              break;
            }
          }
        }

        // Run general finally handlers (for all operations, including main)
        if (onFinally.isNotEmpty) {
          for (var func in onFinally) {
            await func(ctx);
            if (!ctx.continueFlow) {
              break;
            }
          }
        }
      }
      currentIndex++;
    }
  }

  /// Creates a simple frame with no adapters, just the main function.
  factory PVCFrame.emptyAdapters(Function(PVCtx ctx) mainFunc) {
    return PVCFrame(callstack: [mainFunc], mainFuncIndex: 0);
  }

  /// Creates a frame from a pre-built payload configuration.
  ///
  /// This is the main factory method that builds the complete execution
  /// pipeline from adapter configurations.
  factory PVCFrame.fromPayload(PVCFramePayload payload) {
    if (payload.adapters.isEmpty) {
      return PVCFrame.emptyAdapters(payload.mainFunc);
    }
    final callstack = <Function(PVCtx ctx)>[];

    // Build complete execution pipeline
    final metadataStack = getMetadataParseStack(payload);
    callstack.addAll(metadataStack);
    
    final (opCallstack, opMainFuncIndex) = getOpCallStack(payload);
    callstack.addAll(opCallstack);
    
    // Adjust main function index to account for metadata stack
    final mainFuncIndex = metadataStack.length + opMainFuncIndex;

    // Extract error and cleanup handlers
    final onError =
        payload.opMapCache["onError"]?.map((e) => e.$1).toList() ?? [];
    final onFinally =
        payload.opMapCache["onFinally"]?.map((e) => e.$1).toList() ?? [];
    final onErrorMain =
        payload.opMapCache["onErrorMain"]?.map((e) => e.$1).toList() ?? [];
    final onFinallyMain =
        payload.opMapCache["onFinallyMain"]?.map((e) => e.$1).toList() ?? [];

    return PVCFrame(
      callstack: callstack,
      mainFuncIndex: mainFuncIndex,
      onError: onError,
      onFinally: onFinally,
      onErrorMain: onErrorMain,
      onFinallyMain: onFinallyMain,
    );
  }

  /// Builds the operation callstack with proper priority ordering.
  ///
  /// Creates the sequence: pre-ops (by priority) -> main function -> post-ops (by priority).
  /// All operations use ascending priority (0 = highest priority, executes first).
  static (List<Function(PVCtx ctx)>, int) getOpCallStack(
    PVCFramePayload payload,
  ) {
    List<Function(PVCtx ctx)> callStack = [];
    final preOps = payload.opMapCache["preOp"] ?? [];
    final postOps = payload.opMapCache["postOp"] ?? [];

    preOps.sort((a, b) => a.$2.compareTo(b.$2));
    postOps.sort((a, b) => a.$2.compareTo(b.$2));

    callStack.addAll(preOps.map((e) => e.$1));
    callStack.add(payload.mainFunc);
    final mainFuncIndex = callStack.length - 1;

    callStack.addAll(postOps.map((e) => e.$1));

    return (callStack, mainFuncIndex);
  }

  /// Builds the metadata processing callstack.
  ///
  /// Metadata adapters run first in the pipeline to process the metadata
  /// Map before any operation logic executes.
  static List<Function(PVCtx ctx)> getMetadataParseStack(
    PVCFramePayload payload,
  ) {
    List<Function(PVCtx ctx)> callStack = [];
    final metaOps = payload.opMapCache["meta"] ?? [];

    metaOps.sort((a, b) => a.$2.compareTo(b.$2));

    callStack.add((PVCtx ctx) async {
      // before metadata processing hook
      if (ctx.metaStorage != null && ctx.metaStorage!.hasMetaHook) {
        await ctx.metaStorage!.beforeMetaOperation(ctx);
      }
      if (ctx.storage!.hasMetaHook) {
        await ctx.storage!.beforeMetaOperation(ctx);
      }
    });

    callStack.addAll(metaOps.map((e) => e.$1));

    callStack.add((PVCtx ctx) async {
      // after metadata processing hook
      if (ctx.metaStorage != null && ctx.metaStorage!.hasMetaHook) {
        await ctx.metaStorage!.afterMetaOperation(ctx);
      }
      if (ctx.storage!.hasMetaHook) {
        await ctx.storage!.afterMetaOperation(ctx);
      }
    });

    return callStack;
  }

  /// Builds all 5 operation frames for a cache instance.
  ///
  /// This creates the complete set of pre-compiled frames that the cache
  /// will use for all operations. Called once during cache initialization.
  static Map<String, PVCFrame> buildFromCache(
    PVBaseStorage storage,
    List<PVBaseAdapter> adapters,
  ) {
    final Map<String, PVCFrame> frames = {};
    frames["get"] = PVCFrame.fromPayload(
      PVCFramePayload(
        adapters: adapters,
        mainFunc: storage.get,
        callingType: "get",
      ),
    );
    frames["set"] = PVCFrame.fromPayload(
      PVCFramePayload(
        adapters: adapters,
        mainFunc: storage.set,
        callingType: "set",
      ),
    );
    frames["delete"] = PVCFrame.fromPayload(
      PVCFramePayload(
        adapters: adapters,
        mainFunc: storage.delete,
        callingType: "delete",
      ),
    );
    frames["clear"] = PVCFrame.fromPayload(
      PVCFramePayload(
        adapters: adapters,
        mainFunc: storage.clear,
        callingType: "clear",
      ),
    );
    frames["exists"] = PVCFrame.fromPayload(
      PVCFramePayload(
        adapters: adapters,
        mainFunc: storage.exists,
        callingType: "exists",
      ),
    );
    return frames;
  }
}
