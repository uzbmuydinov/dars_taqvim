import 'dart:convert';
import 'package:app/models/token_model.dart';
import 'package:app/models/user_model.dart';
import 'package:hive_flutter/hive_flutter.dart';



enum StorageKeys {
  users
}

class HiveService {
  static const String dbName = "MedicAuth";

  static Future<void> setUsers(List<UserModel> users) async {
    var box = Hive.box(dbName);
    List<Map<String, dynamic>> json = users.map((user) => user.toJson()).toList();
    box.put(StorageKeys.users.name, jsonEncode(json));

  }

  static List<UserModel> readUsers() {
    var box = Hive.box(dbName);
    String data = box.get(StorageKeys.users.name, defaultValue: '[]');
    List json = jsonDecode(data);
    List<UserModel> users = json.map((item) => UserModel.fromJson(item)).toList();
    return users;
  }

  static Future<void> deleteAllUsers() async {
    var box = Hive.box(dbName);
    await box.clear();
  }
}
