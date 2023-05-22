// To parse this JSON data, do
//
//     final editRoldeModel = editRoldeModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

EditRoldeModel editRoldeModelFromJson(String str) => EditRoldeModel.fromJson(json.decode(str));

String editRoldeModelToJson(EditRoldeModel data) => json.encode(data.toJson());

class EditRoldeModel {
  String science;
  String classRoom;
  int startTime;
  int endTime;
  String role;
  String week;
  bool note;

  EditRoldeModel({
    required this.science,
    required this.classRoom,
    required this.startTime,
    required this.endTime,
    required this.role,
    required this.week,
    required this.note,
  });

  factory EditRoldeModel.fromJson(Map<String, dynamic> json) => EditRoldeModel(
    science: json["science"],
    classRoom: json["classRoom"],
    startTime: json["startTime"],
    endTime: json["endTime"],
    role: json["role"],
    week: json["week"],
    note: json["note"],
  );

  Map<String, dynamic> toJson() => {
    "science": science,
    "classRoom": classRoom,
    "startTime": startTime,
    "endTime": endTime,
    "role": role,
    "week": week,
    "note": note,
  };
}
