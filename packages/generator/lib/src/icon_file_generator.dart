import 'dart:convert';
import 'dart:io';

import 'package:generator/src/utils.dart';
import 'package:mime/mime.dart';
import 'package:recase/recase.dart';
import 'package:xml/xml.dart';

/// Generator for icon files
class IconFileGenerator {
  final _buffer = StringBuffer();

  /// Add class definition to generated content
  void addClassDefinition({
    required String iconClassName,
    required String url,
  }) {
    _buffer.write('''
/// [$iconClassName] offers the [IconData] of [$url]
abstract final class $iconClassName {
''');
  }

  /// Add font config
  ///
  /// Uses input to generate the icon class members.
  ///
  /// - [file]: XML font file (must be ttx)
  /// - [iconDataClassName]: Matching IconData class name
  /// - [iconSvgPath]: Used to create icons in doc strings
  /// - [brand]: Brand name of the icon package
  /// - [filled]: boolean to fill doc string icon
  /// - [suffix]: optional suffix for generated class members
  void addFontConfigFile(
    File file, {
    required String iconDataClassName,
    required String iconSvgPath,
    required String brand,
    bool filled = false,
    String suffix = '',
  }) {
    final mimeType = lookupMimeType(file.path);

    // if (mimeType != 'ttx') {
    //   throw FormatException(
    //     'Invalid file type. Expected "ttx" but got "$mimeType"',
    //   );
    // }

    final iconsData = _readIcons(file);

    _createIconDataString(
      iconsData,
      iconDataClassName,
      iconSvgPath,
      suffix,
      brand,
      filled,
    );
  }

  /// Add generic imports
  ///
  /// This adds a generic import header to the generated file.
  void addImports() {
    _buffer.write("""
// ignore_for_file: constant_identifier_names
import 'package:flutter/widgets.dart';
// ignore: always_use_package_imports
import 'icon_data.dart';
""");
  }

  /// Build file
  ///
  /// call [writeToFile] to wirte generated content to file.
  void build() {
    _buffer.write('}');
  }

  /// Write file
  ///
  /// writes generated content to [file].
  void writeToFile(File file) {
    file.writeAsStringSync(_buffer.toString());
  }

  String _createEncodedIcon(String path, bool filled) {
    final file = File(path);

    if (!file.existsSync()) {
      throw Exception('could not find ${file.path}');
    }

    final document = XmlDocument.parse(file.readAsStringSync());

    document.rootElement
      ..setAttribute('height', '24')
      ..setAttribute('width', '24')
      ..setAttribute('xmlns', 'http://www.w3.org/2000/svg');

    !filled
        ? document.rootElement.setAttribute('stroke', 'gray')
        : document.rootElement.setAttribute('fill', 'gray');

    final base64Encoded = base64Encode(utf8.encode(document.toXmlString()));

    return '![Icon](data:image/svg+xml;base64,$base64Encoded)';
  }

  void _createIconDataString(
    Map<String, String> iconsData,
    String iconDataClassName,
    String iconSvgPath,
    String suffix,
    String brand,
    bool filled,
  ) {
    iconsData.forEach((String iconName, String iconUnicode) {
      final iconNameValidated = _validateVariableName(iconName);
      final name = ReCase(iconNameValidated).camelCase;

      final iconEncoded = _createEncodedIcon(
        '$iconSvgPath/$iconName.svg',
        filled,
      );
      if (suffix.isEmpty) {
        _buffer.write(
          '''
/// $iconEncoded
///
/// $brand icon named "$iconName".
static const IconData $name = $iconDataClassName($iconUnicode);
''',
        );
      } else {
        _buffer.write(
          '''
/// $iconEncoded
/// 
/// $brand icon named "$iconName".
static const IconData ${name}_$suffix = $iconDataClassName($iconUnicode);
''',
        );
      }
    });
  }

  /// read the icon data from the [file]
  Map<String, String> _readIcons(File file) {
    final content = file.readAsStringSync();
    final document = XmlDocument.parse(content);

    final icons = _xmlToIcons(document);
    return icons;
  }

  String _validateVariableName(String name) {
    var sanName = name;

    // adds 'icon' suffix to dart keywords
    if (dartKeywords.contains(sanName)) {
      sanName = '${sanName}_icon';
    }

    // adds 'n' before variables that start with a number
    if (sanName.startsWith(RegExp(r'\d'))) {
      sanName = 'n$sanName';
    }
    return sanName;
  }

  Map<String, String> _xmlToIcons(XmlDocument document) {
    final ttFont = document.getElement('ttFont');
    final cmap = ttFont?.getElement('cmap');

    if (cmap == null) {
      throw const FormatException('Could not parse XML');
    }

    final relevantChild = cmap.children.firstWhere(
      (xmlNode) =>
          xmlNode.getAttribute('platformID') == '0' &&
          xmlNode.getAttribute('platEncID') == '3' &&
          xmlNode.getAttribute('language') == '0',
      orElse: () =>
          throw const FormatException('Required cmap table not found.'),
    );

    final mapList = relevantChild.children.whereType<XmlElement>().toList();

    final icons = Map<String, String>.fromEntries(
      mapList.map((XmlElement e) {
        final code = e.attributes.first.value;
        final name = e.attributes.last.value;
        return MapEntry<String, String>(name, code);
      }),
    );

    return icons;
  }
}
