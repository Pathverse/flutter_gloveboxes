// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'pvcache_test_suite.dart';

/// Test runners for different scenarios
class PVCacheTestRunners {
  /// Run tests in a Flutter app context
  static Future<void> runInFlutterApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    await PVCacheTestSuite.runAllTests();
  }

  /// Run specific test categories
  static Future<void> runBasicTests() async {
    await PVCacheTestSuite.initializePVCache();
    await PVCacheTestSuite.testPVCacheOperations();
  }

  /// Run only cache adapter tests
  static Future<void> runCacheAdapterTests() async {
    await PVCacheTestSuite.initializePVCache();
    await PVCacheTestSuite.testLRUAdapter();
    await PVCacheTestSuite.testLFUAdapter();
  }

  /// Run initialization test only
  static Future<void> runInitializationTest() async {
    await PVCacheTestSuite.initializePVCache();
    print('✅ PVCache initialization test completed successfully!');
  }
}

/// Flutter widget for displaying test results
class PVCacheTestResultsWidget extends StatelessWidget {
  final bool testsCompleted;
  final String? errorMessage;

  const PVCacheTestResultsWidget({
    super.key,
    this.testsCompleted = false,
    this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('PVCache Test Results'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              testsCompleted && errorMessage == null
                  ? Icons.check_circle
                  : errorMessage != null
                  ? Icons.error
                  : Icons.hourglass_empty,
              color: testsCompleted && errorMessage == null
                  ? Colors.green
                  : errorMessage != null
                  ? Colors.red
                  : Colors.orange,
              size: 64,
            ),
            const SizedBox(height: 16),
            Text(
              testsCompleted && errorMessage == null
                  ? 'PVCache Tests Completed!'
                  : errorMessage != null
                  ? 'PVCache Tests Failed!'
                  : 'PVCache Tests Running...',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            if (errorMessage != null) ...[
              Text(
                'Error: $errorMessage',
                style: const TextStyle(fontSize: 16, color: Colors.red),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
            ],
            const Text(
              '✅ KV environment tested\n'
              '✅ Encrypted environment tested\n'
              '✅ Custom environments tested\n'
              '✅ Expiry functionality verified\n'
              '✅ env:key format working\n'
              '✅ LRU adapter demonstrated\n'
              '✅ LFU adapter demonstrated',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            const Text(
              'Check the console for detailed logs.\n'
              'Supports: kv:, encrypted:, and custom environments\n'
              'Includes: LRU and LFU cache adapters',
              style: TextStyle(fontSize: 14, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

/// Simple Flutter app to run PVCache tests
class PVCacheTestApp extends StatefulWidget {
  const PVCacheTestApp({super.key});

  @override
  State<PVCacheTestApp> createState() => _PVCacheTestAppState();
}

class _PVCacheTestAppState extends State<PVCacheTestApp> {
  bool _testsCompleted = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _runTests();
  }

  Future<void> _runTests() async {
    try {
      await PVCacheTestRunners.runInFlutterApp();
      setState(() {
        _testsCompleted = true;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PVCache Test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: PVCacheTestResultsWidget(
        testsCompleted: _testsCompleted,
        errorMessage: _errorMessage,
      ),
    );
  }
}
