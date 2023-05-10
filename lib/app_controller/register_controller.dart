import 'package:app/models/token_model.dart';
import 'package:app/services/network_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../ui/home/user_page.dart';

class RegisterController extends GetxController {
  bool isLoading = false;

  Map<String, dynamic>? jsonMap;

  TextEditingController surnameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> postData() async {
    isLoading = true;
    update();
    final responce = await NetworkService.POST(
        NetworkService.apiSignUp,
        NetworkService.bodySignUp(
            surnameController.text.trim(),
            nameController.text.trim(),
            numberController.text.trim(),
            passwordController.text.trim()));

    if (responce != null) {
      TokenModel tokenModel= tokenModelFromJson(responce);
     tokenModel.data.accessToken;
      isLoading = false;
      update();
      Get.to(const UserPage());
    }
  }
}
