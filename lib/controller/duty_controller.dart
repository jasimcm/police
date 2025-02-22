import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DutyController extends GetxController {
  int dutyIndex = 0;

  final tabBars = ['Active', 'Closed', 'All'];

  final List<Map<String, dynamic>> cases = [
    {
      'name': 'KNM/2024/07489',
      'color': Colors.red,
      'status': true,
    },
    {
      'name': 'EKM/2024/02234',
      'color': Colors.green,
      'status': false,
    },
    {
      'name': 'TVM/2023/23405',
      'color': Colors.blue,
      'status': true,
    },
    {
      'name': 'THR/2023/23450',
      'color': Colors.grey,
      'status': true,
    },
    {
      'name': 'EKM/2024/02234',
      'color': Colors.green,
      'status': false,
    },
    {
      'name': 'TVM/2023/23405',
      'color': Colors.blue,
      'status': true,
    },
    {
      'name': 'THR/2023/23450',
      'color': Colors.grey,
      'status': true,
    },
  ];

  setDutyIndex(int index) {
    dutyIndex = index;
    update(['duty_tabs']);
  }
}
