import 'package:get/get.dart';

import 'lang/en.dart';
import 'lang/id.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'id_ID': idID,
      };
}
