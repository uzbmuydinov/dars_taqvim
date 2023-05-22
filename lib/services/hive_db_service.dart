import 'dart:convert';
import 'package:app/models/user_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

enum StorageKeys { users, lang }

class HiveService {
  static const String dbName = "MedicAuth";
  static const String langId = "chosen_lang";

  static Future<void> setUsers(List<UserModel> users) async {
    var box = Hive.box(dbName);
    List<Map<String, dynamic>> json =
    users.map((user) => user.toJson()).toList();
    box.put(StorageKeys.users.name, jsonEncode(json));
  }

  static void setLang(String lang) {
    var box = Hive.box(langId);
    box.put(StorageKeys.lang.name, lang);
  }

  static String getLang() {
    var box = Hive.box(langId);
    return box.get(StorageKeys.lang.name,defaultValue: 'uz');
  }

  static void deleteLang() {
    var box = Hive.box(langId);
    box.delete(StorageKeys.lang);
  }

  static List<UserModel> readUsers() {
    var box = Hive.box(dbName);
    String data = box.get(StorageKeys.users.name, defaultValue: '[]');
    List json = jsonDecode(data);
    List<UserModel> users =
    json.map((item) => UserModel.fromJson(item)).toList();
    return users;
  }

  static Future<void> deleteAllUsers() async {
    var box = Hive.box(dbName);
    await box.clear();
  }
}