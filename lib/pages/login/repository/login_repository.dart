// Author: Muchammad Dwi Cahyo Nugroho
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

import '../../../services/api_services.dart';

abstract class LoginRepository {}

class LoginRepositoryImpl implements LoginRepository {
  final Dio _dio = Get.find<DioService>().dio;
}
