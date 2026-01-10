import 'package:flutter/widgets.dart';

/// Constructor for [IconData] which includes the font family
final class SimpleIconData extends IconData {
  /// Constructor for [IconData] which includes the font family
  const SimpleIconData(super.codePoint)
    : super(fontFamily: 'SimpleIcons', fontPackage: 'simple_icons');
}
