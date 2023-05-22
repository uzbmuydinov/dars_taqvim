import 'dart:convert';

import 'package:app/services/network_service.dart';
import 'package:app/ui/home/register_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/sign_in_message_model.dart';
import '../ui/home/user_page.dart';

class SignInController extends GetxController {
  TextEditingController numberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void changeRegister() async {
    final responce = await NetworkService.POST(
        NetworkService.apiSignIn,
        NetworkService.bodySignIn(
            numberController.text.trim(), passwordController.text.trim()));

    if (responce == null) {
      Get.snackbar("Telefon number yoki Parol xato".tr, "Qayta urinib ko'ring".tr,
          snackPosition: SnackPosition.TOP,
          backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
          icon: const Icon(
            Icons.warning_amber_rounded,
            color: Colors.red,
          ));
      update();
    }

    Map<String, dynamic> a = jsonDecode(responce!);

    if (a['data']['success'] != false) {
      Get.to(const UserPage());
      Get.snackbar("Ro'yxatdan muvaffaqiyatli\no'tdingiz".tr, "         ",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
          icon: const Icon(Icons.check, color: Colors.green));
      update();
    }
  }
}
