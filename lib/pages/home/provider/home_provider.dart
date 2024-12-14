import 'package:clean_arch/utility/exceptions/dio.dart';
import 'package:dio/dio.dart' hide Response;
import 'package:get/get.dart';

import '../../../utility/services/api_services.dart';

class HomeProvider {
  final Dio _dio = Get.find<DioService>().dio;

  Future<void> testing() async {
    try {
      await _dio.post(
        "https://reqres.in/api/login",
        data: {
          "email": "eve.holt@reqres.in",
          "password": "cityslicka",
        },
      );
    } on DioException catch (e) {
      throw Exception(
        e.response!.data['error'] ?? DioExceptionHandler.fromDioException(e),
      );
    }
  }
}
