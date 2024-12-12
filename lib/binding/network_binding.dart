import '../controllers/network_controller.dart';
import 'package:get/get.dart';

class NetworkBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(NetworkController(), permanent: true);
  }
}
