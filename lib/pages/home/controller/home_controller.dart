import 'package:clean_arch/utility/helpers/string.dart';
import 'package:clean_arch/widgets/snackbar.dart';
import 'package:get/get.dart';

import '../provider/home_provider.dart';

class HomeController extends GetxController {
  HomeProvider homeProvider = HomeProvider();
  RxBool isLoading = false.obs;

  testApi() async {
    isLoading.value = true;
    try {
      await homeProvider.testing();
    } catch (e) {
      AppSnackbar(
        message: StringHelper.removeException(e.toString()),
        messageType: SnackbarMessageType.ERROR,
      ).show();
    } finally {
      isLoading.value = false;
    }
  }
}
