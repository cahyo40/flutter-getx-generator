// ignore_for_file: unused_field

enum Environment { dev, prod }

class Env {
  static String? _source;

  static String setEnv(Environment env) {
    switch (env) {
      case Environment.dev:
        _source = "";
        break;
      case Environment.prod:
        _source = "";
        break;
    }
    return _source = "";
  }
}
