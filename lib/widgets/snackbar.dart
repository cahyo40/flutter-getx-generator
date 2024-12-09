import '../utility/constants/colors.dart';
import '../utility/constants/config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utility/constants/theme.dart';

enum SnackbarMessageType { SUCCESS, INFO, WARNING, ERROR }

enum SnackbarType { FLOATING, DOCK }

class AppSnackbar {
  final SnackbarType? type;
  final Duration? duration;
  final SnackbarMessageType messageType;
  final String? message;

  AppSnackbar({
    this.type = AppConfig.snackbarType,
    this.duration = AppThemes.duration,
    this.messageType = SnackbarMessageType.INFO,
    required this.message,
  });

  show() {
    if (type == SnackbarType.FLOATING) {
      Get.snackbar(
        _titleSnackbar(messageType),
        message!,
        backgroundColor: _colorSnackbar(messageType),
        titleText: Text(
          _titleSnackbar(messageType),
          style: TextStyle(
            color: AppColors.white,
            fontSize: FontSize.lg,
            fontWeight: FontWeight.w600,
          ),
        ),
        messageText: Text(
          message!,
          style: TextStyle(
            color: AppColors.white,
            fontSize: FontSize.sm,
            fontWeight: FontWeight.w400,
          ),
        ),
      );
    } else {
      Get.rawSnackbar(
        backgroundColor: _colorSnackbar(messageType),
        titleText: Text(
          _titleSnackbar(messageType),
          style: TextStyle(
            color: AppColors.white,
            fontSize: FontSize.lg,
            fontWeight: FontWeight.w600,
          ),
        ),
        messageText: Text(
          message!,
          style: TextStyle(
            color: AppColors.white,
            fontSize: FontSize.sm,
            fontWeight: FontWeight.w400,
          ),
        ),
      );
    }
  }

  Color _colorSnackbar(SnackbarMessageType type) {
    switch (type) {
      case SnackbarMessageType.ERROR:
        return AppColors.error;
      case SnackbarMessageType.INFO:
        return AppColors.info;
      case SnackbarMessageType.WARNING:
        return AppColors.warning;
      case SnackbarMessageType.SUCCESS:
        return AppColors.success;
      default:
        return AppColors.info;
    }
  }

  String _titleSnackbar(SnackbarMessageType type) {
    switch (type) {
      case SnackbarMessageType.ERROR:
        return "Error";
      case SnackbarMessageType.INFO:
        return "Info";
      case SnackbarMessageType.WARNING:
        return "Warning";
      case SnackbarMessageType.SUCCESS:
        return "Success";
      default:
        return "Info";
    }
  }
}
