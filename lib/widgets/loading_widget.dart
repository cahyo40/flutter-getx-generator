import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../themes/colors.dart';
import '../themes/theme.dart';

class AppLoading extends StatelessWidget {
  final String? message;
  const AppLoading({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return message == null || message == ""
        ? Center(
            child: SpinKitWaveSpinner(
              color: AppColors.primary,
              size: 50,
              waveColor: AppColors.primary.withOpacity(.75),
            ),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SpinKitWaveSpinner(
                color: AppColors.primary,
                size: 50,
                waveColor: AppColors.primary.withOpacity(.75),
              ),
              SizedBox(
                height: AppSize.spaceM,
              ),
              Text(
                message!,
                textAlign: TextAlign.center,
                style: AppThemes.fonts().bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.text,
                    ),
              ),
            ],
          );
  }
}
