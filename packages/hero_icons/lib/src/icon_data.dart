import 'package:flutter/widgets.dart';

/// Constructor for [IconData] which includes the font family
final class HeroOutlineIconData extends IconData {
  /// Constructor for [IconData] which includes the font family
  const HeroOutlineIconData(super.codePoint)
    : super(fontFamily: 'HeroOutlineIcons', fontPackage: 'hero_icons');
}

/// Constructor for [IconData] which includes the font family
final class HeroSolidIconData extends IconData {
  /// Constructor for [IconData] which includes the font family
  const HeroSolidIconData(super.codePoint)
    : super(fontFamily: 'HeroSolidIcons', fontPackage: 'hero_icons');
}
