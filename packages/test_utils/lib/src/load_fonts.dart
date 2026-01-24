import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

/// Load font file
Future<void> loadFonts(Map<String, IconData> fontMap) async {
  for (final entry in fontMap.entries) {
    final fontData = rootBundle.load(entry.key);
    final fontLoader = FontLoader(entry.value.fontFamily!)..addFont(fontData);
    await fontLoader.load();
  }
}
