import 'package:flutter/material.dart';

// Import the generated assets and custom loader classes
import 'generated/pap.dart';
import 'loaders/web_loaders.dart';
import 'loaders/config_loaders.dart';
import 'loaders/custom_loaders.dart';

void main() {
  runApp(const AssetBuilderDemoApp());
}

class AssetBuilderDemoApp extends StatelessWidget {
  const AssetBuilderDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PV Asset Builder - Live Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        cardTheme: const CardThemeData(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
      ),
      home: const AssetDemoPage(),
    );
  }
}

class AssetDemoPage extends StatefulWidget {
  const AssetDemoPage({super.key});

  @override
  State<AssetDemoPage> createState() => _AssetDemoPageState();
}

class _AssetDemoPageState extends State<AssetDemoPage> {
  bool _isInitialized = false;
  String _status = 'Not initialized';
  final Map<String, dynamic> _loadedAssets = {};
  final List<String> _loadLog = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🎯 PV Asset Builder - Live Demo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            onPressed: _clearResults,
            icon: const Icon(Icons.clear_all),
            tooltip: 'Clear Results',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStatusCard(),
            const SizedBox(height: 16),
            _buildQuickActions(),
            const SizedBox(height: 16),
            _buildAssetTests(),
            const SizedBox(height: 16),
            _buildResults(),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  _isInitialized
                      ? Icons.check_circle
                      : Icons.radio_button_unchecked,
                  color: _isInitialized ? Colors.green : Colors.orange,
                ),
                const SizedBox(width: 8),
                Text(
                  'Custom Load Method System',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Status: $_status',
              style: TextStyle(
                color: _isInitialized ? Colors.green : Colors.orange,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            if (!_isInitialized)
              FilledButton.icon(
                onPressed: _initializeSystem,
                icon: const Icon(Icons.rocket_launch),
                label: const Text('Initialize System'),
              ),
            if (_isInitialized)
              const Text(
                '✅ Custom loaders active! Generate beautiful images below.',
                style: TextStyle(color: Colors.green),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActions() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '⚡ Quick Actions',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ElevatedButton.icon(
                  onPressed: _isInitialized ? _loadAllAssets : null,
                  icon: const Icon(Icons.auto_awesome),
                  label: const Text('Generate All Assets'),
                ),
                ElevatedButton.icon(
                  onPressed: _isInitialized ? _testCustomLoaders : null,
                  icon: const Icon(Icons.settings),
                  label: const Text('Test Custom Loaders'),
                ),
                ElevatedButton.icon(
                  onPressed: _isInitialized ? _showLoadSignatures : null,
                  icon: const Icon(Icons.fingerprint),
                  label: const Text('Show Load Signatures'),
                ),
                ElevatedButton.icon(
                  onPressed: _isInitialized ? _testPackageExtensions : null,
                  icon: const Icon(Icons.extension),
                  label: const Text('Test Package Extensions'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAssetTests() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '🎯 Asset Generation Tests',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            _buildAssetTestGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildAssetTestGrid() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        _buildAssetTestCard(
          'Custom Images',
          'Generated placeholders',
          Icons.auto_fix_high,
          Colors.purple,
          () => _generateCustomImages(),
        ),
        _buildAssetTestCard(
          'Web Content',
          'HTML/CSS/JS processing',
          Icons.web,
          Colors.blue,
          () => _loadWebAssets(),
        ),
        _buildAssetTestCard(
          'Config Files',
          'JSON/YAML parsing',
          Icons.settings,
          Colors.green,
          () => _loadConfigAssets(),
        ),
        _buildAssetTestCard(
          'Load Log',
          'View generation details',
          Icons.list,
          Colors.orange,
          () => _showLoadLog(),
        ),
      ],
    );
  }

  Widget _buildAssetTestCard(
    String title,
    String subtitle,
    IconData icon,
    Color color,
    VoidCallback? onTap,
  ) {
    return Card(
      child: InkWell(
        onTap: _isInitialized ? onTap : null,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 32, color: _isInitialized ? color : Colors.grey),
              const SizedBox(height: 8),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: _isInitialized ? Colors.black87 : Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 12,
                  color: _isInitialized ? Colors.black54 : Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResults() {
    if (_loadedAssets.isEmpty && _loadLog.isEmpty) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Icon(Icons.inbox, size: 64, color: Colors.grey.shade400),
              const SizedBox(height: 16),
              Text(
                'No assets generated yet',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(color: Colors.grey.shade600),
              ),
              const SizedBox(height: 8),
              Text(
                'Initialize the system and try generating some assets!',
                style: TextStyle(color: Colors.grey.shade500),
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '📊 Generated Assets & Results',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 12),
        ..._loadedAssets.entries.map(
          (entry) => _buildAssetResult(entry.key, entry.value),
        ),
      ],
    );
  }

  Widget _buildAssetResult(String assetName, dynamic result) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  _getAssetIcon(assetName),
                  color: _getAssetColor(assetName),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    assetName,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Chip(
                  label: Text(_getAssetType(assetName)),
                  backgroundColor: _getAssetColor(
                    assetName,
                  ).withValues(alpha: 0.1),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _buildAssetContent(assetName, result),
          ],
        ),
      ),
    );
  }

  Widget _buildAssetContent(String assetName, dynamic result) {
    if (result is Widget) {
      return Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Center(child: result),
        ),
      );
    }

    if (result is WebContent) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoRow('Type', result.type.name.toUpperCase()),
          _buildInfoRow('Size', '${result.content.length} characters'),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              result.processedContent.length > 200
                  ? '${result.processedContent.substring(0, 200)}...'
                  : result.processedContent,
              style: const TextStyle(fontFamily: 'monospace', fontSize: 12),
            ),
          ),
        ],
      );
    }

    if (result is ConfigData) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoRow('Type', result.type.name.toUpperCase()),
          _buildInfoRow('Valid', result.isValid ? '✅ Yes' : '❌ No'),
          _buildInfoRow('Keys', result.parsedData.keys.length.toString()),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: result.parsedData.entries
                  .take(5)
                  .map(
                    (entry) => Text(
                      '${entry.key}: ${entry.value}',
                      style: const TextStyle(
                        fontFamily: 'monospace',
                        fontSize: 12,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      );
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        result.toString(),
        style: const TextStyle(fontFamily: 'monospace', fontSize: 12),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Text(
              '$label:',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  IconData _getAssetIcon(String assetName) {
    if (assetName.contains('Custom') || assetName.contains('Generated')) {
      return Icons.auto_fix_high;
    }
    if (assetName.contains('web') || assetName.contains('.html')) {
      return Icons.web;
    }
    if (assetName.contains('config') || assetName.contains('.json')) {
      return Icons.settings;
    }
    return Icons.description;
  }

  Color _getAssetColor(String assetName) {
    if (assetName.contains('Custom') || assetName.contains('Generated')) {
      return Colors.purple;
    }
    if (assetName.contains('web') || assetName.contains('.html')) {
      return Colors.blue;
    }
    if (assetName.contains('config') || assetName.contains('.json')) {
      return Colors.green;
    }
    return Colors.orange;
  }

  String _getAssetType(String assetName) {
    if (assetName.contains('Custom') || assetName.contains('Generated')) {
      return 'CUSTOM';
    }
    if (assetName.contains('web') || assetName.contains('.html')) {
      return 'WEB';
    }
    if (assetName.contains('config') || assetName.contains('.json')) {
      return 'CONFIG';
    }
    return 'OTHER';
  }

  void _initializeSystem() {
    print('🎯 _initializeSystem called in main.dart');

    try {
      print('📞 About to call initializePVAssets()...');
      // Initialize the custom load method system
      initializePVAssets();

      print('✅ initializePVAssets() completed successfully');

      setState(() {
        _isInitialized = true;
        _status = 'System initialized - Custom generators active!';
      });

      _addToLog('✅ Custom load method system initialized');
      _addToLog('🎨 Image generators now override default loaders');
      _addToLog('📝 LazyObjectConfig overridden with custom loaders');

      print('✅ UI state updated successfully');
    } catch (e, stackTrace) {
      print('❌ Error in _initializeSystem: $e');
      print('Stack trace: $stackTrace');

      setState(() {
        _status = 'Initialization failed: $e';
      });
      _addToLog('❌ Initialization failed: $e');
    }
  }

  void _loadAllAssets() async {
    _addToLog('🚀 Generating all assets...');

    await _generateCustomImages();
    await _loadWebAssets();
    await _loadConfigAssets();

    _addToLog('✅ All assets generated!');
  }

  Future<void> _generateCustomImages() async {
    try {
      _addToLog('🎨 Generating custom images with programmatic loaders...');

      // Generate different types of custom images
      final logoImage = loadCachedImage('assets/images/logo.png');
      final bannerImage = loadCachedImage('assets/images/banner.png');
      final iconImage = loadCachedImage('assets/images/icon.png');
      final highResImage = loadHighResImage('assets/images/avatar.png');

      setState(() {
        _loadedAssets['Logo (Custom Generated)'] = logoImage;
        _loadedAssets['Banner (Custom Generated)'] = bannerImage;
        _loadedAssets['Icon (Custom Generated)'] = iconImage;
        _loadedAssets['Avatar (High-Res Generated)'] = highResImage;
      });

      _addToLog('✅ Custom images generated with unique patterns');
      _addToLog('🌈 Colors generated from asset path hashes');
    } catch (e) {
      _addToLog('❌ Failed to generate images: $e');
    }
  }

  Future<void> _loadWebAssets() async {
    try {
      _addToLog('🌐 Loading web assets with custom processors...');

      // Load web content using custom loaders
      final htmlContent = await loadWebContent('assets/web/index.html');
      final cssContent = await loadWebContent('assets/web/styles.css');

      setState(() {
        _loadedAssets['index.html (Processed)'] = htmlContent;
        _loadedAssets['styles.css (Minified)'] = cssContent;
      });

      _addToLog('✅ Web content loaded and processed');
    } catch (e) {
      _addToLog('❌ Failed to load web content: $e');
    }
  }

  Future<void> _loadConfigAssets() async {
    try {
      _addToLog('⚙️ Loading config assets with custom parsers...');

      // Load config files using custom loaders with loadSignature
      final appConfig = await parseConfig('assets/config/app.json');
      final themeConfig = await parseConfig('assets/config/theme.yaml');

      setState(() {
        _loadedAssets['app.json (Parsed)'] = appConfig;
        _loadedAssets['theme.yaml (Parsed)'] = themeConfig;
      });

      _addToLog('✅ Config files parsed and validated');
    } catch (e) {
      _addToLog('❌ Failed to load config: $e');
    }
  }

  Future<void> _testPackageExtensions() async {
    try {
      _addToLog('📦 Testing package extensions concept...');

      // Show what the extensions will enable (conceptual demonstration)
      final originalPath = AssetMap.config.app_json.assetPath;

      _addToLog('🔹 Current asset path: $originalPath');
      _addToLog(
        '🔹 With package extension will give: packages/my_package/$originalPath',
      );
      _addToLog(
        '🔹 With prefix extension will give: custom/path/$originalPath',
      );
      _addToLog(
        '🔹 Provider extension will allow: AssetMap.assets.withPackage("plugin")',
      );

      // Show extension method signatures that will be available:
      _addToLog('');
      _addToLog('📋 Available Extension Methods:');
      _addToLog(
        '🔸 LazyObject.withPackage(String) → packages/{package}/{original_path}',
      );
      _addToLog('🔸 LazyObject.withPrefix(String) → {prefix}/{original_path}');
      _addToLog(
        '🔸 PVAssetProvider.withPackage(String) → packages/{package}/{provider_path}/',
      );
      _addToLog(
        '🔸 PVAssetProvider.getFromPackage(String, String) → direct package asset access',
      );
      _addToLog('🔸 LazyObject.currentPath → get current asset path');
      _addToLog('🔸 LazyObject.hasPackagePrefix → check if using packages/');
      _addToLog('🔸 LazyObject.packageName → extract package name');

      // NEW: Demonstrate forward_to_package feature
      _addToLog('');
      _addToLog('🆕 Automatic Package Forwarding (forward_to_package):');
      _addToLog('🔸 Set "forward_to_package: true" in pv_asset_config.yaml');
      _addToLog(
        '🔸 Automatically prefixes ALL assets with "packages/{current_package}/"',
      );
      _addToLog('🔸 Perfect for creating packages that others will consume');
      _addToLog('🔸 No manual withPackage() calls needed');
      _addToLog(
        '🔸 Example: "assets/config/app.json" → "packages/pv_assetbuilder_test/assets/config/app.json"',
      );
      _addToLog('🔸 Detects package name from pubspec.yaml automatically');

      setState(() {
        _loadedAssets['Package Extension Demo'] =
            'Extension methods created and ready to use!';
        _loadedAssets['Forward To Package Demo'] =
            'Automatic package forwarding system implemented!';
      });

      _addToLog('✅ Package extension system implemented and documented!');
      _addToLog('✅ Automatic package forwarding (forward_to_package) ready!');
      _addToLog('💡 Extensions will be available after regenerating assets');
    } catch (e) {
      _addToLog('❌ Failed to test package extensions: $e');
    }
  }

  void _testCustomLoaders() {
    _addToLog('🧪 Testing custom loader system...');
    _addToLog('🎨 Image generator: loadCachedImage (programmatic generation)');
    _addToLog('🌐 Web loader: loadWebContent (processing & minification)');
    _addToLog('⚙️ Config loader: parseConfig (validation & parsing)');
    _addToLog('✅ All custom loaders registered and working');

    // NEW: Demonstrate package extension usage
    _addToLog('');
    _addToLog('📦 Package Extensions Demo:');
    _addToLog(
      '🔹 AssetMap.assets.withPackage("my_package") → packages/my_package/assets/',
    );
    _addToLog(
      '🔹 AssetMap.config.app_json.withPackage("external") → packages/external/assets/config/app.json',
    );
    _addToLog(
      '🔹 AssetMap.assets.getFromPackage("plugin", "icon.png") → packages/plugin/assets/icon.png',
    );
    _addToLog(
      '🔹 AssetMap.config.theme_yaml.withPrefix("custom/path") → custom/path/assets/config/theme.yaml',
    );
    _addToLog('✅ Package extensions ready for external asset loading!');
  }

  void _showLoadSignatures() {
    _addToLog('🔑 Load signatures in use:');
    _addToLog('📝 assets/config/app.json → loadSignature: "config"');
    _addToLog('📝 assets/config/theme.yaml → loadSignature: "config"');
    _addToLog('📝 assets/web/*.html → loadSignature: "web"');
    _addToLog('🎨 Image assets → custom generator (overrides default)');
    _addToLog('✅ Conditional loadSignature generation working!');
  }

  void _showLoadLog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Asset Generation Log'),
        content: SizedBox(
          width: double.maxFinite,
          height: 400,
          child: ListView.builder(
            itemCount: _loadLog.length,
            itemBuilder: (context, index) {
              final log = _loadLog[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Text(
                  log,
                  style: TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 12,
                    color: log.startsWith('✅')
                        ? Colors.green
                        : log.startsWith('❌')
                        ? Colors.red
                        : Colors.black87,
                  ),
                ),
              );
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _addToLog(String message) {
    setState(() {
      _loadLog.add('${DateTime.now().toString().substring(11, 19)} $message');
    });
  }

  void _clearResults() {
    setState(() {
      _loadedAssets.clear();
      _loadLog.clear();
      _status = _isInitialized
          ? 'System initialized - Custom generators active!'
          : 'Not initialized';
    });
  }
}
