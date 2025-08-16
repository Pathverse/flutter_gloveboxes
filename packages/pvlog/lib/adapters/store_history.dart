import 'package:pvlog/core/logger.dart';

class StoreHistory extends PvLogAdapter {
  static List<PVLogEvent> staticDebugHistory = [];
  static int staticMaxHistory = 10;
  static List<String> staticInScopeTypes = [];

  late final List<PVLogEvent>? _debugHistory;
  final bool useStatic;
  final int? maxHistory;
  final List<String> inScopeTypes;

  StoreHistory(
    this.useStatic, {
    this.maxHistory,
    this.inScopeTypes = const [],
  }) {
    _debugHistory = useStatic ? const [] : null;
    if (useStatic && maxHistory != null) {
      throw ArgumentError('if using static, you cannot set maxHistory');
    }
  }

  @override
  bool get hasForward => true;

  @override
  void forward(PVLogEvent event) {
    List<PVLogEvent> targetList;
    List<String> targetScopes;
    if (useStatic) {
      targetList = StoreHistory.staticDebugHistory;
      targetScopes = StoreHistory.staticInScopeTypes;
    } else {
      targetList = _debugHistory!;
      targetScopes = inScopeTypes;
    }

    if (targetScopes.isNotEmpty && !targetScopes.contains(event.logType)) {
      return;
    }

    targetList.add(event);
    if (targetList.length > (maxHistory ?? 0)) {
      targetList.removeAt(0);
    }
  }
}
