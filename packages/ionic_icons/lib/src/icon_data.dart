import 'package:flutter/widgets.dart';

/// Constructor for [IconData] which includes the font family
final class IonicIconData extends IconData {
  /// Constructor for [IconData] which includes the font family
  const IonicIconData(super.codePoint)
    : super(fontFamily: 'IonicIcons', fontPackage: 'ionic_icons');
}
