import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../themes/colors.dart';
import '../themes/theme.dart';

class AppDialogLoading {
  static void show([String? message]) {
    Get.dialog(
      Dialog(
        backgroundColor: Colors.white,
        elevation: 0,
        insetPadding: const EdgeInsets.symmetric(horizontal: 40),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          height: Get.height * 0.3,
          padding: const EdgeInsets.all(20),
          child: message == null || message.isEmpty
              ? Center(
                  child: SpinKitWaveSpinner(
                    color: AppColors.primary,
                    size: 50,
                    waveColor: AppColors.primary.withOpacity(.75),
                  ),
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SpinKitWaveSpinner(
                      color: AppColors.primary,
                      size: 50,
                      waveColor: AppColors.primary.withOpacity(.75),
                    ),
                    SizedBox(
                      height: AppSize.medium,
                    ),
                    Text(
                      message,
                      textAlign: TextAlign.center,
                      style: AppThemes.appFonts().bodyMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.text,
                          ),
                    ),
                  ],
                ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  static void hide() {
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
  }
}
