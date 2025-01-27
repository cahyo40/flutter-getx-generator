import 'dart:io';

import '../core/constants/enum.dart';
import '../core/utility/functions/package_info.dart';
import '../widgets/snackbar_widget.dart';
import 'env.dart';

class AppConfig {
  AppConfig._();

  static String name = "Getx Generator";

  String _version = "";
  setVersion() async {
    _version = await AppPackageInfo().version();
    return _version;
  }

  String get version => setVersion();
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
  static String imageAssets({required String image}) => "assets/images/$image";
  static String jsonAssets({required String json}) => "assets/json/$json";
}
