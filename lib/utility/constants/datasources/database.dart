import 'package:get_storage/get_storage.dart';

class AppDatabase {
  AppDatabase._();
  static final db = GetStorage();
  static const String token = 'db-token';
  static const String refreshToken = 'db-refresh-token';
}
