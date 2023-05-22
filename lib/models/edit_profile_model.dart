// To parse this JSON data, do
//
//     final userEditProfileModel = userEditProfileModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

UserEditProfileModel userEditProfileModelFromJson(String str) => UserEditProfileModel.fromJson(json.decode(str));

String userEditProfileModelToJson(UserEditProfileModel data) => json.encode(data.toJson());

class UserEditProfileModel {
  String firstName;
  String lastName;
  String phoneNumber;
  int birthDate;

  UserEditProfileModel({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.birthDate,
  });

  factory UserEditProfileModel.fromJson(Map<String, dynamic> json) => UserEditProfileModel(
    firstName: json["firstName"],
    lastName: json["lastName"],
    phoneNumber: json["phoneNumber"],
    birthDate: json["birthDate"],
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
    "phoneNumber": phoneNumber,
    "birthDate": birthDate,
  };
}
