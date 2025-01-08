import 'package:flutter/material.dart';

class AppColorHelpers {
  static Color hexToColor(String hex) {
    hex = hex.replaceAll('#', '');
    return Color(int.parse('FF$hex', radix: 16));
  }

  static Color hslToColor(double hue, double saturation, double lightness) {
    return HSLColor.fromAHSL(1.0, hue, saturation, lightness).toColor();
  }
}
