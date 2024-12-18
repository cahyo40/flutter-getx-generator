import 'dart:io';

import '../../widgets/snackbar.dart';
import '../utility/constants/datasources/env.dart';
import '../utility/constants/enum.dart';

class AppConfig {
  AppConfig._();

  static String name = "";
  static String version = "";
//Rest API
  static String baseUrl = Env.setEnv(Environment.dev);
  static String baseUrlDev = "";
  static String baseUrlProd = "";

  /// Fonts
  /// { JAKARTA_SANS, ROBOTO, FIGTREE, NUNITO }
  static Fonts fontsFamily = Fonts.JAKARTA_SANS;
  // Snackbar Type
  static const SnackbarType snackbarType = SnackbarType.DOCK;
  // TextField Type
  static const TextFieldType inputType = TextFieldType.OUTLINED;
// Directory
  static Directory directory = Directory("");
// Locale Apps
  static AppLocale appLocale = AppLocale.ID;
// Assets
  static String imageAssets({required String image}) => "/$image";
  static String jsonAssets({required String json}) => "/$json";
}
