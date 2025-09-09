library pv_assetbuilder;

// Configuration components
export 'src/config/signature_config.dart';
export 'src/config/config_parser.dart';

// Core components
export 'src/builders/asset_builder.dart';
export 'src/generators/asset_generator.dart';
export 'src/resolvers/method_resolver.dart';
export 'src/scanner/asset_scanner.dart';

// Builder factory for build_runner integration
import 'package:build/build.dart';
import 'src/builders/asset_builder.dart';

Builder pvAssetBuilder(BuilderOptions options) => AssetBuilder(options);
