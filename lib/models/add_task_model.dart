// To parse this JSON data, do
//
//     final addTaskModel = addTaskModelFromJson(jsonString);

import 'dart:convert';

AddTaskModel addTaskModelFromJson(String str) =>
    AddTaskModel.fromJson(json.decode(str));

String addTaskModelToJson(AddTaskModel data) => json.encode(data.toJson());

class AddTaskModel {
  String? science;
  String? classRoom;
  int? startTime;
  int? endTime;
  int? noteTime;
  String? name;
  String? role;
  String? week;
  bool? note;

  AddTaskModel({
    this.science,
    this.classRoom,
    this.startTime,
    this.endTime,
    this.noteTime,
    this.name,
    this.role,
    this.week,
    this.note,
  });

  factory AddTaskModel.fromJson(Map<String, dynamic> json) => AddTaskModel(
        science: json["science"],
        classRoom: json["classRoom"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        noteTime: json["noteTime"],
        name: json["name"],
        role: json["role"],
        week: json["week"],
        note: json["note"],
      );

  Map<String, dynamic> toJson() => {
        "science": science,
        "classRoom": classRoom,
        "startTime": startTime,
        "endTime": endTime,
        "noteTime": noteTime,
        "name": name,
        "role": role,
        "week": week,
        "note": note,
      };
}
