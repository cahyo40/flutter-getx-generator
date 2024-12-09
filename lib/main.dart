import 'package:clean_arch/widgets/loading.dart';

import 'themes/button.dart';
import 'utility/constants/colors.dart';
import 'utility/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          centerTitle: true,
          iconTheme: IconThemeData(
            color: AppColors.white,
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
      ),
      home: Scaffold(
        body: SafeArea(
          child: AppLoading(
            message: "Mohon tunggu...",
          ),
        ),
      ),
    );
  }
}
