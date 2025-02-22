import 'package:get/get.dart';
import 'package:police/controller/duty_controller.dart';
import 'package:police/controller/home_controller.dart';
import 'package:police/controller/scheduler_controller.dart';
import 'package:police/controller/settings_controller.dart';
import 'package:police/controller/user_controller.dart';

Future<void> initDi() async {
  Get.put(HomeController());
  Get.put(UserController());
  Get.put(DutyController());
  Get.put(SchedulerController());
  Get.put(SettingsController());
}
