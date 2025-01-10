import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../controllers/obsecure_text_controller.dart';
import '../../themes/colors.dart';
import '../../themes/padding.dart';
import '../../themes/textstyle.dart';

/// Widget TextField kustom yang digunakan di seluruh aplikasi.
///
/// Widget ini menyediakan TextField yang sudah dikustomisasi dengan styling yang konsisten
/// dan dapat dikonfigurasi sesuai kebutuhan.
///
/// Contoh penggunaan:
/// ```dart
/// AppTextField(
///   controller: TextEditingController(),
///   labelText: 'Username',
///   hintText: 'Masukkan username',
///   validator: (value) {
///     if (value?.isEmpty ?? true) {
///       return 'Username tidak boleh kosong';
///     }
///     return null;
///   },
/// )
/// ```
class AppTextField extends StatelessWidget {
  /// Teks yang ditampilkan sebagai label field.
  final String labelText;

  /// Teks bantuan yang muncul ketika field kosong.
  ///
  /// Jika null, tidak akan menampilkan hint text.
  final String? hintText;

  /// Controller untuk mengelola dan mengakses nilai text field.
  final TextEditingController controller;

  /// Fungsi validator untuk memvalidasi input.
  ///
  /// Mengembalikan String berisi pesan error jika validasi gagal,
  /// atau null jika validasi berhasil.
  final String? Function(String?)? validator;

  /// Tipe keyboard yang akan ditampilkan.
  ///
  /// Contoh: TextInputType.number, TextInputType.email, dll.
  final TextInputType? textInputType;

  /// Jumlah maksimum baris yang dapat ditampilkan.
  ///
  /// Jika null, text field akan single line.
  final int? maxLines;

  /// Menentukan apakah field hanya bisa dibaca.
  ///
  /// Default: false
  final bool? readOnly;

  /// Menentukan apakah field bisa diinteraksi.
  ///
  /// Default: true
  final bool? enabled;

  /// Jumlah maksimum karakter yang dapat diinput.
  final int? maxLength;

  /// Widget ikon yang ditampilkan di field.
  final Widget? icon;

  /// Menandai apakah field ini adalah field password.
  ///
  /// Jika true, akan menampilkan toggle untuk show/hide password.
  /// Default: false
  final bool isPassword;

  /// Membuat instance dari [AppTextField].
  ///
  /// Parameter [controller], [labelText], dan [validator] wajib diisi.
  /// Parameter lainnya bersifat opsional dan memiliki nilai default.
  const AppTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.hintText,
    required this.validator,
    this.textInputType,
    this.maxLines,
    this.maxLength,
    this.readOnly = false,
    this.enabled = true,
    this.icon,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    final obsecureTextController = Get.put(ObsecureTextController());

    return Padding(
      padding: AppPadding.paddingInput,
      child: Obx(
        () => TextFormField(
          obscureText:
              obsecureTextController.obscureTextMap[labelText]?.value ??
                  isPassword,
          maxLength: maxLength,
          keyboardType: textInputType ?? TextInputType.text,
          maxLines: maxLines ?? 1,
          controller: controller,
          style: AppTextStyle.body(),
          readOnly: readOnly ?? false,
          enabled: enabled ?? true,
          validator: (value) {
            return validator!(value);
          },
          cursorColor: AppColors.text,
          decoration: icon == null || icon is SizedBox
              ? InputDecoration(
                  labelText: labelText,
                  hintText: hintText,
                  suffixIcon: isPassword
                      ? GestureDetector(
                          onTap: () {
                            obsecureTextController.toggleObscureText(labelText);
                          },
                          child: obsecureTextController
                                      .obscureTextMap[labelText]?.isTrue ??
                                  true
                              ? const Icon(
                                  Iconsax.eye_outline,
                                )
                              : const Icon(
                                  Iconsax.eye_slash_outline,
                                ),
                        )
                      : null,
                )
              : InputDecoration(
                  prefixIcon: icon,
                  labelText: labelText,
                  hintText: hintText,
                  suffixIcon: isPassword
                      ? GestureDetector(
                          onTap: () {
                            obsecureTextController.toggleObscureText(labelText);
                          },
                          child: obsecureTextController
                                      .obscureTextMap[labelText]?.isTrue ??
                                  true
                              ? const Icon(
                                  Iconsax.eye_outline,
                                )
                              : const Icon(
                                  Iconsax.eye_slash_outline,
                                ),
                        )
                      : null,
                ),
        ),
      ),
    );
  }
}
