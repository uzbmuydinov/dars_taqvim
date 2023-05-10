import 'package:app/ui/navigation/main_navigation_controller.dart';
import 'package:app/ui/profile/home_page.dart';
import 'package:app/ui/profile/planning_page.dart';
import 'package:app/ui/profile/profile_page.dart';
import 'package:app/ui/profile/table_page.dart';
import 'package:app/ui/theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class NavigationPage extends StatelessWidget {
  NavigationPage({Key? key}) : super(key: key);

  final NavigationPageController controller =
      Get.put(NavigationPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          onPageChanged: controller.animateToTab,
          controller: controller.pageController,
          children: const [
            HomePage(),
            TablePage(),
            PlanningPage(),
            ProfilePage(),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          notchMargin: 10,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
            child: Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _bottomAppBarItem(context,
                      icon: Icons.home, page: 0, label: "Asosiy"),
                  _bottomAppBarItem(context,
                      icon: Icons.date_range_outlined,
                      page: 1,
                      label: "Jadval"),
                  _bottomAppBarItem(context,
                      icon: Icons.score_rounded,
                      page: 2,
                      label: "Rejalashtirish"),
                  _bottomAppBarItem(context,
                      icon: Icons.person, page: 3, label: "Profile"),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _bottomAppBarItem(BuildContext context,
      {required icon, required page, required label}) {
    return ZoomTapAnimation(
      onTap: () => controller.goToTab(page),
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: controller.currentPage.value == page
                  ? appColors
                  : Colors.grey,
            ),
            Text(
              label,
              style: TextStyle(
                  color: controller.currentPage.value == page
                      ? appColors
                      : Colors.grey,
                  fontSize: 13,
                  fontWeight: controller.currentPage.value == page
                      ? FontWeight.w600
                      : null),
            ),
          ],
        ),
      ),
    );
  }
}
