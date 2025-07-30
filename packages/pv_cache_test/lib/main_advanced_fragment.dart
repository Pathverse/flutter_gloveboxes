import 'package:flutter/material.dart';
import 'advanced_fragment_example.dart';

void main() {
  runApp(const AdvancedFragmentApp());
}

class AdvancedFragmentApp extends StatelessWidget {
  const AdvancedFragmentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Advanced Fragment Cache Example',
      theme: ThemeData(primarySwatch: Colors.deepPurple, useMaterial3: true),
      home: const AdvancedFragmentExample(),
    );
  }
}
