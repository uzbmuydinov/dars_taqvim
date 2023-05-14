import 'package:app/models/add_task_model.dart';
import 'package:app/services/network_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../models/teacher_model.dart';

class AddTaskController extends GetxController {

  bool isLoading = false;
  List<Data> science = [];

  DateTime selectedDate = DateTime.now();
  DateTime selectedStartTime = DateTime.now();
   int? stimestamp;
   int? startTime;
   int? endTime;
  TextEditingController scienceController = TextEditingController();
  TextEditingController classController = TextEditingController();
  TextEditingController teacherORClassRoomController = TextEditingController();
  TextEditingController fanController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();



  Future<void> addTaskNetwork(int week, String role) async{
    isLoading = true;
    debugPrint('mmmmmmmmmmmmm>$week');
    update();
    String? weekDay;
    if (week == 1) {
      weekDay = "MONDAY";
    } else if (week == 2) {
      weekDay = "TUESDAY";
    } else if (week == 3) {
      weekDay = "WEDNESDAY";
    } else if (week == 4) {
      weekDay = "THURSDAY";
    } else if (week == 5) {
      weekDay = "FRIDAY";
    } else if (week == 6) {
      weekDay = "SATURDAY";
    } else if (week == 7) {
      weekDay = "SUNDAY";
    }

    AddTaskModel addTaskModel;

    if(role == 'TEACHER'){
       addTaskModel = AddTaskModel(
          science: scienceController.text,
          classRoom: teacherORClassRoomController.text.trim(),
          noteTime:  stimestamp,
          startTime: 12,
          endTime: 22,
          role: role,
          week: weekDay,
          note: false
      );
    }else{
      addTaskModel =  AddTaskModel(
          science: scienceController.text,
          name: teacherORClassRoomController.text.trim(),
          noteTime:  stimestamp,
          startTime: 12,
          endTime: 22,
          role: role,
          week: weekDay,
          note: false
      );
    }



    final responce = await NetworkService.POST(
        NetworkService.apiAddTask, NetworkService.bodyAddTask(addTaskModel));
    if(responce!=null){
      debugPrint("====================================$responce");
    }
  }


  ///<Table Controller>

  Future<void> getDeyTask(int week, String rule)async{
    isLoading = true;
    update();

    String? weekDay;
    if (week == 1) {
      weekDay = "MONDAY";
    } else if (week == 2) {
      weekDay = "TUESDAY";
    } else if (week == 3) {
      weekDay = "WEDNESDAY";
    } else if (week == 4) {
      weekDay = "THURSDAY";
    } else if (week == 5) {
      weekDay = "FRIDAY";
    } else if (week == 6) {
      weekDay = "SATURDAY";
    } else if (week == 7) {
      weekDay = "SUNDAY";
    }


    final response = await NetworkService.GET(NetworkService.apiAddTask, NetworkService.paramsScience(week: weekDay, role: rule,));

    if(response != null){
      TeacherModel teacherModel = teacherModelFromJson(response);
      science = teacherModel.data!;

    }
    isLoading = false;
    update();

  }

}