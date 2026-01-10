import 'dart:io';

import 'package:generator/generator.dart';

void main() {
  const path = './vendors/lucide_icons/node_modules/lucide-static';

  final fontsConfigFile = File('$path/font/lucide.ttx');

  final outputFile = File('./packages/lucide_icons/lib/src/icon_data.g.dart');

  IconFileGenerator(
      iconClassName: 'LucideIcons',
      url: 'https://lucide.dev/icons',
    )
    ..addImports()
    ..addClass()
    ..addFontConfigFile(
      fontsConfigFile,
      brand: 'Lucide',
      iconSvgPath: '$path/icons',
      iconDataClassName: 'LucideIconData',
    )
    ..build()
    ..writeToFile(outputFile);
}
