// Author: Muchammad Dwi Cahyo Nugroho
import 'package:get/get.dart';

class ObsecureTextController extends GetxController {
  final isLoading = false.obs;
  RxnString errorMessage = RxnString(null);

  RxMap<String, RxBool> obscureTextMap = <String, RxBool>{}.obs;

  void toggleObscureText(String fieldKey) {
    if (obscureTextMap.containsKey(fieldKey)) {
      obscureTextMap[fieldKey]!.value = !obscureTextMap[fieldKey]!.value;
    } else {
      obscureTextMap[fieldKey] = true.obs;
    }
  }
}
