import 'dart:io';

import 'package:generator/generator.dart';

void main() {
  const fontsPath = './vendors/simple_icons/node_modules/simple-icons-font';
  const iconsPath = './vendors/simple_icons/node_modules/simple-icons';

  final fontsConfigFile = File('$fontsPath/font/SimpleIcons.ttx');

  final outputFile = File('./packages/simple_icons/lib/src/icon_data.g.dart');

  IconFileGenerator(
      iconClassName: 'SimpleIcons',
      url: 'https://simpleicons.org',
    )
    ..addImports()
    ..addClass()
    ..addFontConfigFile(
      fontsConfigFile,
      brand: 'Simple',
      iconSvgPath: '$iconsPath/icons',
      iconDataClassName: 'SimpleIconData',
      filled: true,
    )
    ..build()
    ..writeToFile(outputFile);
}
