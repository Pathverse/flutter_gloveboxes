import 'package:pvlogger/src/logger.dart';

class ParallelLogger extends PVLogger {
  final List<PVLogger> parallelScopes;

  ParallelLogger(
    String namespace, {
    super.nextLogger,
    required this.parallelScopes,
    super.config = const PVLoggerConfig(),
  }) : super.internal(
         namespace: namespace,
       );

  @override
  void action(PVLoggerEvent event) {
    for (var logger in parallelScopes) {
      logger.logEvent(event);
    }
  }
}
