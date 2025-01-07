import 'package:flutter/material.dart';
import 'package:get/get.dart';

bool isPortrait() {
  return Get.context?.orientation == Orientation.portrait;
}

bool isMobileScreen() {
  return Get.width < 600;
}
