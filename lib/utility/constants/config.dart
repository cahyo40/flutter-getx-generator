import 'dart:io';

import '../../widgets/snackbar.dart';
import 'theme.dart';

class AppConfig {
  AppConfig._();

  static String name = "";
  static String version = "";

  static Fonts fontsFamily = Fonts.FIGTREE;
  static const SnackbarType snackbarType = SnackbarType.FLOATING;
  static const TextFieldType inputType = TextFieldType.OUTLINED;

  static Directory directory = Directory("");
}
