import 'package:get/get.dart';

class InputValidation {
  static String? email(String value) {
    if (value.isEmpty) {
      return "email cannot be emapty";
    }
    if (!GetUtils.isEmail(value)) {
      return "Invalid format email";
    }
    return null;
  }

  static String? requiredField(String value, String fieldName) {
    if (value.isEmpty) {
      return "$fieldName cannot be emapty";
    }
    return null;
  }

  static String? dropdown(String value, String fieldName) {
    if (value.isEmpty) {
      return "Please choose $fieldName";
    }
    return null;
  }

  String? phone(String? value) {
    // Menghapus spasi dan karakter non-digit
    String cleanNumber = value!.replaceAll(RegExp(r'\s+'), '');

    // Regular expression untuk nomor telepon Indonesia
    // Format: +62 atau 0 diikuti 8-13 digit
    final RegExp phoneRegex = RegExp(r'^(?:\+62|62|0)[2-9][0-9]{7,11}$');

    if (!phoneRegex.hasMatch(cleanNumber)) {
      return 'Invalid format phone';
    }

    return null; // Return null jika validasi berhasil
  }
}
