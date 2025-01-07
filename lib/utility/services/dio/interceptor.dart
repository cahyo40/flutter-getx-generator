import 'package:dio/dio.dart';

import '../../constants/datasources/api.dart';
import '../../constants/datasources/database.dart';

class DioWithRoken extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = AppDatabase.read(AppDatabase.token);

    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
      options.headers['Accept'] = 'application/json';
      options.headers['Content-Type'] = 'application/json';
    }
    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    return handler.next(err);
  }

  Future<void> refreshToken(
      DioException err, ErrorInterceptorHandler handler) async {
    try {
      final dio = Dio();
      final refreshToken = AppDatabase.read(AppDatabase.refreshToken);
      final response = await dio.post(
        AppApi.refreshToken,
        data: {"refresh", refreshToken},
      ); // sesuaikan datanya dan responsenya
      if (response.statusCode == 200) {
        final newToken = response.data['access']; // diganti sesuai dengan data
        AppDatabase.write(AppDatabase.token, newToken);

        final options = err.requestOptions;
        options.headers['Authorization'] = "Bearer $newToken";
        final responseOptions = await dio.fetch(options);
        return handler.resolve(responseOptions);
      }
    } catch (e) {
      AppDatabase.erase();
      // Go Init Page
    }
  }
}
