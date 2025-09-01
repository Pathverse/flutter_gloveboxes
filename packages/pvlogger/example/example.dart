import 'package:flutter/material.dart';
import 'package:pvlogger/templates/print_logger.dart';
import 'package:pvlogger/templates/history_logger.dart';
import 'package:pvlogger/templates/controlflow.dart';
import 'package:pvlogger/templates/scoped_filter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PVLogger Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoggerExamplePage(),
    );
  }
}

class LoggerExamplePage extends StatefulWidget {
  const LoggerExamplePage({super.key});

  @override
  State<LoggerExamplePage> createState() => _LoggerExamplePageState();
}

class _LoggerExamplePageState extends State<LoggerExamplePage> {
  late PrintLogger printLogger;
  late HistoryLogger historyLogger;
  late ParallelLogger parallelLogger;
  late ScopedFilter scopedFilter;

  @override
  void initState() {
    super.initState();
    setupLoggers();
    logExampleMessages();
  }

  void setupLoggers() {
    // Create a PrintLogger for console output
    printLogger = PrintLogger('console');

    // Create a ScopedFilter that only allows 'user' and 'system' scopes
    scopedFilter = ScopedFilter(
      'filter',
      currentScopes: ['user', 'system'],
    );

    // Create a ParallelLogger that logs to both print and scoped filter
    parallelLogger = ParallelLogger(
      'parallel',
      parallelScopes: [printLogger, scopedFilter],
    );

    // Create a HistoryLogger that stores events and forwards to parallel logger
    historyLogger = HistoryLogger(
      'history',
      maxHistorySize: 10,
      nextLogger: 'parallel',
    );
  }

  void logExampleMessages() {
    // Log messages with different scopes - all go through history first
    logWithScope('user', 'User logged in');
    logWithScope('system', 'System started');
    logWithScope('debug', 'Debug message'); // This should be filtered out by scope filter
    logWithScope('user', 'User performed action');
    logWithScope('error', 'Error occurred'); // This should be filtered out by scope filter
  }

  void logWithScope(String scope, String message) {
    // Start the chain with history logger
    historyLogger.log(message, metadata: {'scope': scope});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PVLogger Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Logger Chain: History → Parallel → (Print + ScopedFilter)',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 5),
            const Text(
              'Logged Events (stored in HistoryLogger):',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: historyLogger.events.length,
                itemBuilder: (context, index) {
                  final event = historyLogger.events[index];
                  final scope = event.metadata['scope'] ?? 'unknown';
                  return ListTile(
                    title: Text(event.raw.toString()),
                    subtitle: Text('Scope: $scope | Time: ${event.timestamp}'),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                logWithScope('user', 'Button pressed by user');
                setState(() {}); // Refresh the list
              },
              child: const Text('Log User Action'),
            ),
            ElevatedButton(
              onPressed: () {
                logWithScope('system', 'System event triggered');
                setState(() {});
              },
              child: const Text('Log System Event'),
            ),
            ElevatedButton(
              onPressed: () {
                logWithScope('debug', 'Debug info');
                setState(() {});
              },
              child: const Text('Log Debug (Filtered)'),
            ),
          ],
        ),
      ),
    );
  }
}
