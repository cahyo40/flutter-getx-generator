import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../themes/colors.dart';
import '../../themes/padding.dart';
import '../../themes/theme.dart';
import '../../utility/validations/input_validation.dart';

class AppDropDown extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final ListView listWidget;
  final bool enabled;
  final Widget? icon;
  final Function()? onClear;
  const AppDropDown({
    super.key,
    required this.controller,
    required this.labelText,
    required this.listWidget,
    this.enabled = true,
    this.icon,
    this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppSize.spaceM),
      child: TextFormField(
        enabled: enabled,
        autofocus: false,
        onTap: () {
          Get.bottomSheet(
            Container(
              color: AppColors.background,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppBar(
                    title: Text(labelText),
                    actions: [
                      Visibility(
                        visible: onClear != null,
                        child: IconButton(
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            onClear!();
                            Get.back();
                          },
                          icon: const Icon(Iconsax.save_remove_outline),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: AppPadding.paddingList,
                    constraints: BoxConstraints(
                      maxHeight: Get.height * 0.5 - 75,
                      maxWidth: double.infinity,
                    ),
                    child: listWidget,
                  ),
                ],
              ),
            ),
            isScrollControlled: true,
            enableDrag: true,
          );
        },
        readOnly: true,
        controller: controller,
        validator: (value) {
          return InputValidation.dropdown(value!, labelText);
        },
        decoration: icon == null || icon is SizedBox
            ? InputDecoration(
                labelText: labelText,
                suffixIcon: const Icon(Icons.arrow_drop_down),
              )
            : InputDecoration(
                prefixIcon: icon,
                labelText: labelText,
                suffixIcon: const Icon(Icons.arrow_drop_down),
              ),
      ),
    );
  }
}
