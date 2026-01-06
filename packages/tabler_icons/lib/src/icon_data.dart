import 'package:flutter/widgets.dart';

/// Constructor for [IconData] which includes the font family
class TablerIconData extends IconData {
  /// Constructor for [IconData] which includes the font family
  const TablerIconData(super.codePoint)
    : super(fontFamily: 'TablerIcons', fontPackage: 'tabler_icons');
}

/// Constructor for [IconData] which includes the font family
class TablerIconFilledData extends IconData {
  /// Constructor for [IconData] which includes the font family
  const TablerIconFilledData(super.codePoint)
    : super(
        fontFamily: 'TablerIconsFilled',
        fontPackage: 'tabler_icons',
      );
}
