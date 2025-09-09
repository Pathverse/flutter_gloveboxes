/// Configuration models for signature-based asset loading with custom methods
library;

/// Represents different ways to match assets to signatures
enum MatchStrategy { path, extension, custom }

/// Custom method reference in format "custom_file:custom_method"
class MethodReference {
  final String file;
  final String method;

  const MethodReference(this.file, this.method);

  /// Parse method reference from "custom_file:custom_method" format
  factory MethodReference.parse(String reference) {
    final parts = reference.split(':');
    if (parts.length != 2) {
      throw ArgumentError(
        'Invalid method reference format. Expected "file:method", got "$reference"',
      );
    }
    return MethodReference(parts[0], parts[1]);
  }

  @override
  String toString() => '$file:$method';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MethodReference &&
          runtimeType == other.runtimeType &&
          file == other.file &&
          method == other.method;

  @override
  int get hashCode => file.hashCode ^ method.hashCode;
}

/// Matching configuration for a signature
class MatchConfig {
  final String? pathPattern;
  final List<String>? extensions;
  final MethodReference? customMatcher;

  const MatchConfig({this.pathPattern, this.extensions, this.customMatcher});

  /// Validate that exactly one matching strategy is specified
  bool get isValid {
    final strategies = [
      pathPattern,
      extensions,
      customMatcher,
    ].where((s) => s != null).length;
    return strategies == 1;
  }

  MatchStrategy get strategy {
    if (pathPattern != null) return MatchStrategy.path;
    if (extensions != null) return MatchStrategy.extension;
    if (customMatcher != null) return MatchStrategy.custom;
    throw StateError('No matching strategy configured');
  }

  factory MatchConfig.fromYaml(Map<String, dynamic> yaml) {
    return MatchConfig(
      pathPattern: yaml['path'] as String?,
      extensions: (yaml['extension'] as List?)?.cast<String>(),
      customMatcher: yaml['custom'] != null
          ? MethodReference.parse(yaml['custom'] as String)
          : null,
    );
  }
}

/// Complete signature configuration
class SignatureConfig {
  final String name;
  final MethodReference? loader;
  final MatchConfig? matchConfig;

  const SignatureConfig({required this.name, this.loader, this.matchConfig});

  /// Whether this signature overrides a default one (has custom loader)
  bool get isOverride => loader != null && matchConfig == null;

  /// Whether this signature is completely custom (has both loader and matching)
  bool get isCustom => loader != null && matchConfig != null;

  /// Whether this signature uses default loading with custom matching
  bool get hasCustomMatching => loader == null && matchConfig != null;

  factory SignatureConfig.fromYaml(String name, dynamic yaml) {
    MethodReference? loader;
    MatchConfig? matchConfig;

    // Handle simple override format: "signature: custom_file:method"
    if (yaml is String) {
      loader = MethodReference.parse(yaml);
    } else if (yaml is Map<String, dynamic>) {
      // Handle complex format with loader and/or match_via
      if (yaml['custom_file'] != null) {
        // Simple format: custom_file: method_name
        loader = MethodReference(yaml['custom_file'], yaml.keys.first);
      } else if (yaml['loader'] != null) {
        // Explicit loader format
        loader = MethodReference.parse(yaml['loader'] as String);
      }

      if (yaml['match_via'] != null) {
        matchConfig = MatchConfig.fromYaml(
          yaml['match_via'] as Map<String, dynamic>,
        );
      }
    }

    return SignatureConfig(
      name: name,
      loader: loader,
      matchConfig: matchConfig,
    );
  }
}

/// Complete signature configuration collection
class SignatureConfigCollection {
  final Map<String, SignatureConfig> signatures;

  const SignatureConfigCollection(this.signatures);

  /// Get signature by name
  SignatureConfig? operator [](String name) => signatures[name];

  /// All signature names
  Iterable<String> get names => signatures.keys;

  /// All override signatures (replace defaults)
  Iterable<SignatureConfig> get overrides =>
      signatures.values.where((s) => s.isOverride);

  /// All custom signatures (new types)
  Iterable<SignatureConfig> get customs =>
      signatures.values.where((s) => s.isCustom);

  /// Check if any custom signatures are configured
  bool get hasCustomSignatures => signatures.isNotEmpty;

  factory SignatureConfigCollection.fromYaml(Map<String, dynamic>? yaml) {
    if (yaml == null) return const SignatureConfigCollection({});

    final signatures = <String, SignatureConfig>{};
    for (final entry in yaml.entries) {
      signatures[entry.key] = SignatureConfig.fromYaml(entry.key, entry.value);
    }

    return SignatureConfigCollection(signatures);
  }
}
