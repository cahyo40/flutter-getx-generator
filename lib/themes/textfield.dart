import 'package:flutter/material.dart';

import 'colors.dart';
import 'theme.dart';

class AppInputDecoration {
  static InputDecorationTheme outlined() {
    return InputDecorationTheme(
      hintStyle: AppThemes.fonts().bodyMedium!.copyWith(
            fontSize: AppSize.fontM,
            color: AppColors.grey,
            fontWeight: FontWeight.w400,
          ),
      errorMaxLines: 2,
      prefixIconColor: AppColors.grey,
      suffixIconColor: AppColors.grey,
      labelStyle: AppThemes.fonts().bodyMedium!.copyWith(
            fontSize: AppSize.fontM,
            color: AppColors.text,
            fontWeight: FontWeight.w400,
          ),
      floatingLabelStyle: AppThemes.fonts().bodySmall!.copyWith(
            fontSize: AppSize.fontS,
            color: AppColors.text,
            fontWeight: FontWeight.w400,
          ),
      errorStyle: AppThemes.fonts().bodyMedium!.copyWith(
            fontSize: AppSize.fontM,
            color: AppColors.error,
            fontWeight: FontWeight.w400,
          ),
      border: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(AppThemes.radius),
        borderSide: BorderSide(
          color: AppColors.text,
          width: 1,
        ),
      ),
      focusedBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(AppThemes.radius),
        borderSide: BorderSide(
          color: AppColors.text,
          width: 1.5,
        ),
      ),
      disabledBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(AppThemes.radius),
        borderSide: BorderSide(
          color: AppColors.white,
          width: 1,
        ),
      ),
      enabledBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(AppThemes.radius),
        borderSide: BorderSide(
          color: AppColors.text,
          width: 1,
        ),
      ),
      errorBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(AppThemes.radius),
        borderSide: BorderSide(
          color: AppColors.error,
          width: 1,
        ),
      ),
      focusedErrorBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(AppThemes.radius),
        borderSide: BorderSide(
          color: AppColors.error,
          width: 1.5,
        ),
      ),
    );
  }

  static InputDecorationTheme underline() {
    return InputDecorationTheme(
      hintStyle: AppThemes.fonts().bodyMedium!.copyWith(
            fontSize: AppSize.fontM,
            color: AppColors.grey,
            fontWeight: FontWeight.w400,
          ),
      errorMaxLines: 2,
      prefixIconColor: AppColors.grey,
      suffixIconColor: AppColors.grey,
      labelStyle: AppThemes.fonts().bodyMedium!.copyWith(
            fontSize: AppSize.fontM,
            color: AppColors.text,
            fontWeight: FontWeight.w400,
          ),
      floatingLabelStyle: AppThemes.fonts().bodySmall!.copyWith(
            fontSize: AppSize.fontS,
            color: AppColors.text,
            fontWeight: FontWeight.w400,
          ),
      errorStyle: AppThemes.fonts().bodyMedium!.copyWith(
            fontSize: AppSize.fontM,
            color: AppColors.error,
            fontWeight: FontWeight.w400,
          ),
      border: const UnderlineInputBorder().copyWith(
        borderSide: BorderSide(
          color: AppColors.text,
          width: 1,
        ),
      ),
      focusedBorder: const UnderlineInputBorder().copyWith(
        borderSide: BorderSide(
          color: AppColors.text,
          width: 1.5,
        ),
      ),
      disabledBorder: const UnderlineInputBorder().copyWith(
        borderSide: BorderSide(
          color: AppColors.white,
          width: 1,
        ),
      ),
      enabledBorder: const UnderlineInputBorder().copyWith(
        borderSide: BorderSide(
          color: AppColors.text,
          width: 1,
        ),
      ),
      errorBorder: const UnderlineInputBorder().copyWith(
        borderSide: BorderSide(
          color: AppColors.error,
          width: 1,
        ),
      ),
      focusedErrorBorder: const UnderlineInputBorder().copyWith(
        borderSide: BorderSide(
          color: AppColors.error,
          width: 1.5,
        ),
      ),
    );
  }
}
