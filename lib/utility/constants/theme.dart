import 'config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../themes/textfield.dart';

class AppThemes {
  AppThemes._();

  static const double radius = 14.0;
  static const Duration duration = Duration(milliseconds: 1500);
  static EdgeInsets paddingAll = const EdgeInsets.all(24);
  static TextTheme appFonts() {
    Fonts fonts = AppConfig.fontsFamily;
    switch (fonts) {
      case Fonts.FIGTREE:
        return GoogleFonts.figtreeTextTheme();
      case Fonts.ROBOTO:
        return GoogleFonts.robotoTextTheme();
      case Fonts.NUNITO:
        return GoogleFonts.nunitoTextTheme();
      case Fonts.JAKARTA_SANS:
        return GoogleFonts.plusJakartaSansTextTheme();

      default:
        return GoogleFonts.poppinsTextTheme();
    }
  }

  static InputDecorationTheme appInputDecoration() {
    TextFieldType type = AppConfig.inputType;
    if (type == TextFieldType.UNDERLINE) {
      return AppInputDecoration.underline();
    } else {
      return AppInputDecoration.outlined();
    }
  }
}

class FontSize {
  static double xs = 12;
  static double sm = 14;
  static double base = 16;
  static double lg = 18;
  static double xl = 20;
  static double x2l = 24;
  static double x3l = 30;
  static double x4l = 36;
}

class AppSize {
  /// 8
  static double small = 8;

  /// 16
  static double medium = 16;

  /// 24
  static double large = 24;
  //// custom params [double]
  static double custom(double size) => size;
}

enum Fonts { JAKARTA_SANS, ROBOTO, FIGTREE, NUNITO }

enum TextFieldType { OUTLINED, UNDERLINE }

enum ButtonType { OUTLINE, FILL }

enum ButtonColor { PRIMARY, INFO, WARNING, SUCCESS, ERROR }
