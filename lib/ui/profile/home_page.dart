import 'package:app/controller/task_controller.dart';
import 'package:app/models/task_model.dart';
import 'package:app/services/notification_services.dart';
import 'package:app/services/theme_service.dart';
import 'package:app/ui/add_task_bar.dart';
import 'package:app/ui/theme.dart';
import 'package:app/ui/widgets/button.dart';
import 'package:app/ui/widgets/task_tile.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var notifyHelper;

  @override
  void initState() {
    super.initState();
    notifyHelper = NotifyHelper();
    notifyHelper.requestIOSPermissions();
    notifyHelper.initializeNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: _appBar(),
      body: _bodyBar(),
    );
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
                      color: Get.isDarkMode?Colors.white:Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
            Text(
              "Qandaharov Alisher",
              style: TextStyle(color: Get.isDarkMode?Colors.white:Colors.black, fontSize: 20),
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
            notifyHelper.scheduledNotification();
          },
          icon: Padding(
            padding: const EdgeInsets.only(right: 30, top: 20),
            child: Icon(
              Get.isDarkMode ? Icons.wb_sunny_outlined : Icons.nightlight_round,
              size: 27,
              color: Get.isDarkMode ? Colors.orange : Colors.black,
            ),
          ),
        ),
      ],
    );
  }
  _bodyBar() {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.infinity,
            decoration: BoxDecoration(color: context.theme.backgroundColor,
            ),
            padding: const EdgeInsets.only(top: 60, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Text(
                  "Sizning jadvalingiz",
                  style: TextStyle(
                      color: Get.isDarkMode ? Colors.white:Colors.black,
                      fontSize: 27,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Kelgusi darslar va vazifalar",
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 20),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
