import 'package:flutter/material.dart';

/// include the styling for the bottom bar
class BottomBarConfig {
  /// the color for the active card
  final Color activeCardColor;

  /// color of the icons
  final Color iconsColor;

  /// color of the active icons
  final Color activeIconColor;

  // styling of text
  final TextStyle textStyle;

  BottomBarConfig({
    required this.activeCardColor,
    required this.iconsColor,
    required this.textStyle,
    required this.activeIconColor,
  });
}
