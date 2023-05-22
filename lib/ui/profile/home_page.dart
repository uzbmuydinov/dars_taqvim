import 'package:app/app_controller/home_controller.dart';
import 'package:app/models/teacher_model.dart';
import 'package:app/services/notification_services.dart';
import 'package:app/services/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/home_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController homeController = Get.find<HomeController>();

  var notifyHelper;

  @override
  void initState() {
    super.initState();
    notifyHelper = NotifyHelper();
    notifyHelper.requestIOSPermissions();
    notifyHelper.initializeNotification();
    homeController.getAllScience();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (homeController) {
          return Scaffold(
            backgroundColor: context.theme.backgroundColor,
            appBar: _appBar(),
            body: Stack(
              children: [
                _bodyBar(),
                Visibility(
                  visible: homeController.isLoading,
                  child: const Center(
                      child: CircularProgressIndicator(
                    color: Colors.white,
                  )),
                )
              ],
            ),
          );
        });
  }

  _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: context.theme.backgroundColor,

      title: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Salom",
                  style: TextStyle(
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
            Text(
              "Qandaharov Alisher",
              style: TextStyle(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontSize: 20),
            ),

          ],
        ),
      ),
      leading: IconButton(
        onPressed: () {},
        icon: const CircleAvatar(
          backgroundImage: AssetImage(
            "assets/images/avatar.png",
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            ThemeService().switchTheme();
            notifyHelper.displayNotification(
                title: "Theme Changed",
                body: Get.isDarkMode
                    ? "Activated Light Theme"
                    : "Activated Dark Theme");
            notifyHelper.scheduledNotification;
          },
          icon: Icon(
            Get.isDarkMode ? Icons.wb_sunny_outlined : Icons.nightlight_round,
            size: 27,
            color: Get.isDarkMode ? Colors.orange : Colors.black,
          ),
        ),
      ],
    );
  }

  _bodyBar() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.theme.backgroundColor,
      ),
      padding: const EdgeInsets.only(top: 60, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sizning jadvalingiz",
            style: TextStyle(
                color: Get.isDarkMode ? Colors.white : Colors.black,
                fontSize: 27,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Kelgusi darslar va vazifalar",
            style: TextStyle(
                color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 20),
          ),
          const SizedBox(height: 25),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: homeController.science.length,
              itemBuilder: (context, index) {
                Data info = homeController.science[index];
                return HomeWidget(
                  startTime: info.startTime.toString(),
                  fan: info.science.toString(),
                  sinf: info.classRoom.toString(),
                  note: info.note!,
                  onChanged: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
