import 'package:get/get.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'uz_UZ': {
          'greeting': 'Salom',
        },
        'ru_RU': {
          'greeting': 'こんにちは',
        },
        'en_US': {
          'greeting': 'Hello',
        },
      };
}
