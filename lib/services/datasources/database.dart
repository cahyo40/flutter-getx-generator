import 'package:get_storage/get_storage.dart';

final db = GetStorage();

class AppDatabase {
  static const String token = 'db-token';
  static const String refreshToken = 'db-refresh-token';
}

extension AppDatabaseFunction on AppDatabase {
  Future<void> write(String key, dynamic value) async {
    await db.write(key, value);
  }

  String? read(String key) {
    return db.read(key);
  }

  Future<void> delete(String key) async {
    await db.remove(key);
  }

  Future<void> destroy() async {
    await db.erase();
  }
}
