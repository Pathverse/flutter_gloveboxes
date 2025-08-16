import 'package:pvlog/adapters/std_printer.dart';
import 'package:pvlog/adapters/store_history.dart';
import 'package:pvlog/core/enums.dart';
import 'package:pvlog/core/logger.dart';

PVLogger createStandardLogger({
  PVLevel? lv,
  String? filepath,
  String? package,
  String? function,
}) {
  return PVLogger(
    level: lv ?? PVLevel.all,
    filepath: filepath,
    package: package,
    function: function,
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
