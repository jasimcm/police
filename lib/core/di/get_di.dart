import 'package:get/get.dart';
import 'package:policex/controller/duty_controller.dart';
import 'package:policex/controller/home_controller.dart';
import 'package:policex/controller/scheduler_controller.dart';
import 'package:policex/controller/settings_controller.dart';
import 'package:policex/controller/user_controller.dart';


Future<void> initDi() async {
  Get.put(HomeController());
  Get.put(UserController());
  Get.put(DutyController());
  Get.put(SchedulerController());
  Get.put(SettingsController());
}
