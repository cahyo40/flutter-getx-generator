import 'package:clean_arch/utility/constants/message/utility.dart';
import 'package:clean_arch/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/button.dart';
import '../controller/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Obx(
        () => controller.isLoading.isTrue
            ? AppLoading(
                message: UtilityMessage.LOADING.tr,
              )
            : Center(
                child: AppButton(
                  onPressed: () {
                    controller.testApi();
                  },
                  text: "Testing api",
                ),
              ),
      ),
    );
  }
}