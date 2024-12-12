import 'package:clean_arch/utility/constants/datasources/api.dart';
import 'package:clean_arch/utility/constants/datasources/database.dart';
import 'package:dio/dio.dart';

class DioWithRoken extends Interceptor {
  final box = AppDatabase.db;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = box.read(AppDatabase.token);

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
      final refreshToken = box.read(AppDatabase.refreshToken);
      final response = await dio.post(
        AppApi.refreshToken,
        data: {"refresh", refreshToken},
      ); // sesuaikan datanya dan responsenya
      if (response.statusCode == 200) {
        final newToken = response.data['access']; // diganti sesuai dengan data
        box.write(AppDatabase.token, newToken);

        final options = err.requestOptions;
        options.headers['Authorization'] = "Bearer $newToken";
        final responseOptions = await dio.fetch(options);
        return handler.resolve(responseOptions);
      }
    } catch (e) {
      box.erase();
      // Go Init Page
    }
  }
}
