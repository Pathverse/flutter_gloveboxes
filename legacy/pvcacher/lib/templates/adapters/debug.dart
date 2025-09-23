import 'package:pvcacher/src/adapter.dart';
import 'package:pvcacher/src/ctx.dart';

/// Debug adapter that prints detailed operation information
class DebugAdapter extends PVCacheAdapter
    with
        PVPreset,
        PVPostSet,
        PVPreGet,
        PVPostGet,
        PVPreHas,
        PVPostHas,
        PVPreRemove,
        PVPostRemove,
        PVPreClear,
        PVPostClear,
        PVOnOptions {
  final String prefix;
  final bool showContext;
  final bool showOptions;
  final bool showResults;

  DebugAdapter({
    this.prefix = 'DEBUG',
    this.showContext = false,
    this.showOptions = true,
    this.showResults = true,
  });

  void _print(String operation, String message) {
    // ignore: avoid_print
    print('$prefix [$operation]: $message');
  }

  @override
  Future<void> onOptions(PVCacheCtx ctx) async {
    if (showOptions && ctx.options.isNotEmpty) {
      _print(ctx.callingFunc.toUpperCase(), 'Options: ${ctx.options}');
    }
  }

  @override
  Future<void> preSet(PVCacheCtx ctx) async {
    _print(
      'SET',
      'Setting key: ${ctx.key}, value: ${_truncateValue(ctx.value)}',
    );
    if (showContext && ctx.contexts.isNotEmpty) {
      _print('SET', 'Context: ${ctx.contexts}');
    }
  }

  @override
  Future<void> postSet(PVCacheCtx ctx) async {
    _print('SET', 'Successfully set key: ${ctx.key}');
  }

  @override
  Future<void> preGet(PVCacheCtx ctx) async {
    _print('GET', 'Getting key: ${ctx.key}');
  }

  @override
  Future<void> postGet(PVCacheCtx ctx) async {
    if (showResults) {
      _print(
        'GET',
        'Retrieved: ${_truncateValue(ctx.result)} (null: ${ctx.result == null})',
      );
    }
  }

  @override
  Future<void> preHas(PVCacheCtx ctx) async {
    _print('HAS', 'Checking existence of key: ${ctx.key}');
  }

  @override
  Future<void> postHas(PVCacheCtx ctx) async {
    if (showResults) {
      _print('HAS', 'Key ${ctx.key} exists: ${ctx.result}');
    }
  }

  @override
  Future<void> preRemove(PVCacheCtx ctx) async {
    _print('REMOVE', 'Removing key: ${ctx.key}');
  }

  @override
  Future<void> postRemove(PVCacheCtx ctx) async {
    _print('REMOVE', 'Successfully removed key: ${ctx.key}');
  }

  @override
  Future<void> preClear(PVCacheCtx ctx) async {
    _print(
      'CLEAR',
      'Clearing all cache data for namespace: ${ctx.cacher.namespace}',
    );
  }

  @override
  Future<void> postClear(PVCacheCtx ctx) async {
    _print('CLEAR', 'Successfully cleared namespace: ${ctx.cacher.namespace}');
  }

  /// Truncate long values for cleaner output
  String _truncateValue(dynamic value, {int maxLength = 100}) {
    final str = value.toString();
    if (str.length <= maxLength) return str;
    return '${str.substring(0, maxLength)}...';
  }
}

/// Verbose debug adapter with full context and detailed information
class VerboseDebugAdapter extends DebugAdapter {
  VerboseDebugAdapter({String prefix = 'VERBOSE_DEBUG'})
    : super(
        prefix: prefix,
        showContext: true,
        showOptions: true,
        showResults: true,
      );

  @override
  String _truncateValue(dynamic value, {int maxLength = 200}) {
    return super._truncateValue(value, maxLength: maxLength);
  }

  @override
  Future<void> preSet(PVCacheCtx ctx) async {
    await super.preSet(ctx);
    _print('SET', 'Namespace: ${ctx.cacher.namespace}');
    _print('SET', 'Value type: ${ctx.value.runtimeType}');
  }

  @override
  Future<void> postGet(PVCacheCtx ctx) async {
    await super.postGet(ctx);
    if (ctx.result != null) {
      _print('GET', 'Result type: ${ctx.result.runtimeType}');
    }
  }
}

/// Minimal debug adapter with only essential information
class MinimalDebugAdapter extends DebugAdapter {
  MinimalDebugAdapter({super.prefix = 'CACHE'})
    : super(showContext: false, showOptions: false, showResults: false);

  @override
  Future<void> preSet(PVCacheCtx ctx) async {
    _print('SET', '${ctx.key}');
  }

  @override
  Future<void> preGet(PVCacheCtx ctx) async {
    _print('GET', '${ctx.key}');
  }

  @override
  Future<void> postGet(PVCacheCtx ctx) async {
    _print('GET', '${ctx.key} → ${ctx.result != null ? '✓' : '✗'}');
  }

  @override
  Future<void> preRemove(PVCacheCtx ctx) async {
    _print('REMOVE', '${ctx.key}');
  }

  @override
  Future<void> preClear(PVCacheCtx ctx) async {
    _print('CLEAR', ctx.cacher.namespace);
  }
}
