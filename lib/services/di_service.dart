import 'package:app/app_controller/register_controller.dart';
import 'package:get/get.dart';

import '../app_controller/add_task_controller.dart';

class DIService {
  static Future<void> init() async {
    Get.lazyPut<RegisterController>(() => RegisterController(), fenix: true);
    Get.lazyPut<AddTaskController>(() => AddTaskController(), fenix: true);
    // Get.lazyPut<DetailController>(() => DetailController(), fenix: true);
  }
}