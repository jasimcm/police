import 'dart:developer';

import 'package:PoliceX/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DutyController extends GetxController {

final UserController userController = Get.find<UserController>();

final _supabaseClient = Supabase.instance.client;

  Future<void> fetchReports() async {
    log('Fetching reports');
    try {
      final response = await _supabaseClient
          .from('report_details')
          .select().filter('kid','eq',userController.userResult['kid']);
      
      log('Fetched ${response.length} repoorts');
      cases = response;
    } catch (e) {
      log('Error fetching report history', error: e.toString());
      throw e;
    }
  }


  @override
  onInit(){
    super.onInit();
  }
  int dutyIndex = 0;

  final tabBars = ['Active', 'Closed', 'All'];

  List<Map<String, dynamic>> cases = [
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
