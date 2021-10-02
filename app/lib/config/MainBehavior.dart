import 'package:flutter/material.dart';

///
/// Class to remove scroll blow, use in main.dart
///
class MainBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}