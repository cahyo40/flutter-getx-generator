import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../app/config.dart';

class DioService extends GetxService {
  late Dio _dio;
  late Dio _dioToken;

  final _dioPretty = PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: false,
    error: true,
    compact: true,
    maxWidth: 90,
    enabled: kDebugMode,
  );

  Future<DioService> init() async {
    final options = BaseOptions(
      baseUrl: AppConfig.baseUrl,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
    );

    // Jika ada token
    _dioToken = Dio(options);
    _dioToken.interceptors.add(_dioPretty);

    // tanpa token
    _dio = Dio(options);
    _dio.interceptors.add(_dioPretty);

    return this;
  }

  Dio get dioToken => _dioToken;
  Dio get dio => _dio;
}
