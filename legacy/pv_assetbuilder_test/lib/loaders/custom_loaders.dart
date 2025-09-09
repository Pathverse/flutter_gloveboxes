/// Custom image loaders with programmatic generation
library;

import 'dart:math';
import 'package:flutter/material.dart';

/// Generate beautiful placeholder images instead of loading files
Widget loadCachedImage(String assetPath) {
  debugPrint('🎨 Generating custom image for: $assetPath');

  return CustomPlaceholderImage(assetPath: assetPath, width: 200, height: 150);
}

/// Generate high-resolution placeholder images
Widget loadHighResImage(String assetPath) {
  debugPrint('🔍 Generating high-res image for: $assetPath');

  return CustomPlaceholderImage(
    assetPath: assetPath,
    width: 400,
    height: 300,
    isHighRes: true,
  );
}

/// Custom placeholder image widget that generates beautiful images
class CustomPlaceholderImage extends StatelessWidget {
  final String assetPath;
  final double width;
  final double height;
  final bool isHighRes;

  const CustomPlaceholderImage({
    super.key,
    required this.assetPath,
    this.width = 200,
    this.height = 150,
    this.isHighRes = false,
  });

  @override
  Widget build(BuildContext context) {
    final fileName = assetPath.split('/').last.replaceAll('.png', '');
    final colors = _generateColorsFromPath(assetPath);

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colors,
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colors.first.withOpacity(0.3), width: 2),
        boxShadow: [
          BoxShadow(
            color: colors.first.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Background pattern
          Positioned.fill(
            child: CustomPaint(
              painter: PatternPainter(colors.first.withOpacity(0.1)),
            ),
          ),
          // Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  _getIconFromPath(assetPath),
                  size: isHighRes ? 80 : 48,
                  color: Colors.white,
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    fileName.toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isHighRes ? 16 : 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'CUSTOM LOADED',
                    style: TextStyle(
                      color: colors.first,
                      fontSize: isHighRes ? 12 : 8,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (isHighRes) ...[
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.amber.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'HIGH-RES',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          // Loading signature indicator
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.check_circle,
                size: 16,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Color> _generateColorsFromPath(String path) {
    final hash = path.hashCode.abs();
    final random = Random(hash);

    final hue = random.nextDouble() * 360;
    final saturation = 0.6 + (random.nextDouble() * 0.4);
    final lightness1 = 0.4 + (random.nextDouble() * 0.2);
    final lightness2 = 0.6 + (random.nextDouble() * 0.3);

    return [
      HSLColor.fromAHSL(1.0, hue, saturation, lightness1).toColor(),
      HSLColor.fromAHSL(1.0, hue + 30, saturation, lightness2).toColor(),
    ];
  }

  IconData _getIconFromPath(String path) {
    if (path.contains('logo')) return Icons.business;
    if (path.contains('icon')) return Icons.apps;
    if (path.contains('avatar')) return Icons.person;
    if (path.contains('banner')) return Icons.photo_size_select_actual;
    if (path.contains('thumb')) return Icons.photo_size_select_small;
    return Icons.image;
  }
}

/// Custom painter for background patterns
class PatternPainter extends CustomPainter {
  final Color color;

  PatternPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    const spacing = 20.0;

    for (double x = 0; x < size.width; x += spacing) {
      for (double y = 0; y < size.height; y += spacing) {
        canvas.drawCircle(Offset(x, y), 2, paint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

/// Generate themed placeholder for specific asset types
Widget generateThemedPlaceholder(String assetPath, {String? theme}) {
  debugPrint('🎭 Generating themed placeholder: $assetPath (theme: $theme)');

  return CustomPlaceholderImage(assetPath: assetPath, width: 300, height: 200);
}
