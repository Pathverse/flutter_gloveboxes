import 'package:pvcache/pvcache.dart';
import 'package:pvcache/templates/adapters/expiry.dart';
import 'package:pvcache_secrets/pvcache_secrets.dart';
import 'package:flutter/material.dart';

void main() {
  PVCACHE.createLimitedEncryptedWithMeta(
    env: "secure-expiry-cache",
    adapters: [ExpiryAdapter()],
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'PVCache Expiry Demo', home: MyHomePage());
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
      final cache = PVCache(env: "secure-expiry-cache");

      // Retrieve the data to check current state
      final tempToken = await cache.get('temp_token');
      final sessionKey = await cache.get('session_key');

      setState(() {
        _result =
            'Temp Token (10s TTL): ${tempToken ?? "EXPIRED"}\n'
            'Session Key (60s TTL): ${sessionKey ?? "EXPIRED"}\n\n'
            'Click "Set Data" to store new values with TTL';
      });
    } catch (e) {
      setState(() {
        _result = 'Error: $e';
      });
    }
  }

  void _setData() async {
    try {
      final cache = PVCache(env: "secure-expiry-cache");

      // Store data with TTL (expires in 10 seconds)
      await cache.set('temp_token', 'expires-in-10s', metadata: {"ttl": 10});

      // Store data with longer TTL (expires in 60 seconds)
      await cache.set('session_key', 'expires-in-60s', metadata: {"ttl": 60});

      setState(() {
        _result =
            'Data stored!\nTemp Token: expires-in-10s\nSession Key: expires-in-60s\n\nUse "Check Data" to test expiry';
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
      appBar: AppBar(title: Text('PVCache Expiry Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Encrypted Cache with TTL Test:'),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(_result, textAlign: TextAlign.center),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _setData,
              child: Text('Set Data (with TTL)'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _testCache,
              child: Text('Check Data (test expiry)'),
            ),
          ],
        ),
      ),
    );
  }
}
