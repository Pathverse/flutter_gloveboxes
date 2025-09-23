import 'package:pvlogger/src/ctx.dart';
import 'package:pvlogger/src/scoper.dart';
export 'package:pvlogger/src/scoper.dart';
export 'package:pvlogger/src/registry.dart';
export 'package:pvlogger/src/ctx.dart';
export 'package:pvlogger/templates.dart';
export 'package:pvlogger/helper.dart';

final logger = PVLogScoper(
  config: PVLogConfig(namespace: 'default', scopes: []),
);
