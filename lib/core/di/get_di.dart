import 'package:get/get.dart';
import 'package:PoliceX/controller/duty_controller.dart';
import 'package:PoliceX/controller/home_controller.dart';
import 'package:PoliceX/controller/scheduler_controller.dart';
import 'package:PoliceX/controller/settings_controller.dart';
import 'package:PoliceX/controller/user_controller.dart';


Future<void> initDi() async {
  Get.put(HomeController());
  Get.put(UserController());
  Get.put(DutyController());
  // Get.put(SchedulerController());
  Get.put(SettingsController());
}
