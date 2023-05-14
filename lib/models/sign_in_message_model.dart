
import 'dart:convert';

SignInMessageModel signInMessageModelFromJson(String str) => SignInMessageModel.fromJson(json.decode(str));

String signInMessageModelToJson(SignInMessageModel data) => json.encode(data.toJson());

class SignInMessageModel {
  bool success;
  Data data;

  SignInMessageModel({
    required this.success,
    required this.data,
  });

  factory SignInMessageModel.fromJson(Map<String, dynamic> json) => SignInMessageModel(
    success: json["success"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.toJson(),
  };
}

class Data {
  String tokenType;
  String accessToken;
  String refreshToken;

  Data({
    required this.tokenType,
    required this.accessToken,
    required this.refreshToken,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    tokenType: json["tokenType"],
    accessToken: json["accessToken"],
    refreshToken: json["refreshToken"],
  );

  Map<String, dynamic> toJson() => {
    "tokenType": tokenType,
    "accessToken": accessToken,
    "refreshToken": refreshToken,
  };
}
