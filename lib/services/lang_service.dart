import 'package:app/lang/en-US.json.dart';
import 'package:app/lang/ru-RU.json.dart';
import 'package:app/lang/uz-UZ.json.dart';
import 'package:app/services/hive_db_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
String _lang() {
  final value = HiveService.getLang();
  if (value == null || value.isEmpty) return LangService.langs[1];
  return value;
}

class LangService extends Translations {
  // Default locale
  static final locale = defLanguage(_lang());

  // fallbackLocale saves the day when the locale gets in trouble
  static const fallbackLocale = Locale('en', 'US');

  // Supported languages
  // Needs to be same order with locales
  static final items = [
    'Русский',
    'O\'zbek',
    'English',
  ];

  static final langs = [
    'ru',
    'uz',
    'en',
  ];

  // Supported locales
  // Needs to be same order with langs
  static final locales = [
    const Locale('ru', 'RU'),
    const Locale('uz', 'UZ'),
    const Locale('en', 'US'),
  ];

  static Locale defLanguage(String code) {
    var index = langs.indexOf(code);
    return locales[index];
  }

  // Keys and their translations
  // Translations are separated maps in lang file
  @override
  Map<String, Map<String, String>> get keys => {
    'uz_UZ': uz, // lang/uz_uz.dart
    'ru_RU': ru, // lang/ru_ru.dart
    'en_En': en, // lang/en_en.dart
  };

  // Gets locale from language, and updates the locale
  void changeLocale(String lang) {
    final locale = _getLocaleFromLanguage(lang);
    if (locale != null) {
      Get.updateLocale(locale);
      // DBService.to.setValue(StorageKeys.language, lang);
      HiveService.setLang(lang);
    }
  }

  // Finds language in langs list and returns it as Locale
  Locale? _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.deviceLocale;
  }

  String defaultLanguage() {
    final locale = Get.locale;
    var lan = locale.toString();
    if (lan == "ru_RU") return langs[0];
    return langs[1];
  }
}