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
            size: FontSize.x2l,
          ),
          elevation: .25,
          titleTextStyle: AppThemes.appFonts().titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.text,
              ),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
        ),
        textTheme: AppThemes.appFonts(),
        inputDecorationTheme: AppThemes.appInputDecoration(),
        elevatedButtonTheme: AppButtonStyle.filled,
        outlinedButtonTheme: AppButtonStyle.outlined,
      );
}
