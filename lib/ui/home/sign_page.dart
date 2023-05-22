import 'package:app/ui/home/register_page.dart';
import 'package:app/ui/profile/table_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_controller/sign_in_controller.dart';
import 'user_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final SignInController signInController = Get.find<SignInController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Get.theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Get.theme.backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ma'lumotingizni\nkiriting!",
                        style: TextStyle(
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                            fontSize: 33,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Get.isDarkMode ? Colors.grey : Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextField(
                    controller: signInController.numberController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.phone_outlined,
                          color: Get.isDarkMode ? Colors.black : Colors.black),
                      hintText: "Telefon raqam",
                      hintStyle: TextStyle(
                        color: Get.isDarkMode ? Colors.black : Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Get.isDarkMode ? Colors.grey : Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextField(
                    controller: signInController.passwordController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.lock,
                          color: Get.isDarkMode ? Colors.black : Colors.black),
                      hintText: "Parol",
                      hintStyle: TextStyle(
                        color: Get.isDarkMode ? Colors.black : Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 330,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: GestureDetector(
                  onTap: signInController.changeRegister,
                  child: Container(
                    padding: const EdgeInsets.all(17),
                    decoration: BoxDecoration(
                      color: Colors.orange.withOpacity(1.0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        "Davom etish",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Center(
                  child: GestureDetector(
                onTap: () {
                  Get.off(() => const RegisterPage());
                },
                child: const Text(
                  "Hisob yaratish",
                  style: TextStyle(
                      color: Colors.orange,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
