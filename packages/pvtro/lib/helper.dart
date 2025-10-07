import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'provider.dart';
import 'cubit.dart';

/// Helper function to create a complete pvtro setup with all necessary providers
/// This wraps the LocaleCubit and any additional translation providers
Widget createPvtroApp<T extends Enum>({
  required Widget child,
  required LocaleCubit<T> localeCubit,
  List<Widget Function(Widget child)> additionalProviders = const [],
}) {
  return MultiTranslationProvider(
    providers: [
      // Always include the LocaleCubit provider with explicit type
      (child) => BlocProvider<LocaleCubit<T>>(
        create: (_) => localeCubit,
        child: child,
      ),
      // Add any additional providers (like slang TranslationProviders)
      ...additionalProviders,
    ],
    child: child,
  );
}

/// Helper function to create slang TranslationProvider wrapper
/// This is a convenience function to wrap individual slang TranslationProviders
Widget Function(Widget child) createSlangProvider(
  Widget Function({required Widget child}) providerBuilder,
) {
  return (child) => providerBuilder(child: child);
}
