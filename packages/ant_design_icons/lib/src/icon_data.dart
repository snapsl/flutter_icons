import 'package:flutter/widgets.dart';

/// Constructor for [IconData] which includes the font family
class AntDesignFilledIconData extends IconData {
  /// Constructor for [IconData] which includes the font family
  const AntDesignFilledIconData(super.codePoint)
    : super(
        fontFamily: 'AntDesignFilledIcons',
        fontPackage: 'ant_design_icons',
      );
}

/// Constructor for [IconData] which includes the font family
class AntDesignOutlinedIconData extends IconData {
  /// Constructor for [IconData] which includes the font family
  const AntDesignOutlinedIconData(super.codePoint)
    : super(
        fontFamily: 'AntDesignOutlinedIcons',
        fontPackage: 'ant_design_icons',
      );
}
