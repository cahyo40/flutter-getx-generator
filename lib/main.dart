import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'controllers/network_controller.dart';
import 'pages/home/binding/home_binding.dart';
import 'pages/login/binding/login_binding.dart';
import 'routes/route_app.dart';
import 'routes/route_name.dart';
import 'themes/theme.dart';
import 'themes/theme_data.dart';
import 'utility/constants/datasources/database.dart';
import 'utility/constants/enum.dart';
import 'utility/services/api_services.dart';
import 'utility/translations/tr.dart';

// Dart Getx Custom Module Generator
// Author: Muchammad Dwi Cahyo Nugroho
// Version: 1.0.0
// dibuat: 14 Desember 2024

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Get.put(NetworkController(), permanent: true);
  await Get.putAsync(() => DioService().init(), permanent: true);
  final token = AppDatabase.read(AppDatabase.token);
  final initialRoute = token != null ? PageName.home : PageName.login;
  final initialBinding = token != null ? HomeBinding() : LoginBinding();
  runApp(MyApp(
    initialBinding: initialBinding,
    initialRoute: initialRoute,
  ));
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  final Bindings initialBinding;
  const MyApp({
    super.key,
    required this.initialRoute,
    required this.initialBinding,
  });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dart Getx Custom Module Generator',
      translations: AppTranslations(),
      locale: AppThemes.getLocale(AppLocale.ID),
      fallbackLocale: AppThemes.getLocale(AppLocale.EN),
      theme: AppThemeData.theme,
      initialBinding: initialBinding,
      initialRoute: initialRoute,
      getPages: AppRoutes.routes,
    );
  }
}
