import 'dart:developer';

import 'package:app/models/token_model.dart' hide Data;
import 'package:app/models/user_model.dart';
import 'package:app/services/hive_db_service.dart';
import 'package:app/services/network_service.dart';
import 'package:app/services/secure_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

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
      debugPrint('++++++++++++++++++++++++++$responce');
      TokenModel tokenModel = tokenModelFromJson(responce);
      await SecureStorage.storeToken(tokenModel.data.accessToken);
      List<UserModel> auth = HiveService.readUsers();
      Data data = Data(
          id: auth.length,
          firstName: nameController.text.trim(),
          lastName: surnameController.text.trim(),
          phoneNumber: numberController.text.trim());
      UserModel userModel = UserModel(success: true, data: data);
      auth.add(userModel);
      HiveService.setUsers(auth);
      isLoading = false;
      update();
      Get.to(const UserPage());
    }
  }
}
