import 'package:package_info_plus/package_info_plus.dart';

class AppPackageInfo {
  Future<String> version() async {
    final package = await PackageInfo.fromPlatform();
    return package.version;
  }
}
