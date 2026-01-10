import 'dart:io';

import 'package:generator/generator.dart';

void main() {
  const fontsPath =
      './vendors/ant_design_icons/node_modules/@ant-design/icons-react-native';
  const iconsPath =
      './vendors/ant_design_icons/node_modules/@ant-design/icons-svg';

  final fontsConfigFile = File('$fontsPath/fonts/antfill.ttx');
  final fontsConfigFile2 = File('$fontsPath/fonts/antoutline.ttx');

  final outputFile = File(
    './packages/ant_design_icons/lib/src/icon_data.g.dart',
  );

  IconFileGenerator(
      iconClassName: 'AntDesignIcons',
      url: 'https://ant.design/components/icon',
    )
    ..addImports()
    ..addClass()
    ..addFontConfigFile(
      fontsConfigFile,
      brand: 'Ant Design',
      iconSvgPath: '$iconsPath/inline-svg/filled',
      iconDataClassName: 'AntDesignFilledIconData',
      filled: true,
      suffix: 'filled',
    )
    ..addFontConfigFile(
      fontsConfigFile2,
      brand: 'Ant Design',
      iconSvgPath: '$iconsPath/inline-svg/outlined',
      iconDataClassName: 'AntDesignOutlinedIconData',
      filled: true,
      suffix: 'outlined',
    )
    ..build()
    ..writeToFile(outputFile);
}
