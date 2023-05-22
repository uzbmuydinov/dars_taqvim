// To parse this JSON data, do
//
//     final editPasswordModel = editPasswordModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

EditPasswordModel editPasswordModelFromJson(String str) => EditPasswordModel.fromJson(json.decode(str));

String editPasswordModelToJson(EditPasswordModel data) => json.encode(data.toJson());

class EditPasswordModel {
  String oldPassword;
  String newPassword;
  String prePassword;

  EditPasswordModel({
    required this.oldPassword,
    required this.newPassword,
    required this.prePassword,
  });

  factory EditPasswordModel.fromJson(Map<String, dynamic> json) => EditPasswordModel(
    oldPassword: json["oldPassword"],
    newPassword: json["newPassword"],
    prePassword: json["prePassword"],
  );

  Map<String, dynamic> toJson() => {
    "oldPassword": oldPassword,
    "newPassword": newPassword,
    "prePassword": prePassword,
  };
}
