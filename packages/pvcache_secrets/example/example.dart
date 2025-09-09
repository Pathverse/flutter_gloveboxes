import 'package:pvcache/pvcache.dart';
import 'package:pvcache_secrets/pvcache_secrets.dart';
import 'package:flutter/material.dart';

void main() {
  PVCACHE.createEncrypted(env: "secure-cache");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'PVCache Secrets Demo', home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _result = 'No data yet';

  void _testCache() async {
    try {
      // Create cache with encrypted storage using the TopLv extension
      final cache = PVCache(env: "secure-cache");

      // Store some test data
      await cache.set('api_key', 'secret-api-key-12345');
      await cache.set('user_token', 'user-token-abcdef');

      // Retrieve the data
      final apiKey = await cache.get('api_key');
      final userToken = await cache.get('user_token');

      setState(() {
        _result = 'API Key: $apiKey\nUser Token: $userToken';
      });
    } catch (e) {
      setState(() {
        _result = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PVCache Secrets Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Encrypted Cache Test:'),
            SizedBox(height: 20),
            Text(_result),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _testCache,
              child: Text('Test Encrypted Cache'),
            ),
          ],
        ),
      ),
    );
  }
}
