import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/config.dart';
import 'binding/network_binding.dart';
import 'core/constants/enum.dart';
import 'core/utility/functions/package_info.dart';
import 'core/utility/translations/tr.dart';
import 'pages/home/binding/home_binding.dart';
import 'pages/login/binding/login_binding.dart';
import 'routes/route_app.dart';
import 'routes/route_name.dart';
import 'services/api_services.dart';
import 'services/datasources/cache.dart';
import 'themes/theme.dart';
import 'themes/theme_data.dart';

// Dart Getx Custom Module Generator
// Author: Muchammad Dwi Cahyo Nugroho
// Version: 1.0.0
// dibuat: 14 Desember 2024

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  NetworkBinding();
  await Get.putAsync(() => DioService().init(), permanent: true);
  final token = AppCache().read(AppCache.token);
  final initialRoute = token != null ? PageName.home : PageName.login;
  final initialBinding = token != null ? HomeBinding() : LoginBinding();
  await AppPackageInfo().version();
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
      title: AppConfig.name,
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
