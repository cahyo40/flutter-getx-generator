import '../utility/constants/colors.dart';
import '../utility/constants/theme.dart';
import 'package:flutter/material.dart';

import '../themes/button.dart';

class AppButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final ButtonType? buttonType;
  final ButtonColor buttonColor;
  final Icon? icon;
  const AppButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.buttonType,
    this.buttonColor = ButtonColor.PRIMARY,
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
            textStyle: AppThemes.appFonts().bodySmall?.copyWith(
                  color: getButtonColor(buttonColor),
                  fontWeight: FontWeight.w600,
                ),
            iconColor: getButtonColor(buttonColor),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: AppThemes.appFonts().bodySmall?.copyWith(
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
            textStyle: AppThemes.appFonts().bodySmall?.copyWith(
                  color: getButtonColor(buttonColor),
                  fontWeight: FontWeight.w600,
                ),
          ),
          onPressed: onPressed,
          label: Text(
            text,
            style: AppThemes.appFonts().bodySmall?.copyWith(
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
            backgroundColor: getButtonColor(buttonColor),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: AppThemes.appFonts().bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
          ),
        );
      } else {
        return ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: getButtonColor(buttonColor),
          ),
          onPressed: onPressed,
          label: Text(
            text,
            style: AppThemes.appFonts().bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
          ),
          icon: icon,
        );
      }
    }
  }
}
