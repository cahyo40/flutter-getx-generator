import 'package:get_storage/get_storage.dart';

class AppDatabase {
  AppDatabase._();
  static final db = GetStorage();
  static const String token = 'db-token';
  static const String refreshToken = 'db-refresh-token';

  static Future<void> create(String key, dynamic value) async {
    await db.write(key, value);
  }

  static String? read(String key) {
    return db.read(key);
  }

  static Future<void> delete(String key) async {
    await db.remove(key);
  }

  static Future<void> destroy() async {
    await db.erase();
  }
}
