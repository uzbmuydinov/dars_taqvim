import 'package:app/models/add_task_model.dart';
import 'package:app/services/network_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddTaskController extends GetxController {

  bool isLoading = false;

  DateTime selectedDate = DateTime.now();
  DateTime selectedStartTime = DateTime.now();
   int? stimestamp;
   int? startTime;
   int? endTime;
  TextEditingController scienceController = TextEditingController();
  TextEditingController classController = TextEditingController();
  TextEditingController teacherNameController = TextEditingController();
  TextEditingController fanController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();



  Future<void> addTaskNetwork(int week) async{
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

    AddTaskModel addTaskModel = AddTaskModel(

        science: scienceController.text,
        classRoom: 'jjjjjjj',
        noteTime:  stimestamp,
        startTime: startTime,
        endTime: endTime,
        name: teacherNameController.text,
        role: "TEACHER",
        week: 'MONDAY',
        note: false
    );

    final responce =await NetworkService.POST(
        NetworkService.apiAddTask, NetworkService.bodyAddTask(addTaskModel));
    if(responce!=null){
      debugPrint("====================================$responce");
    }
  }

}