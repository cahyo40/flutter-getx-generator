import 'package:flutter/material.dart';

import '../core/constants/enum.dart';
import '../themes/button.dart';
import '../themes/colors.dart';
import '../themes/theme.dart';

class AppButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final ButtonType? buttonType;
  final ButtonColor buttonColor;
  final Icon? icon;
  final Color? backgroundColor;
  const AppButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.buttonType,
    this.buttonColor = ButtonColor.PRIMARY,
    this.backgroundColor,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    if (buttonType == ButtonType.OUTLINE) {
      if (icon == null || icon is SizedBox) {
        return OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              width: 1.5,
              color: getButtonColor(buttonColor),
            ),
            textStyle: AppThemes.fonts().bodySmall?.copyWith(
                  color: getButtonColor(buttonColor),
                  fontWeight: FontWeight.w600,
                ),
            iconColor: getButtonColor(buttonColor),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: AppThemes.fonts().bodySmall?.copyWith(
                  color: getButtonColor(buttonColor),
                  fontWeight: FontWeight.w600,
                ),
          ),
        );
      } else {
        return OutlinedButton.icon(
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              width: 1.5,
              color: getButtonColor(buttonColor),
            ),
            iconColor: getButtonColor(buttonColor),
            textStyle: AppThemes.fonts().bodySmall?.copyWith(
                  color: getButtonColor(buttonColor),
                  fontWeight: FontWeight.w600,
                ),
          ),
          onPressed: onPressed,
          label: Text(
            text,
            style: AppThemes.fonts().bodySmall?.copyWith(
                  color: getButtonColor(buttonColor),
                  fontWeight: FontWeight.w600,
                ),
          ),
          icon: icon,
        );
      }
    } else {
      if (icon == null || icon is SizedBox) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? getButtonColor(buttonColor),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: AppThemes.fonts().bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.text,
                ),
          ),
        );
      } else {
        return ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? getButtonColor(buttonColor),
          ),
          onPressed: onPressed,
          label: Text(
            text,
            style: AppThemes.fonts().bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.text,
                ),
          ),
          icon: icon,
        );
      }
    }
  }
}
