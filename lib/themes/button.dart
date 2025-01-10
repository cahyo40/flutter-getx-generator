import 'package:flutter/material.dart';

import '../core/constants/enum.dart';
import 'colors.dart';
import 'theme.dart';

class AppButtonStyle {
  AppButtonStyle._();

  static final filled = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 1,
      foregroundColor: AppColors.white,
      backgroundColor: AppColors.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppThemes.radius),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 24,
      ),
      textStyle: AppThemes.fonts().bodySmall?.copyWith(
            color: AppColors.text,
            fontWeight: FontWeight.w600,
          ),
      minimumSize: const Size(
        double.infinity,
        48,
      ),
      iconColor: AppColors.white,
      disabledIconColor: AppColors.grey,
      disabledBackgroundColor: AppColors.primary.withOpacity(.25),
      disabledForegroundColor: AppColors.white,
    ),
  );

  static final outlined = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      backgroundColor: AppColors.white,
      side: BorderSide(
        color: AppColors.primary,
        width: 1.5,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppThemes.radius),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 24,
      ),
      textStyle: AppThemes.fonts().bodySmall?.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.w600,
          ),
      iconColor: AppColors.primary,
      disabledIconColor: AppColors.grey,
      minimumSize: const Size(
        double.infinity,
        48,
      ),
      disabledBackgroundColor: AppColors.white,
      disabledForegroundColor: AppColors.white,
    ),
  );
}

Color getButtonColor(ButtonColor color) {
  switch (color) {
    case ButtonColor.PRIMARY:
      return AppColors.primary;
    case ButtonColor.ERROR:
      return AppColors.error;
    case ButtonColor.SUCCESS:
      return AppColors.success;
    case ButtonColor.INFO:
      return AppColors.info;
    case ButtonColor.WARNING:
      return AppColors.warning;
    default:
      return AppColors.primary;
  }
}
