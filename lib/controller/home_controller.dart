import 'package:get/get.dart';

class HomeController extends GetxController {
  int homeIndex = 0;

  setHomeIndex(int index) {
    homeIndex = index;
    update(['home']);
  }
}
