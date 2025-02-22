import 'package:get/get.dart';

class UserController extends GetxController {
  // Constants
  final List<Map<String, dynamic>> workShifts = [
    {'name': 'Morning', 'hours': '06:00AM - 06:00PM'},
    {'name': 'Evening', 'hours': '06:00PM - 06:00AM'},
  ];

  // Variables
  bool isCheckedIn = false;
  bool isAdminUser = true;
  Map<String, dynamic> workShift = {
    'name': 'Morning',
    'hours': '06:00AM - 06:00PM'
  };

  // Functions
  setCheckInStatus(bool status) {
    isCheckedIn = status;
    update(['checkin_status']);
  }

  setWorkShift(int shiftIndex) {
    workShift = workShifts[shiftIndex];

    update(['work_shift']);
  }

  setAdminUser(bool value) {
    isAdminUser = value;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    setWorkShift(0);
  }
}
