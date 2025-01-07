import 'package:flutter/material.dart';

import '../themes/colors.dart';
import '../themes/theme.dart';
import 'loading_widget.dart';

class AppLoader extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  final Widget? loadingWidget;
  final String? errorMessage;
  final Widget? errorWidget;
  const AppLoader(
      {super.key,
      required this.isLoading,
      required this.child,
      this.errorMessage,
      this.loadingWidget,
      this.errorWidget});

  @override
  Widget build(BuildContext context) {
    if (isLoading == true) {
      return loadingWidget ?? const AppLoading();
    } else {
      if (errorMessage != null) {
        return errorWidget ??
            Center(
              child: Text(
                errorMessage!,
                style: AppThemes.fonts().titleMedium!.copyWith(
                      color: AppColors.error,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            );
      } else {
        return child;
      }
    }
  }
}
