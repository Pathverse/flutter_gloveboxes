import 'package:flutter/material.dart';
import 'package:pvcache/pvcache.dart';
import 'package:pvcache/templates/adapters/expiry.dart';
import 'package:pvcache_hive/pvcache_hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PVCache Network Image Demo',
      theme: ThemeData(primarySwatch: Colors.green, useMaterial3: true),
      home: const NetworkImageDemo(),
    );
  }
}

class NetworkImageDemo extends StatefulWidget {
  const NetworkImageDemo({super.key});

  @override
  State<NetworkImageDemo> createState() => _NetworkImageDemoState();
}

class _NetworkImageDemoState extends State<NetworkImageDemo> {
  late PVCache imageCache;
  Image? _networkImage;
  String _results = 'Ready to test network image caching...';
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _initializeCache();
    _loadNetworkImage();
  }

  void _initializeCache() {
    imageCache = PVCACHE.createStdHive(
      env: "image_cache",
      metaboxName: "image_meta",
      adapters: [ExpiryAdapter()],
    );
    _log('✅ Image cache initialized successfully!');
  }

  void _log(String message) {
    setState(() {
      _results = '$message\n\n$_results';
    });
  }

  Future<void> _setLoading(bool loading) async {
    setState(() {
      _isLoading = loading;
    });
  }

  Future<void> _loadNetworkImage() async {
    await _setLoading(true);
    try {
      const imageUrl =
          'https://fastly.picsum.photos/id/0/5000/3333.jpg?hmac=_j6ghY5fCfSD6tvtcV74zXivkJSPIfR9B8w34XeQmvU';
      _log('🌐 Loading network image: $imageUrl');

      final image = await imageCache.getNetworkImage(imageUrl);
      setState(() {
        _networkImage = image;
      });

      _log('✅ Network image loaded and cached successfully!');
    } catch (e) {
      _log('❌ Error loading network image: $e');
      rethrow; 
    } finally {
      await _setLoading(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PVCache Network Image Demo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (_isLoading) const LinearProgressIndicator(),
            const SizedBox(height: 16),

            // Display the network image
            if (_networkImage != null)
              Expanded(child: Center(child: _networkImage!))
            else
              const Expanded(
                child: Center(child: Text('No image loaded yet.')),
              ),

            const SizedBox(height: 16),

            // Results area
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade50,
              ),
              child: SingleChildScrollView(
                child: SelectableText(
                  _results,
                  style: const TextStyle(fontFamily: 'monospace', fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
