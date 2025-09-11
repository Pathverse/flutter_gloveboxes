import 'package:pvlogger/src/adapter.dart';
import 'package:pvlogger/src/ctx.dart';
import 'package:pvlogger/src/event.dart';

class PVLogRegistry {
  static final List<PVLogAdapter> _adapters = [];

  static void register(PVLogAdapter adapter) {
    _adapters.add(adapter);
  }

  static void _performActions(
    List<PVLogAdapter> adapters,
    PVLogEvent event, {
    PVLogContext? ctx,
  }) {
    for (var adapter in adapters) {
      if (adapter is Action) {
        adapter.action(event, ctx: ctx);
      }
    }
  }

  static (List<PVLogAdapter>, bool) _getFilteredAdapters(PVLogConfig cfg) {
    final List<PVLogAdapter> adapters = [];
    bool needsContext = false;
    for (var adapter in _adapters) {
      if (adapter is NamespaceFilter && !adapter.filter(cfg.namespace)) {
        continue;
      }
      if (adapter is ScopeFilter && !adapter.filter(cfg.scopes)) {
        continue;
      }
      adapters.add(adapter);
      if (adapter.requestContext) {
        needsContext = true;
      }
    }
    return (adapters, needsContext);
  }

  static List<PVLogAdapter> _getFiltered2Adapters(
    List<PVLogAdapter> adapters,
    bool isAsync,
    PVLogEvent event, {
    PVLogContext? ctx,
  }) {
    final List<PVLogAdapter> filtered = [];
    for (var adapter in adapters) {
      if (adapter is AsyncAction || adapter is AsyncFilter) {
        if (!isAsync) {
          continue;
        }
      }

      if (adapter is Filter && !adapter.filter(event, ctx: ctx)) {
        continue;
      }
      filtered.add(adapter);
    }
    return filtered;
  }

  static void _performFormat(
    List<PVLogAdapter> adapters,
    PVLogEvent event,
    bool allowFormatterChain, {
    PVLogContext? ctx,
  }) {
    final List<PVLogAdapter> formatters = [];
    if (!allowFormatterChain) {
      formatters.add(adapters.firstWhere((adapter) => adapter is Formatter));
    } else {
      formatters.addAll(adapters.whereType<Formatter>());
    }
    for (var formatter in formatters) {
      formatter as Formatter;
      var result = formatter.format(event, ctx: ctx);
      event.formatted.clear();
      event.formatted.addAll(result);
    }
  }

  static void callerSync(PVLogConfig cfg, PVLogEvent Function() callback) {
    final (List<PVLogAdapter> adapters, bool needsContext) =
        _getFilteredAdapters(cfg);
    final PVLogEvent event = callback();
    final PVLogContext? ctx = needsContext
        ? cfg.toContext(isAsync: false)
        : null;

    _performFormat(adapters, event, cfg.allowFormatterChain, ctx: ctx);

    final filtered = _getFiltered2Adapters(adapters, false, event, ctx: ctx);

    _performActions(filtered, event, ctx: ctx);
  }

  static Future<void> caller(
    PVLogConfig cfg,
    Future<PVLogEvent> Function() callback,
  ) async {
    final (List<PVLogAdapter> adapters, bool needsContext) =
        _getFilteredAdapters(cfg);
    final PVLogEvent event = await callback();
    final PVLogContext? ctx = needsContext
        ? cfg.toContext(isAsync: true)
        : null;

    _performFormat(adapters, event, cfg.allowFormatterChain, ctx: ctx);

    final filtered = _getFiltered2Adapters(adapters, true, event, ctx: ctx);

    _performActions(filtered, event, ctx: ctx);

    for (var adapter in filtered) {
      if (adapter is AsyncAction) {
        await adapter.action(event, ctx: ctx);
      }
    }
  }
}
