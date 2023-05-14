

import 'package:app/services/network_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/teacher_model.dart';

class HomeController extends GetxController {

  bool isLoading = false;

  List<Data> science = [];

  void getAllScience()async{
    isLoading = true;
    update();
    
    final response = await NetworkService.GET(NetworkService.apiAddTask, NetworkService.paramsScience(week: "MONDAY", role: 'TEACHER'));

    debugPrint('sssssssss$response');

    if(response != null){
      TeacherModel teacherModel = teacherModelFromJson(response);
      science = teacherModel.data!;

    }
    isLoading = false;
    update();
  }

  void changed(bool value){

  }

}