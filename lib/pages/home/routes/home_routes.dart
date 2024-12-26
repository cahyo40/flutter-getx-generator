// Author: Muchammad Dwi Cahyo Nugroho
import 'package:get/get.dart';
import '../../../routes/route_name.dart';
import '../binding/home_binding.dart';
import '../view/home_view.dart';


final homeRoute = GetPage(
  name: PageName.home,
  page: () => const HomeView(),
  binding: HomeBinding(),
);
