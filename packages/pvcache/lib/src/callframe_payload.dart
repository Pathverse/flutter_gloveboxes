import 'package:flutter/foundation.dart';
import 'package:pvcache/src/adapter.dart';
import 'package:pvcache/src/interface.dart';

/// Configuration payload for building call frames.
///
/// This class maps adapters to their corresponding operation methods
/// and caches the results to avoid rebuilding identical configurations.
/// It uses instance caching to ensure the same adapter configuration
/// produces the same payload object.
class PVCFramePayload {
  static final Set<PVCFramePayload> _instances = {};

  /// List of adapters to process
  List<PVBaseAdapter> adapters;

  /// Main storage function to execute
  Function(PVCtx ctx) mainFunc;

  /// Type of operation being performed (get/set/delete/clear/exists)
  String callingType;

  /// Cached mapping of operation types to adapter functions with priorities
  late final Map<String, List<(Function(PVCtx ctx), int)>> _opMapCache;

  PVCFramePayload._internal({
    required this.adapters,
    required this.mainFunc,
    required this.callingType,
  }) {
    _opMapCache = getAdaptersMap(this);
  }

  /// Read-only access to the operation mapping cache
  Map<String, List<(Function(PVCtx ctx), int)>> get opMapCache =>
      Map.unmodifiable(_opMapCache);

  /// Creates or retrieves a cached payload for the given configuration.
  ///
  /// Uses hash-based caching to avoid rebuilding identical adapter mappings.
  /// This significantly improves performance when the same adapter configuration
  /// is used multiple times.
  factory PVCFramePayload({
    required List<PVBaseAdapter> adapters,
    required Function(PVCtx ctx) mainFunc,
    required String callingType,
  }) {
    final hash = computeHashCode(adapters, mainFunc, callingType);
    final existing = _instances.firstWhere(
      (element) => element.hashCode == hash,
      orElse: () => PVCFramePayload._internal(
        adapters: adapters,
        mainFunc: mainFunc,
        callingType: callingType,
      ),
    );
    return existing;
  }

  @override
  int get hashCode {
    return adapters.hashCode ^ mainFunc.hashCode ^ callingType.hashCode;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PVCFramePayload &&
        listEquals(other.adapters, adapters) &&
        other.mainFunc == mainFunc &&
        other.callingType == callingType;
  }

  /// Computes hash code for payload caching.
  static int computeHashCode(
    List<PVBaseAdapter> adapters,
    Function(PVCtx ctx) mainFunc,
    String callingType,
  ) {
    return adapters.hashCode ^ mainFunc.hashCode ^ callingType.hashCode;
  }

  /// Maps adapters to their operation methods based on implemented mixins.
  ///
  /// This is the core logic that scans each adapter for mixin implementations
  /// and builds the execution map. It handles:
  /// - Operation-specific mappings (PreGet -> preGet method)
  /// - Metadata processing with scope validation
  /// - Error and cleanup handler registration
  /// - Metadata key collision detection
  static Map<String, List<(Function(PVCtx ctx), int)>> getAdaptersMap(
    PVCFramePayload payload,
  ) {
    Map<String, List<(Function(PVCtx ctx), int)>> map = {};
    final Set<String> metaUsedSet = {};

    for (var adapter in payload.adapters) {
      if (adapter is! PVAdapter) {
        throw Exception('Adapter ${adapter.uid} is not a PVAdapter instance.');
      }

      // Handle OpFlow-based adapters (pre/post operation hooks)
      if (adapter is OpFlow) {
        map['preOp'] = map['preOp'] ?? [];
        map['postOp'] = map['postOp'] ?? [];

        switch (payload.callingType) {
          case "set":
            if (adapter is PreSet) {
              map['preOp']?.add((
                (adapter as PreSet).preSet,
                (adapter as PreSet).preSetPriority,
              ));
            }
            if (adapter is PostSet) {
              map['postOp']?.add((
                (adapter as PostSet).postSet,
                (adapter as PostSet).postSetPriority,
              ));
            }
            break;
          case "get":
            if (adapter is PreGet) {
              map['preOp']?.add((
                (adapter as PreGet).preGet,
                (adapter as PreGet).preGetPriority,
              ));
            }
            if (adapter is PostGet) {
              map['postOp']?.add((
                (adapter as PostGet).postGet,
                (adapter as PostGet).postGetPriority,
              ));
            }
            break;
          case "delete":
            if (adapter is PreDelete) {
              map['preOp']?.add((
                (adapter as PreDelete).preDelete,
                (adapter as PreDelete).preDeletePriority,
              ));
            }
            if (adapter is PostDelete) {
              map['postOp']?.add((
                (adapter as PostDelete).postDelete,
                (adapter as PostDelete).postDeletePriority,
              ));
            }
            break;
          case "clear":
            if (adapter is PreClear) {
              map['preOp']?.add((
                (adapter as PreClear).preClear,
                (adapter as PreClear).preClearPriority,
              ));
            }
            if (adapter is PostClear) {
              map['postOp']?.add((
                (adapter as PostClear).postClear,
                (adapter as PostClear).postClearPriority,
              ));
            }
            break;
          case "has":
            if (adapter is PreExists) {
              map['preOp']?.add((
                (adapter as PreExists).preExists,
                (adapter as PreExists).preExistsPriority,
              ));
            }
            if (adapter is PostExists) {
              map['postOp']?.add((
                (adapter as PostExists).postExists,
                (adapter as PostExists).postExistsPriority,
              ));
            }
            break;
          default:
            break;
        }
      }

      // metadata parsing
      map["meta"] = map["meta"] ?? [];
      bool isMetaCustom = false;
      bool isMetaBasic = false;
      bool isMetaKeyList = false;
      if (adapter is ScopedMetadataCustom) {
        isMetaCustom = true;
      }
      if (adapter is ScopedMetadataKeys) {
        final scopedAdapter = adapter as ScopedMetadataKeys;

        // check match strategy
        if (!["any", "all"].contains(scopedAdapter.scopedMetadataKeysMatch)) {
          throw Exception(
            'Adapter ${adapter.uid} has invalid match strategy ${scopedAdapter.scopedMetadataKeysMatch}.',
          );
        }

        if (!scopedAdapter.allowSharedKeys) {
          // check collision
          for (var key in scopedAdapter.scopedMetadataKeys) {
            if (metaUsedSet.contains(key)) {
              throw Exception(
                'Metadata key $key is already used by another adapter.',
              );
            }
            metaUsedSet.add(key);
          }
        }
        isMetaKeyList = true;
      }
      if (adapter is OnMetadata) {
        isMetaBasic = true;
      }

      if (isMetaBasic) {
        map["meta"]?.add((
          (PVCtx ctx) async {
            if (isMetaCustom &&
                !await (adapter as ScopedMetadataCustom).matchesScope(ctx)) {
              return;
            }

            if (isMetaKeyList) {
              final kladapter = adapter as ScopedMetadataKeys;
              // check if all keys matches
              if (kladapter.scopedMetadataKeysMatch == 'all') {
                if (!kladapter.scopedMetadataKeys.every(
                  (key) => ctx.metadata.keys.contains(key),
                )) {
                  return;
                }
              } else if (kladapter.scopedMetadataKeysMatch == 'any') {
                if (!kladapter.scopedMetadataKeys.any(
                  (key) => ctx.metadata.keys.contains(key),
                )) {
                  return;
                }
              }
            }
            await (adapter as OnMetadata).onMetadata(ctx);
          },
          (adapter as OnMetadata).onMetadataPriority,
        ));
      }

      // Handle error and cleanup adapters (processed for all adapters, not just OpFlow)
      if (adapter is OnError && (adapter as OnError).mainFuncExclusive) {
        map['onErrorMain'] = map['onErrorMain'] ?? [];
        map['onErrorMain']?.add((
          (adapter as OnError).onError,
          (adapter as OnError).onErrorPriority,
        ));
      } else if (adapter is OnError) {
        map['onError'] = map['onError'] ?? [];
        map['onError']?.add((
          (adapter as OnError).onError,
          (adapter as OnError).onErrorPriority,
        ));
      }

      if (adapter is OnFinally && (adapter as OnFinally).mainFuncExclusive) {
        map['onFinallyMain'] = map['onFinallyMain'] ?? [];
        map['onFinallyMain']?.add((
          (adapter as OnFinally).onFinally,
          (adapter as OnFinally).onFinallyPriority,
        ));
      } else if (adapter is OnFinally) {
        map['onFinally'] = map['onFinally'] ?? [];
        map['onFinally']?.add((
          (adapter as OnFinally).onFinally,
          (adapter as OnFinally).onFinallyPriority,
        ));
      }
    }
    return map;
  }
}
