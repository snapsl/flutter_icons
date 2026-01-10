import 'dart:io';

import 'package:generator/generator.dart';

// TODO npm has woff file. need conversion to ttf

void main() {
  const path = './vendors/bootstrap_icons/node_modules/bootstrap-icons';

  final fontsConfigFile = File('$path/font/fonts/bootstrap-icons.ttx');

  final outputFile = File(
    './packages/bootstrap_icons/lib/src/icon_data.g.dart',
  );

  IconFileGenerator()
    ..addImports()
    ..addClassDefinition(
      iconClassName: 'BootstrapIcons',
      url: 'https://icons.getbootstrap.com',
    )
    ..addFontConfigFile(
      fontsConfigFile,
      brand: 'Bootstrap',
      iconSvgPath: '$path/icons',
      iconDataClassName: 'BootstrapIconData',
      filled: true,
    )
    ..build()
    ..writeToFile(outputFile);
}
