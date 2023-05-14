import 'package:app/app_controller/register_controller.dart';
import 'package:get/get.dart';

import '../app_controller/add_task_controller.dart';
import '../app_controller/home_controller.dart';
import '../app_controller/sign_in_controller.dart';

class DIService {
  static Future<void> init() async {
    Get.lazyPut<RegisterController>(() => RegisterController(), fenix: true);
    Get.lazyPut<AddTaskController>(() => AddTaskController(), fenix: true);
    Get.lazyPut<SignInController>(() => SignInController(), fenix: true);
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
  }
}