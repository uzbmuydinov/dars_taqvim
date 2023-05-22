import 'dart:convert';

TeacherModel teacherModelFromJson(String str) =>
    TeacherModel.fromJson(json.decode(str));

String teacherModelToJson(TeacherModel data) => json.encode(data.toJson());

class TeacherModel {
  TeacherModel({
    this.success,
    this.data,
  });

  TeacherModel.fromJson(dynamic json) {
    success = json['success'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }

  bool? success;
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    this.id,
    this.science,
    this.classRoom,
    this.startTime,
    this.endTime,
    this.name,
    this.role,
    this.week,
    this.note,
    this.noteTime,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    science = json['science'];
    classRoom = json['classRoom'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    name = json['name'];
    role = json['role'];
    week = json['week'];
    note = json['note'];
    noteTime = json['noteTime'];
  }

  int? id;
  String? science;
  String? classRoom;
  int? startTime;
  int? endTime;
  String? name;
  String? role;
  String? week;
  bool? note;
  int? noteTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['science'] = science;
    map['classRoom'] = classRoom;
    map['startTime'] = startTime;
    map['endTime'] = endTime;
    map['name'] = name;
    map['role'] = role;
    map['week'] = week;
    map['note'] = note;
    map['noteTime'] = noteTime;
    return map;
  }
}
