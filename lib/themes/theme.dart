import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app/config.dart';
import '../core/constants/enum.dart';
import 'textfield.dart';

class AppThemes {
  AppThemes._();

  static const double radius = 14.0;
  static const Duration duration = Duration(milliseconds: 1500);
  static TextTheme fonts() {
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
      case Fonts.PLAYFAIR_DISPLAY:
        return GoogleFonts.playfairDisplayTextTheme();
      case Fonts.LORA:
        return GoogleFonts.loraTextTheme();
      case Fonts.OSWALD:
        return GoogleFonts.oswaldTextTheme();
      case Fonts.BEBAS_NEUE:
        return GoogleFonts.bebasNeueTextTheme();
      case Fonts.QUESTRIAL:
        return GoogleFonts.questrialTextTheme();
      case Fonts.KANIT:
        return GoogleFonts.kanitTextTheme();

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

  static getLocale(AppLocale locale) {
    switch (locale) {
      case AppLocale.ID:
        return const Locale("id", "ID");
      case AppLocale.EN:
        return const Locale("en", "US");
    }
  }
}

class AppSize {
  static double spaceS = 8;
  static double spaceM = 16;
  static double spaceL = 24;
  static double spaceXl = 32;

  static double fontS = 12;
  static double fontM = 14;
  static double fontL = 16;
  static double fontXL = 18;
  static double font2XL = 24;
  static double font3Xl = 32;
}
