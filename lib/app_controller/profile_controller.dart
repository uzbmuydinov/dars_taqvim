import 'package:app/models/edit_password_model.dart';
import 'package:app/models/edit_profile_model.dart';
import 'package:app/services/hive_db_service.dart';
import 'package:app/services/network_service.dart';
import 'package:app/ui/home/register_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/profile_model.dart';

class ProfileController extends GetxController {
  bool isLoading = false;
  Data? user;

  TextEditingController firstNameEditingController = TextEditingController();
  TextEditingController lastNameEditingController = TextEditingController();
  TextEditingController phoneNumberEditingController = TextEditingController();
  TextEditingController birthEditingController = TextEditingController();

  TextEditingController oldEditingController = TextEditingController();
  TextEditingController newEditingController = TextEditingController();
  TextEditingController preEditingController = TextEditingController();

  void getProfile() async {
    isLoading = true;
    update();
    final response = await NetworkService.GET(
        NetworkService.profileGet, NetworkService.paramsEmpty());

    if (response != null) {
      UserProfileModel profileModel = userProfileModelFromJson(response);
      user = profileModel.data;
      isLoading = true;
      update();
    }
  }

  void getSave(BuildContext context) async {
    isLoading = true;
    update();
    UserEditProfileModel userEditProfileModel = UserEditProfileModel(
        firstName: firstNameEditingController.text,
        lastName: lastNameEditingController.text,
        phoneNumber: phoneNumberEditingController.text,
        birthDate:12);
    final response = await NetworkService.PUT(NetworkService.userEditProfile,
        NetworkService.editBody(userEditProfileModel));
    if (response != null) {
      getProfile();
      Navigator.pop(context);
    }
    isLoading = false;
    update();
  }

  void getEdit(BuildContext context) async {
    isLoading = true;
    update();
    EditPasswordModel editPasswordModel = EditPasswordModel(
        oldPassword: oldEditingController.text.trim(),
        newPassword: newEditingController.text.trim(),
        prePassword: preEditingController.text.trim());

    final response = await NetworkService.PUT(
        NetworkService.passwordEditProfile,
        NetworkService.editPasswordBody(editPasswordModel));
    if (response != null) {
      debugPrint("++++++++++++++++++++++++++++++++++++++++++$response");
      Navigator.pop(context);
    }
    isLoading = false;
    update();
  }
}
