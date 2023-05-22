import 'package:app/ui/navigation/navigation_page.dart';
import 'package:app/ui/profile/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  bool us = false;
  bool tal = false;
  bool bol = false;
  String? role;

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
                        "Pazitsiyani\ntanlang!",
                        style: TextStyle(
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                            fontSize: 34,
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
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Get.isDarkMode ? Colors.grey : Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(15),
                    // border: Border.all(color: Colors.orange)
                  ),
                  child: CheckboxListTile(
                    checkboxShape: CircleBorder(),
                    title: Text(
                      'O\'qituvchi',
                      style: TextStyle(
                        color: Get.isDarkMode ? Colors.black : Colors.black,
                      ),
                    ),
                    secondary: Icon(Icons.person,
                        size: 23,
                        color: Get.isDarkMode ? Colors.black : Colors.black),
                    autofocus: false,
                    activeColor: Colors.orange,
                    checkColor: Colors.white,
                    selected: us,
                    value: us,
                    onChanged: (val) {
                      setState(() {
                        us = val!;
                        role = "TEACHER";
                      });
                    },
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
                  child: CheckboxListTile(
                    checkboxShape: CircleBorder(),
                    title: Text(
                      'Talaba',
                      style: TextStyle(
                        color: Get.isDarkMode ? Colors.black : Colors.black,
                      ),
                    ),
                    secondary: Icon(Icons.person,
                        size: 23,
                        color: Get.isDarkMode ? Colors.black : Colors.black),
                    autofocus: false,
                    activeColor: Colors.orange,
                    checkColor: Colors.white,
                    selected: tal,
                    value: tal,
                    onChanged: (val) {
                      setState(() {
                        tal = val!;
                        role = "STUDENT";
                      });
                    },
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
                  child: CheckboxListTile(
                    checkboxShape: CircleBorder(),
                    title: Text(
                      'O\'quvchi',
                      style: TextStyle(
                        color: Get.isDarkMode ? Colors.black : Colors.black,
                      ),
                    ),
                    secondary: Icon(Icons.person,
                        size: 23,
                        color: Get.isDarkMode ? Colors.black : Colors.black),
                    autofocus: false,
                    activeColor: Colors.orange,
                    checkColor: Colors.white,
                    selected: bol,
                    value: bol,
                    onChanged: (val) {
                      setState(() {
                        bol = val!;
                        role = "READER";
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 230,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      if (role!.isNotEmpty) {
                        Get.to(NavigationPage(
                          rule: role!,
                        ));
                      } else {
                        Get.snackbar(
                            "Talab qilinadi", "Hamma maydon talab qilinadi !",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor:
                                Get.isDarkMode ? Colors.black : Colors.white,
                            icon: const Icon(Icons.warning_amber_rounded));
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(17),
                      decoration: BoxDecoration(
                        color: Colors.orange.withOpacity(1.0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          " Davom etish",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
