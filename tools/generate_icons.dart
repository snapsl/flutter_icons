import 'dart:io';

import 'package:args/args.dart';
import 'package:generator/generator.dart';

void main(List<String> arguments) {
  final parser = ArgParser()
    ..addOption(
      'iconset',
      allowed: [
        ...IconSet.values.map((e) => e.name),
      ],
      help: 'The icon set to generate',
      allowedHelp: {for (final e in IconSet.values) e.name: e.description},
      mandatory: true,
    );

  try {
    final results = parser.parse(arguments);
    final iconSet = IconSet.values.firstWhere(
      (element) => element.name == results.option('iconset'),
    );

    return switch (iconSet) {
      IconSet.antdesign => _generateAntDesign(),
      IconSet.bootstrap => _generateBootstrap(),
      IconSet.lucide => _generateLucide(),
      IconSet.simple => _generateSimple(),
      IconSet.tabler => _generateTabler(),
    };
  } catch (e) {
    if (e is! ArgumentError) rethrow;

    stdout
      ..writeln(e)
      ..writeln('Usage:\n${parser.usage}');
  }
}

void _generateAntDesign() {
  const fontsPath =
      './vendors/ant_design_icons/node_modules/@ant-design/icons-react-native';
  const iconsPath =
      './vendors/ant_design_icons/node_modules/@ant-design/icons-svg';

  final fontsConfigFile = File('$fontsPath/fonts/antfill.ttx');
  final fontsConfigFile2 = File('$fontsPath/fonts/antoutline.ttx');

  final outputFile = File(
    './packages/ant_design_icons/lib/src/icon_data.g.dart',
  );

  IconFileGenerator()
    ..addImports()
    ..addClassDefinition(
      iconClassName: 'AntDesignIcons',
      url: 'https://ant.design/components/icon',
    )
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

void _generateBootstrap() {
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

void _generateLucide() {
  const path = './vendors/lucide_icons/node_modules/lucide-static';

  final fontsConfigFile = File('$path/font/lucide.ttx');

  final outputFile = File('./packages/lucide_icons/lib/src/icon_data.g.dart');

  IconFileGenerator()
    ..addImports()
    ..addClassDefinition(
      iconClassName: 'LucideIcons',
      url: 'https://lucide.dev/icons',
    )
    ..addFontConfigFile(
      fontsConfigFile,
      brand: 'Lucide',
      iconSvgPath: '$path/icons',
      iconDataClassName: 'LucideIconData',
    )
    ..build()
    ..writeToFile(outputFile);
}

void _generateSimple() {
  const fontsPath = './vendors/simple_icons/node_modules/simple-icons-font';
  const iconsPath = './vendors/simple_icons/node_modules/simple-icons';

  final fontsConfigFile = File('$fontsPath/font/SimpleIcons.ttx');

  final outputFile = File('./packages/simple_icons/lib/src/icon_data.g.dart');

  IconFileGenerator()
    ..addImports()
    ..addClassDefinition(
      iconClassName: 'SimpleIcons',
      url: 'https://simpleicons.org',
    )
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

void _generateTabler() {
  const fontsPath = './vendors/tabler_icons/node_modules/@tabler/icons-webfont';
  const iconsPath = './vendors/tabler_icons/node_modules/@tabler/icons';

  final fontsConfigFile = File('$fontsPath/dist/fonts/tabler-icons.ttx');
  final fontsConfigFile2 = File(
    '$fontsPath/dist/fonts/tabler-icons-filled.ttx',
  );

  final outputFile = File('./packages/tabler_icons/lib/src/icon_data.g.dart');

  IconFileGenerator()
    ..addImports()
    ..addClassDefinition(
      iconClassName: 'TablerIcons',
      url: 'https://tabler.io/icons',
    )
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

enum IconSet {
  antdesign('Ant Design Icons'),
  bootstrap('Bootstrap Icons'),
  lucide('Lucide Icons'),
  simple('Simple Icons'),
  tabler('Tabler Icons')
  ;

  const IconSet(this.description);

  final String description;
}
