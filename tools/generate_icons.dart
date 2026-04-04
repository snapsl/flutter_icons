import 'dart:convert';
import 'dart:io';

import 'package:args/args.dart';
import 'package:generator/generator.dart';

import 'src/icon_set.dart';

void main(List<String> arguments) {
  final parser = ArgParser()
    ..addOption(
      'iconset',
      help: 'The icon set ID to generate',
      mandatory: true,
    )
    ..addOption(
      'matrix',
      help: 'Path to the icon set matrix JSON file',
      defaultsTo: '.github/matrix/icon_set_matrix.json',
    );

  try {
    final results = parser.parse(arguments);
    final iconSetId = results.option('iconset')!;
    final matrixPath = results.option('matrix')!;

    final matrixFile = File(matrixPath);

    if (!matrixFile.existsSync()) {
      throw FileSystemException('Matrix file not found', matrixPath);
    }

    final matrixJson =
        jsonDecode(matrixFile.readAsStringSync()) as List<dynamic>;

    final matrix = matrixJson
        .map((e) => IconSet.fromJson(e as Map<String, dynamic>))
        .toList();

    final iconSet = matrix.firstWhere(
      (element) => element.id == iconSetId,
      orElse: () =>
          throw ArgumentError('Icon set ID "$iconSetId" not found in matrix'),
    );

    _generate(iconSet);
  } catch (e) {
    if (e is ArgumentError || e is FileSystemException) {
      stderr.writeln(e);
      stdout.writeln('\nUsage:\n${parser.usage}');
      exit(1);
    }
    rethrow;
  }
}

void _generate(IconSet iconSet) {
  final packagePath = '${iconSet.packagePath}/${iconSet.packageName}';
  final vendorPath = '${iconSet.vendorPath}/${iconSet.packageName}';
  final outputFile = File('$packagePath/${iconSet.outputPath}');

  final generator = IconFileGenerator()
    ..addImports()
    ..addClassDefinition(iconClassName: iconSet.className, url: iconSet.url);

  for (final font in iconSet.fonts) {
    final ttxFileName = font.file.replaceAll('.ttf', '.ttx');
    final ttxFile = File('$vendorPath/${font.fontPath}/$ttxFileName');

    if (!ttxFile.existsSync()) {
      throw FileSystemException('TTX file not found', ttxFile.path);
    }

    generator.addFontConfigFile(
      ttxFile,
      brand: iconSet.brand,
      iconSvgPath: '$vendorPath/${font.svgPath}',
      fontFamily: font.fontFamily,
      fontPackage: iconSet.packageName,
      suffix: font.suffix,
    );
  }

  generator
    ..addValues()
    ..build()
    ..writeToFile(outputFile);
}
