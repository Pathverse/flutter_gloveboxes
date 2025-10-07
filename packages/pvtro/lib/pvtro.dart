/// pvtro - Provider-based Translation Orchestrator
///
/// A Flutter package that automatically scans for slang translation providers
/// across all subpackages and merges them into a single provider tree.

// This file triggers pvtro_builder to generate unified language management
// The generated files will be created in lib/generated/

export 'provider.dart';
export 'cubit.dart';
export 'enums.dart';
export 'helper.dart';

// Export generated files when they exist
// Uncomment after running build_runner:
// export 'generated/pvtro_generated.dart';
