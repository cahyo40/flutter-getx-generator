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
      return 'Password cannot be empty';
    }

    // Minimum length validation
    if (value.length < minLength) {
      return 'Password must be at least $minLength characters';
    }

    // Number validation
    if (requireNumbers) {
      final hasNumber = RegExp(r'[0-9]').hasMatch(value);
      if (!hasNumber) {
        return 'Password must contain at least 1 number';
      }
    }

    // Special character validation
    if (requireSpecialChar) {
      final hasSpecialChar = RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value);
      if (!hasSpecialChar) {
        return 'Password must contain at least 1 special character';
      }
    }

    // Capital letter validation
    if (requireCapitalLetter) {
      final hasCapitalLetter = RegExp(r'[A-Z]').hasMatch(value);
      if (!hasCapitalLetter) {
        return 'Password must contain at least 1 capital letter';
      }
    }

    return null;
  }
}
