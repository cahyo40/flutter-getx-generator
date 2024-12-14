import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/network_controller.dart';
import 'pages/home/binding/home_binding.dart';
import 'routes/route_app.dart';
import 'routes/route_name.dart';
import 'themes/theme.dart';
import 'utility/constants/enum.dart';
import 'utility/constants/theme.dart';
import 'utility/services/api_services.dart';
import 'utility/translations/tr.dart';

// Dart Getx Custom Module Generator
// Author: Muchammad Dwi Cahyo Nugroho
// Version: 1.0.0
// dibuat: 14 Desember 2024

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dart Getx Custom Module Generator',
      translations: AppTranslations(),
      locale: AppThemes.getLocale(AppLocale.ID),
      fallbackLocale: AppThemes.getLocale(AppLocale.EN),
      theme: AppThemeData.theme,
      initialBinding: BindingsBuilder(() async {
        await Get.putAsync(() => DioService().init(), permanent: true);
        Get.put(NetworkController(), permanent: true);
        HomeBinding();
      }),
      initialRoute: PageName.home,
      getPages: AppRoutes.routes,
    );
  }
}
