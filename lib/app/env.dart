// ignore_for_file: unused_field

import 'config.dart';

enum Environment { dev, prod }

class Env {
  static String? _source;

  static String setEnv(Environment env) {
    switch (env) {
      case Environment.dev:
        _source = AppConfig.baseUrlDev;
        break;
      case Environment.prod:
        _source = AppConfig.baseUrlProd;
        break;
    }
    return _source = AppConfig.baseUrlDev;
  }
}
