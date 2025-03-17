import 'dart:developer';

import 'package:PoliceX/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DutyController extends GetxController {
  final UserController userController = Get.find<UserController>();
  final _supabaseClient = Supabase.instance.client;

  List<Map<String, dynamic>> cases = [];
  int dutyIndex = 0;
  final tabBars = ['Active', 'Closed', 'All'];

  @override
  void onInit() {
    super.onInit();
    fetchReports(); // Fetch reports when the controller is initialized
  }

  Future<void> fetchReports() async {
    log('Fetching reports');
    try {
      final response = await _supabaseClient
          .from('report_details')
          .select()
          .filter('kid', 'eq', userController.userResult['kid']);
      
      log('Fetched ${response.length} reports');
      cases = response;
      update(['duty_tabs']); // Update the UI after fetching reports
    } catch (e) {
      log('Error fetching report history', error: e.toString());
      cases = []; // Reset cases on error
      update(['duty_tabs']); // Update the UI to reflect the error
    }
  }

  void setDutyIndex(int index) {
    dutyIndex = index;
    update(['duty_tabs']);
  }
}
