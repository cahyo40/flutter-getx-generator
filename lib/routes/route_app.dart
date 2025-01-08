import 'package:get/get.dart';

import '../pages/home/routes/home_routes.dart';
import '../pages/login/routes/login_routes.dart';

abstract class AppRoutes {
  static final routes = <GetPage>[
    loginRoute,
    homeRoute,
  ];
}
