import 'dart:io';

import 'package:generator/generator.dart';

void main() {
  const fontsPath = './vendors/tabler_icons/node_modules/@tabler/icons-webfont';
  const iconsPath = './vendors/tabler_icons/node_modules/@tabler/icons';

  final fontsConfigFile = File('$fontsPath/dist/fonts/tabler-icons.ttx');
  final fontsConfigFile2 = File(
    '$fontsPath/dist/fonts/tabler-icons-filled.ttx',
  );

  final outputFile = File('./packages/tabler_icons/lib/src/icon_data.g.dart');

  IconFileGenerator(
      iconClassName: 'TablerIcons',
      url: 'https://tabler.io/icons',
    )
    ..addImports()
    ..addClass()
    ..addFontConfigFile(
      fontsConfigFile,
      iconSvgPath: '$iconsPath/icons/outline/',
      brand: 'Tabler',
      iconDataClassName: 'TablerIconData',
    )
    ..addFontConfigFile(
      fontsConfigFile2,
      iconDataClassName: 'TablerFilledIconData',
      brand: 'Tabler',
      iconSvgPath: '$iconsPath/icons/filled/',
      filled: true,
      suffix: 'filled',
    )
    ..build()
    ..writeToFile(outputFile);
}
