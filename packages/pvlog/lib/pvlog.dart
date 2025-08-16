import 'package:pvlog/adapters/std_printer.dart';
import 'package:pvlog/adapters/store_history.dart';
import 'package:pvlog/core/enums.dart';
import 'package:pvlog/core/logger.dart';

PVLogger createStandardLogger({
  PVLevel? lv,
  String? namespace
}) {
  return PVLogger(
    level: lv ?? PVLevel.all,
    namespace: namespace,
    adapters: {
      StdPrinter(),
      StoreHistory(
        true,
        maxHistory: StoreHistory.staticMaxHistory,
        inScopeTypes: const ["debug"],
      )
    }
  );
}
