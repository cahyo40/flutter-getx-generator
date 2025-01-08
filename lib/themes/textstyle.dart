import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'colors.dart';
import 'theme.dart';

class AppTextStyle {
  static TextStyle heading({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return AppThemes.fonts().headlineMedium!.copyWith(
          fontSize: fontSize ?? Get.textTheme.headlineMedium!.fontSize,
          fontWeight: fontWeight ?? Get.textTheme.headlineMedium!.fontWeight,
          color: color ?? AppColors.text,
        );
  }

  static TextStyle body({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return AppThemes.fonts().bodyMedium!.copyWith(
          fontSize: fontSize ?? Get.textTheme.bodyMedium!.fontSize,
          fontWeight: fontWeight ?? Get.textTheme.bodyMedium!.fontWeight,
          color: color ?? AppColors.text,
        );
  }

  static TextStyle title({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return AppThemes.fonts().titleMedium!.copyWith(
          fontSize: fontSize ?? Get.textTheme.titleMedium!.fontSize,
          fontWeight: fontWeight ?? Get.textTheme.titleMedium!.fontWeight,
          color: color ?? AppColors.text,
        );
  }

  static TextStyle caption({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return AppThemes.fonts().labelMedium!.copyWith(
          fontSize: fontSize ?? Get.textTheme.labelMedium!.fontSize,
          fontWeight: fontWeight ?? Get.textTheme.labelMedium!.fontWeight,
          color: color ?? AppColors.text,
        );
  }
}
