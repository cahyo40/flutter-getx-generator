// Author: Muchammad Dwi Cahyo Nugroho
import 'package:get/get.dart';
import '../../../routes/route_name.dart';
import '../binding/login_binding.dart';
import '../view/login_view.dart';


final loginRoute = GetPage(
  name: PageName.login,
  page: () => const LoginView(),
  binding: LoginBinding(),
);
