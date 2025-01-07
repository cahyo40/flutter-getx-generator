import 'package:flutter/material.dart';

import 'button.dart';
import 'colors.dart';
import 'theme.dart';

class AppThemeData {
  AppThemeData._();

  static ThemeData get theme => ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          iconTheme: IconThemeData(
            color: AppColors.black,
            size: AppSize.font2XL,
          ),
          elevation: .25,
          titleTextStyle: AppThemes.fonts().titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.text,
              ),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
        ),
        textTheme: AppThemes.fonts(),
        inputDecorationTheme: AppThemes.appInputDecoration(),
        elevatedButtonTheme: AppButtonStyle.filled,
        outlinedButtonTheme: AppButtonStyle.outlined,
      );
}
