import 'package:get/get.dart';

import '../controllers/network_controller.dart';

class NetworkBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(
      NetworkController(),
      permanent: true,
    );
  }
}
