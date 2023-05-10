import 'package:app/ui/profile/home_page.dart';
import 'package:app/ui/profile/planning_page.dart';
import 'package:app/ui/profile/profile_page.dart';
import 'package:app/ui/profile/table_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';




class NavigationPageController extends GetxController {
  late PageController pageController;

  RxInt currentPage = 0.obs;
  RxBool isDarkTheme = false.obs;



  void switchTheme(ThemeMode mode) {
    Get.changeThemeMode(mode);
  }

  void goToTab(int page) {
    currentPage.value = page;
    pageController.jumpToPage(page);
  }
  void animateToTab(int page) {
    currentPage.value = page;
    pageController.animateToPage(page,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease);
  }

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    super.onInit();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}