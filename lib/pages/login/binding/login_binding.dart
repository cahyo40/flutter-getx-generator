// Author: Muchammad Dwi Cahyo Nugroho
import 'package:get/get.dart';
import '../controller/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
  }
}
