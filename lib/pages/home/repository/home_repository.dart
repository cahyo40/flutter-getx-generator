// Author: Muchammad Dwi Cahyo Nugroho
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

import '../../../utility/services/api_services.dart';

abstract class HomeRepository {}

class HomeRepositoryImpl implements HomeRepository {
  final Dio _dio = Get.find<DioService>().dio;
}
