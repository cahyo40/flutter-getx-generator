import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageHelpers {
  // Mengubah bahasa secara programmatik
  static changeLanguage(String langCode, String countryCode) {
    final locale = Get.locale != const Locale('id', 'ID')
        ? const Locale('id', 'ID')
        : const Locale('en', 'US');
    Get.updateLocale(locale);
  }
}
