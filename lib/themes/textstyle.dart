import 'package:flutter/material.dart';

import 'colors.dart';
import 'theme.dart';

class AppTextStyle {
  static TextStyle heading({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return AppThemes.fonts().headlineMedium!.copyWith(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color ?? AppColors.text,
        );
  }

  static TextStyle body({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return AppThemes.fonts().bodyMedium!.copyWith(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color ?? AppColors.text,
        );
  }

  static TextStyle title({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return AppThemes.fonts().titleMedium!.copyWith(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color ?? AppColors.text,
        );
  }

  static TextStyle caption({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return AppThemes.fonts().labelMedium!.copyWith(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color ?? AppColors.text,
        );
  }
}
