import 'package:get/get.dart';

import '../../message/validation.dart';

class PasswordValidator {
  final int minLength;
  final bool requireNumbers;
  final bool requireSpecialChar;
  final bool requireCapitalLetter;

  PasswordValidator({
    this.minLength = 8,
    this.requireNumbers = false,
    this.requireSpecialChar = false,
    this.requireCapitalLetter = false,
  });

  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return ValidationMessage.REQUIRED.trParams({"fieldName": "password"});
    }

    // Minimum length validation
    if (value.length < minLength) {
      return ValidationMessage.PASSMIN.trParams({"char": minLength.toString()});
    }

    // Number validation
    if (requireNumbers) {
      final hasNumber = RegExp(r'[0-9]').hasMatch(value);
      if (!hasNumber) {
        return ValidationMessage.PASSNUM.tr;
      }
    }

    // Special character validation
    if (requireSpecialChar) {
      final hasSpecialChar = RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value);
      if (!hasSpecialChar) {
        return ValidationMessage.PASSCHAR.tr;
      }
    }

    // Capital letter validation
    if (requireCapitalLetter) {
      final hasCapitalLetter = RegExp(r'[A-Z]').hasMatch(value);
      if (!hasCapitalLetter) {
        return ValidationMessage.PASSCAPITAL.tr;
      }
    }

    return null;
  }
}
