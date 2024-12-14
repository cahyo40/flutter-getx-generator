import 'package:clean_arch/routers/routes_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'controllers/network_controller.dart';
import 'themes/theme.dart';
import 'utility/constants/colors.dart';
import 'utility/constants/enum.dart';
import 'utility/constants/theme.dart';
import 'utility/services/api_services.dart';
import 'utility/translations/tr.dart';
import 'widgets/loading.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingsBuilder(() async {
        await Get.putAsync(() => DioService().init(), permanent: true);
        Get.put(NetworkController(), permanent: true);
      }),
      getPages: RouteApp.routes,
      translations: AppTranslations(),
      locale: AppThemes.getLocale(AppLocale.ID),
      fallbackLocale: AppThemes.getLocale(AppLocale.EN),
      theme: AppThemeData.theme,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Obx(
                () => Container(
                  color: Get.find<NetworkController>().isConnected.isTrue
                      ? AppColors.success
                      : AppColors.error,
                  padding: const EdgeInsets.all(8),
                  child: Center(
                    child: Text(
                      "${Get.find<NetworkController>().isConnected.value}",
                      style: Get.textTheme.bodyMedium!.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const Expanded(
                child: AppLoading(
                  message: "Cuma template saja",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
