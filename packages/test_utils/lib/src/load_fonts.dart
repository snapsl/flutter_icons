import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

/// Load font file
Future<void> loadFonts({
  required Map<String, IconData> iconMap,
  required String packageName,
}) async {
  for (final entry in iconMap.entries) {
    final fontData = Directory.current.path.contains('packages')
        ? rootBundle.load(entry.key)
        : _loadFromFileSystem('packages/$packageName/${entry.key}');

    final fontLoader = FontLoader(entry.value.fontFamily!)..addFont(fontData);
    await fontLoader.load();
  }
}

Future<ByteData> _loadFromFileSystem(String path) async {
  final bytes = await File(path).readAsBytes();
  return ByteData.view(bytes.buffer);
}
