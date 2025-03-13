
import 'package:get/get.dart';

class SchedulerController extends GetxController {
  List<Map<String, dynamic>> officersShift = [
    {
      'name': 'Jasim',
      'shift': null,
    },
    {
      'name': 'Nahyan',
      'shift': null,
    },
    {
      'name': 'Rahul',
      'shift': null,
    },
    {
      'name': 'Rohith',
      'shift': null,
    },
  ];

  setUserShift(int index, String shift) {
    officersShift[index]['shift'] = shift;
    update(['user_shifts']);
  }

  resetOfficerShifts() {
    officersShift = [
      {'name': 'Jasim', 'shift': null},
      {'name': 'Nahyan', 'shift': null},
      {'name': 'Rahul', 'shift': null},
      {'name': 'Rohith', 'shift': null},
    ];
    update(['user_shifts']);
  }
}
