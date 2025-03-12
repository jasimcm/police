import 'dart:developer' as developer;

import 'package:get/get.dart';
import 'package:PoliceX/controller/user_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AttendanceService {
  final SupabaseClient _supabaseClient;
  static const String _checkInTimeKey = 'check_in_time';
  static const String _isCheckedInKey = 'is_checked_in';
  static const String _logTag = 'AttendanceService';

  AttendanceService(this._supabaseClient);

  // Check if the user is currently checked in
  Future<bool> isCheckedIn() async {
    // return true;
    final prefs = await SharedPreferences.getInstance();
    final isCheckedIn = prefs.getBool(_isCheckedInKey) ?? false;
    developer.log('Checking if user is checked in: $isCheckedIn', name: _logTag);
    return isCheckedIn;
  }

  // Record check-in time in local storage
  Future<void> checkIn() async {
    developer.log('Starting check-in process', name: _logTag);
    final prefs = await SharedPreferences.getInstance();
    final now = DateTime.now().toIso8601String();
    
    developer.log('Setting check-in time: $now', name: _logTag);
    await prefs.setString(_checkInTimeKey, now);
    await prefs.setBool(_isCheckedInKey, true);
    developer.log('Check-in successful', name: _logTag);
  }

  // Record check-out and save to Supabase
  Future<void> checkOut() async {
    developer.log('Starting check-out process', name: _logTag);
    final prefs = await SharedPreferences.getInstance();
    final checkInTimeStr = prefs.getString(_checkInTimeKey);
    
    if (checkInTimeStr == null) {
      developer.log('Error: No check-in time found', name: _logTag, error: 'Missing check-in data');
      throw Exception('No check-in time found');
    }
    
    final checkInTime = DateTime.parse(checkInTimeStr);
    final checkOutTime = DateTime.now();
    
    developer.log('Check-in time: $checkInTimeStr', name: _logTag);
    developer.log('Check-out time: ${checkOutTime.toIso8601String()}', name: _logTag);
    
    // Calculate total hours
    final difference = checkOutTime.difference(checkInTime);
    final totalHours = difference.inMinutes / 60.0;
    developer.log('Total hours calculated: $totalHours', name: _logTag);
    
    // Insert record into Supabase
    try {
      final UserController userController = Get.find<UserController>();
      developer.log('Sending data to Supabase', name: _logTag);
      await _supabaseClient.from('attendance_tracker').insert({
        'user_id': userController.userResult['kid'],
        'check_in': checkInTime.toIso8601String(),
        'check_out': checkOutTime.toIso8601String(),
        'total_hours': totalHours,
      });
      developer.log('Successfully inserted record into Supabase', name: _logTag);
    } catch (e, stackTrace) {
      developer.log('Error inserting record into Supabase $stackTrace', name: _logTag, error: e.toString());
      throw e;
    }
    
    // Clear the stored check-in state
    await prefs.remove(_checkInTimeKey);
    await prefs.setBool(_isCheckedInKey, false);
    developer.log('Cleared check-in state from local storage', name: _logTag);
  }
  
  // Get attendance history for current user
  Future<List<dynamic>> getAttendanceHistory() async {
    developer.log('Fetching attendance history', name: _logTag);
    try {
      final response = await _supabaseClient
          .from('attendance')
          .select()
          .order('check_in', ascending: false);
      
      developer.log('Fetched ${response.length} attendance records', name: _logTag);
      return response;
    } catch (e) {
      developer.log('Error fetching attendance history', name: _logTag, error: e.toString());
      throw e;
    }
  }
}