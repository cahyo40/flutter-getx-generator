import 'package:flutter/material.dart';

import '../utility/constants/colors.dart';
import '../utility/constants/theme.dart';
import 'button.dart';

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
