import 'package:flutter/material.dart';

import '../utility/helpers/colors.dart';

class AppColors {
  AppColors._();

  static Color primary = AppColorHelpers.hslToColor(207, 90, 54);
  static Color secondary = const Color(0xFFd6ae91);
  static Color accent = const Color(0xFFaccc77);
  static Color background = const Color(0xFFf3f8fb);
  static Color text = const Color(0xFF030608);

  static Color warning = AppColorHelpers.hslToColor(43, 90, 54);
  static Color success = AppColorHelpers.hslToColor(112, 90, 54);
  static Color info = AppColorHelpers.hslToColor(198, 90, 54);
  static Color error = AppColorHelpers.hslToColor(344, 90, 54);

  static Color grey = Colors.grey;
  static Color black = const Color(0xff121212);
  static Color white = const Color(0xffeaeaea);
}
