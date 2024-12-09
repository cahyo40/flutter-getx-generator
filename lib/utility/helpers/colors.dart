import 'package:flutter/material.dart';

class AppColorHelpers {
  static Color hexToColor(String hex) {
    hex = hex.replaceAll('#', '');
    return Color(int.parse('FF$hex', radix: 16));
  }
}
