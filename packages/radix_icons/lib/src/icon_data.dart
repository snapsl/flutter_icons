import 'package:flutter/widgets.dart';

/// Constructor for [IconData] which includes the font family
final class RadixIconData extends IconData {
  /// Constructor for [IconData] which includes the font family
  const RadixIconData(super.codePoint)
    : super(fontFamily: 'RadixIcons', fontPackage: 'radix_icons');
}
