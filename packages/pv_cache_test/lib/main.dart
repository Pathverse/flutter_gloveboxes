import 'package:flutter/material.dart';
import 'pv_cache_test.dart';

void main() {
  runApp(const PVCacheTestApp());
}

class PVCacheTestApp extends StatelessWidget {
  const PVCacheTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PV Cache Web Test',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const PVCacheWebTest(),
    );
  }
}
