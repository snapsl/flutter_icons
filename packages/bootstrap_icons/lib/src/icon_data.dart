import 'package:flutter/widgets.dart';

/// Constructor for [IconData] which includes the font family
class BootstrapIconData extends IconData {
  /// Constructor for [IconData] which includes the font family
  const BootstrapIconData(super.codePoint)
    : super(fontFamily: 'BootstrapIcons', fontPackage: 'bootstrap_icons');
}
