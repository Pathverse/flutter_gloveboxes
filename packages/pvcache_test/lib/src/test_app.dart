// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:pvcache_test/src/pvcache_test_suite.dart';

/// Simple Flutter app to run PVCache tests on web
class PVCacheTestApp extends StatefulWidget {
  const PVCacheTestApp({super.key});

  @override
  State<PVCacheTestApp> createState() => _PVCacheTestAppState();
}

class _PVCacheTestAppState extends State<PVCacheTestApp> {
  bool _testsCompleted = false;
  String? _errorMessage;
  bool _testsStarted = false;

  @override
  void initState() {
    super.initState();
    // Don't auto-start tests, let user trigger them
  }

  Future<void> _runTests() async {
    setState(() {
      _testsStarted = true;
      _testsCompleted = false;
      _errorMessage = null;
    });

    try {
      await PVCacheTestSuite.runAllTests();
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
      title: 'PVCache Web Test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('PVCache Web Test'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  _testsCompleted && _errorMessage == null
                      ? Icons.check_circle
                      : _errorMessage != null
                      ? Icons.error
                      : _testsStarted
                      ? Icons.hourglass_empty
                      : Icons.play_circle,
                  color: _testsCompleted && _errorMessage == null
                      ? Colors.green
                      : _errorMessage != null
                      ? Colors.red
                      : _testsStarted
                      ? Colors.orange
                      : Colors.blue,
                  size: 64,
                ),
                const SizedBox(height: 16),
                Text(
                  _testsCompleted && _errorMessage == null
                      ? 'PVCache Tests Completed!'
                      : _errorMessage != null
                      ? 'PVCache Tests Failed!'
                      : _testsStarted
                      ? 'PVCache Tests Running...'
                      : 'Ready to Test PVCache',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                if (_errorMessage != null) ...[
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      border: Border.all(color: Colors.red.shade200),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Error: $_errorMessage',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.red.shade700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
                if (!_testsStarted || _testsCompleted) ...[
                  ElevatedButton.icon(
                    onPressed: _testsStarted && !_testsCompleted
                        ? null
                        : _runTests,
                    icon: const Icon(Icons.play_arrow),
                    label: Text(
                      _testsCompleted
                          ? 'Run Tests Again'
                          : 'Start PVCache Tests',
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 16,
                      ),
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
                if (_testsStarted) ...[
                  const Text(
                    'Test Coverage:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                ],
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    '✅ KV environment testing\n'
                    '✅ Encrypted environment testing\n'
                    '✅ Custom environments testing\n'
                    '✅ Expiry functionality verification\n'
                    '✅ env:key format validation\n'
                    '✅ LRU adapter demonstration\n'
                    '✅ LFU adapter demonstration\n'
                    '✅ Metadata management testing\n'
                    '✅ Delete operations testing',
                    style: TextStyle(fontSize: 14, height: 1.5),
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  '📱 Check the browser console for detailed test logs\n'
                  '🌐 Optimized for web testing environment\n'
                  '🔧 Tests: kv:, encrypted:, and custom environments\n'
                  '🧠 Includes: LRU and LFU cache adapters',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
