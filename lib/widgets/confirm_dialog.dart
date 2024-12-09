import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDialog {
  static Future<bool?> confirm({
    String? title,
    String? message,
    String? confirmText,
    String? cancelText,
    Color? confirmColor,
    Color? cancelColor,
    bool barrierDismissible = true,
  }) {
    return Get.dialog<bool>(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Title
              if (title != null) ...[
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
              ],

              // Message
              if (message != null) ...[
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 24),
              ],

              // Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Cancel Button
                  TextButton(
                    onPressed: () => Get.back(result: false),
                    child: Text(
                      cancelText ?? 'Batal',
                      style: TextStyle(
                        color: cancelColor ?? Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),

                  // Confirm Button
                  ElevatedButton(
                    onPressed: () => Get.back(result: true),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: confirmColor ?? Colors.blue,
                    ),
                    child: Text(confirmText ?? 'OK'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: barrierDismissible,
    );
  }
}
