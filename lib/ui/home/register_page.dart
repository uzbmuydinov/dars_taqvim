import 'package:app/app_controller/register_controller.dart';
import 'package:app/ui/home/sign_page.dart';
import 'package:app/ui/home/user_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final RegisterController registerController = Get.find<RegisterController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Stack(
        children: [
          SafeArea(
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
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 29,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color:
                            Get.isDarkMode ? Colors.grey : Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextField(
                        autofocus: true,
                        controller: registerController.surnameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.person,
                              color:
                                  Get.isDarkMode ? Colors.black : Colors.black),
                          hintText: "Familya",
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
                        color:
                            Get.isDarkMode ? Colors.grey : Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextField(
                        controller: registerController.nameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.phone_outlined,
                              color:
                                  Get.isDarkMode ? Colors.black : Colors.black),
                          hintText: "Ism",
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
                        color:
                            Get.isDarkMode ? Colors.grey : Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextField(
                        controller: registerController.numberController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.phone_outlined,
                              color:
                                  Get.isDarkMode ? Colors.black : Colors.black),
                         hintText: ("Telefon number"),
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
                        color:
                            Get.isDarkMode ? Colors.grey : Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextField(
                        controller: registerController.passwordController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.lock,
                              color:
                                  Get.isDarkMode ? Colors.black : Colors.black),
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
                    height: 165,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: GestureDetector(
                        onTap: registerController.postData,

                        // Get.to(const UserPage());

                        child: Container(
                          padding: const EdgeInsets.all(17),
                          decoration: BoxDecoration(
                            color: Colors.orange.withOpacity(1.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "Davom etish".tr,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: GestureDetector(
                    onTap: () {
                      Get.to(const SignInPage());
                    },
                    child: Text(
                      "Hisobga kiring".tr,
                      style: const TextStyle(
                        color: Colors.orange,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ))
                ],
              ),
            ),
          ),
          Visibility(
              visible: registerController.isLoading,
              child: const Center(child: RefreshProgressIndicator()))
        ],
      ),
    );
  }
}
