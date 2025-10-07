import 'package:flutter/material.dart';

class MultiTranslationProvider extends StatelessWidget {
  final Widget child;
  final List<Widget Function(Widget child)> providers;

  const MultiTranslationProvider({
    super.key,
    required this.child,
    required this.providers,
  });

  @override
  Widget build(BuildContext context) {
    return providers.fold<Widget>(
      child,
      (Widget current, Widget Function(Widget) provider) => provider(current),
    );
  }
}

