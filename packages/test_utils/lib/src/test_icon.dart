// ignore_for_file: non_const_argument_for_const_parameter

import 'package:flutter/cupertino.dart';

/// A [StatelessWidget] that wraps an [Icon] widget for testing purposes.
class TestIcon extends StatelessWidget {
  /// Creates a [TestIcon] widget with the given [IconData].
  const TestIcon(this.icon, {super.key});

  /// The [IconData] instance representing the icon to be tested.
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Icon(
      IconData(icon.codePoint, fontFamily: icon.fontFamily),
      size: 240,
    );
  }
}
