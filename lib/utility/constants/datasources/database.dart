import 'package:get_storage/get_storage.dart';

class AppDatabase {
  AppDatabase._();
  static final db = GetStorage();
  static const String token = 'db-token';
  static const String refreshToken = 'db-refresh-token';

  static Future<void> write(String key, dynamic value) async {
    await db.write(key, value);
  }

  static String? read(String key) {
    return db.read(key);
  }

  static Future<void> remove(String key) async {
    await db.remove(key);
  }

  static Future<void> erase() async {
    await db.erase();
  }
}
