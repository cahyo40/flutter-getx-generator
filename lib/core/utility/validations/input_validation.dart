import 'package:get/get.dart';

import '../../message/validation.dart';

class InputValidation {
  static String? email(String value) {
    if (value.isEmpty) {
      return ValidationMessage.REQUIRED.trParams(
        {"fieldName": "email"},
      );
    }
    if (!GetUtils.isEmail(value)) {
      return ValidationMessage.EMAIL.tr;
    }
    return null;
  }

  static String? requiredField(String value, String fieldName) {
    if (value.isEmpty) {
      return ValidationMessage.REQUIRED.trParams(
        {"fieldName": fieldName},
      );
    }
    return null;
  }

  static String? dropdown(String value, String fieldName) {
    if (value.isEmpty) {
      return ValidationMessage.DROPDOWN.tr;
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
      return ValidationMessage.PHONE.tr;
    }

    return null; // Return null jika validasi berhasil
  }
}
