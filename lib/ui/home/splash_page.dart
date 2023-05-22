import 'package:app/ui/home/lang_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Get.theme.backgroundColor,
        body: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
              child: Center(
                child: Image.asset(
                  "assets/images/img_3.png",
                  width: 500,
                  height: 500,
                ),
              ),
            ),
            Column(
              children: [
                Text(
                  "Dars jadvallari\neslatma ilovasi",
                  style: TextStyle(
                      fontSize: 37,
                      fontWeight: FontWeight.w700,
                      color: Get.isDarkMode ? Colors.white : Colors.black),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Lesson schedules reminder \n              app app app",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w200),
                ),
                const SizedBox(
                  height: 100,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(const LangPage());
                      },
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
                    ))
              ],
            ),
          ]),
        ));
  }
}
