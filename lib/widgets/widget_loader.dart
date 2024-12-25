import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../themes/colors.dart';
import '../themes/theme.dart';
import 'loading.dart';

class AppLoader extends StatelessWidget {
  final RxBool isLoading;
  final Widget child;
  final Widget? loadingWidget;
  final String? errorMessage;
  const AppLoader({
    super.key,
    required this.isLoading,
    required this.child,
    this.errorMessage,
    this.loadingWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => isLoading.isTrue
          ? loadingWidget ?? const AppLoading()
          : errorMessage != null
              ? Center(
                  child: Text(
                    errorMessage!,
                    style: AppThemes.appFonts().titleMedium!.copyWith(
                          color: AppColors.error,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                )
              : child,
    );
  }
}
