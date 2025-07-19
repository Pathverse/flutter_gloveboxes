/// Custom loaders for web content (HTML, CSS, JavaScript)
library;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Load and process web content
Future<WebContent> loadWebContent(String assetPath) async {
  debugPrint('🌐 Loading web content: $assetPath');

  try {
    final String content = await rootBundle.loadString(assetPath);
    final extension = assetPath.split('.').last.toLowerCase();

    return WebContent(
      path: assetPath,
      content: content,
      type: _getWebContentType(extension),
      processedContent: _processWebContent(content, extension),
    );
  } catch (e) {
    debugPrint('❌ Failed to load web content: $assetPath - $e');
    rethrow;
  }
}

/// Load minified CSS
Future<String> loadMinifiedCSS(String assetPath) async {
  debugPrint('🎨 Loading minified CSS: $assetPath');

  final content = await rootBundle.loadString(assetPath);
  // Simple minification (remove extra whitespace and comments)
  return content
      .replaceAll(RegExp(r'/\*.*?\*/', dotAll: true), '')
      .replaceAll(RegExp(r'\s+'), ' ')
      .trim();
}

/// Load and validate JavaScript
Future<JavaScriptModule> loadJavaScript(String assetPath) async {
  debugPrint('⚡ Loading JavaScript module: $assetPath');

  final content = await rootBundle.loadString(assetPath);

  return JavaScriptModule(
    path: assetPath,
    content: content,
    isValid: _validateJavaScript(content),
    dependencies: _extractDependencies(content),
  );
}

WebContentType _getWebContentType(String extension) {
  switch (extension) {
    case 'html':
    case 'htm':
      return WebContentType.html;
    case 'css':
      return WebContentType.css;
    case 'js':
    case 'mjs':
      return WebContentType.javascript;
    default:
      return WebContentType.unknown;
  }
}

String _processWebContent(String content, String extension) {
  switch (extension) {
    case 'html':
      return _processHTML(content);
    case 'css':
      return _processCSS(content);
    case 'js':
      return _processJavaScript(content);
    default:
      return content;
  }
}

String _processHTML(String html) {
  // Add meta viewport and base styles for mobile
  if (!html.contains('<meta name="viewport"')) {
    html = html.replaceFirst(
      '<head>',
      '<head>\n  <meta name="viewport" content="width=device-width, initial-scale=1.0">',
    );
  }
  return html;
}

String _processCSS(String css) {
  // Add vendor prefixes for common properties
  if (css.contains('transform:')) {
    css = css.replaceAll('transform:', '-webkit-transform: transform:');
  }
  return css;
}

String _processJavaScript(String js) {
  // Add 'use strict' if not present
  if (!js.trim().startsWith("'use strict'") &&
      !js.trim().startsWith('"use strict"')) {
    js = "'use strict';\n$js";
  }
  return js;
}

bool _validateJavaScript(String js) {
  // Basic validation - check for balanced braces
  int braceCount = 0;
  for (final char in js.split('')) {
    if (char == '{') braceCount++;
    if (char == '}') braceCount--;
  }
  return braceCount == 0;
}

List<String> _extractDependencies(String js) {
  final dependencies = <String>[];

  // Simple dependency extraction for demo purposes
  final lines = js.split('\n');
  for (final line in lines) {
    if (line.contains('import') && line.contains('from')) {
      // Extract basic import statements
      final parts = line.split("'");
      if (parts.length >= 2) {
        dependencies.add(parts[1]);
      }
    }
    if (line.contains('require(')) {
      // Extract require statements
      final start = line.indexOf("'");
      final end = line.indexOf("'", start + 1);
      if (start != -1 && end != -1) {
        dependencies.add(line.substring(start + 1, end));
      }
    }
  }

  return dependencies;
}

/// Represents web content with metadata
class WebContent {
  final String path;
  final String content;
  final WebContentType type;
  final String processedContent;

  const WebContent({
    required this.path,
    required this.content,
    required this.type,
    required this.processedContent,
  });

  @override
  String toString() => 'WebContent(path: $path, type: $type)';
}

/// JavaScript module with validation and dependencies
class JavaScriptModule {
  final String path;
  final String content;
  final bool isValid;
  final List<String> dependencies;

  const JavaScriptModule({
    required this.path,
    required this.content,
    required this.isValid,
    required this.dependencies,
  });

  @override
  String toString() =>
      'JavaScriptModule(path: $path, valid: $isValid, deps: ${dependencies.length})';
}

enum WebContentType { html, css, javascript, unknown }
