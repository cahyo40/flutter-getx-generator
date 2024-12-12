import 'dart:io';

import '../../widgets/snackbar.dart';
import '../utility/constants/datasources/env.dart';
import '../utility/constants/theme.dart';

class AppConfig {
  AppConfig._();

  static String name = "";
  static String version = "";

  static String baseUrl = Env.setEnv(Environment.dev);

  static Fonts fontsFamily = Fonts.JAKARTA_SANS;
  static const SnackbarType snackbarType = SnackbarType.DOCK;
  static const TextFieldType inputType = TextFieldType.OUTLINED;

  static Directory directory = Directory("");
}
