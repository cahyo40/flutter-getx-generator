import 'package:get/get.dart';

import 'en/en.dart';
import 'id/id.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'id_ID': idID,
      };
}
