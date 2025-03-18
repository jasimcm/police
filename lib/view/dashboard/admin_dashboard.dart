import 'package:PoliceX/controller/user_controller.dart';
import 'package:PoliceX/view/dashboard/expense_details_page.dart';
import 'package:PoliceX/view/dashboard/incident_log_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:PoliceX/controller/user_controller.dart';
import 'package:PoliceX/services/attendance_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'reports_filed_page.dart';
import 'patrol_details_page.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  final UserController userController = Get.find<UserController>();
  DateTime currentTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    _startTimeUpdater();
  }

  void _startTimeUpdater() {
    Future.delayed(const Duration(minutes: 1), () {
      if (mounted) {
        setState(() {
          currentTime = DateTime.now();
        });
        _startTimeUpdater();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 16, 0, 0),
      body: SafeArea(
        child: Stack(
          children: [
            _buildContent(),
            const SizedBox(height: 16),
           _topBar(), 
          ],
        ),
      ),
    );
  }

  Widget _topBar() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 93, 206, 181),
            Color.fromARGB(255, 47, 118, 194),
          ],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      width: Get.width,
      height: Get.height * 0.335,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        left: 16,
        right: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User Info Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, color: Colors.black),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userController.userResult['Name'] ?? 'Admin User',
                        style: _textStyle(20, FontWeight.w700),
                      ),
                      Text(
                        userController.userResult['rank'] ?? 'Administrator',
                        style: _textStyle(12, FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
              // On Duty Status
              GetBuilder<UserController>(
                id: 'checkin_status',
                builder: (controller) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: controller.isCheckedIn
                            ? Colors.green.withOpacity(0.5)
                            : Colors.red.withOpacity(0.5),
                      ),
                      borderRadius: BorderRadius.circular(50),
                      color: controller.isCheckedIn
                          ? Colors.green.withOpacity(0.9)
                          : Colors.red.withOpacity(0.9),
                    ),
                    child: Text(
                      controller.isCheckedIn ? 'On Duty' : 'Off Duty',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Divider
          Divider(color: Colors.white.withOpacity(0.1)),
          const SizedBox(height: 10),

          // Date and Shift Info
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.calendar_today_outlined,
                    size: 20,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    DateFormat("d MMMM y").format(currentTime),
                    style: _textStyle(16, FontWeight.w400),
                  ),
                ],
              ),
              GetBuilder<UserController>(
                id: 'work_shift',
                builder: (controller) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 2),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 0.75),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      '${controller.workShift['name']} Shift',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Current Time
          Text(
            DateFormat("hh:mm a").format(currentTime),
            style: _textStyle(32, FontWeight.w700),
          ),
          const SizedBox(height: 12),

          // Check-In/Check-Out Button
          GestureDetector(
            onTap: () async {
              final supabaseClient = Supabase.instance.client;
              AttendanceService attendanceService =
                  AttendanceService(supabaseClient);

              if (await attendanceService.isCheckedIn()) {
                await attendanceService.checkOut();
              } else {
                await attendanceService.checkIn();
              }

              await userController.setCheckInStatus(
                  !userController.isCheckedIn);
            },
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              width: Get.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.2),
                    blurRadius: 20,
                    spreadRadius: 5,
                  )
                ],
              ),
              child: Center(
                child: GetBuilder<UserController>(
                  id: 'checkin_status',
                  builder: (controller) {
                    return Text(
                      controller.isCheckedIn ? 'Check-Out' : 'Check-In',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  SingleChildScrollView _buildContent() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 370, bottom: 100),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // _buildDashboardButton(
            //   icon: Icons.folder_open,
            //   label: 'Cases',
            //   color: Colors.blue,
            //   onTap: () => Get.toNamed('/cases'),
            // ),
            // const SizedBox(height: 12),
            _buildDashboardButton(
              icon: Icons.assignment,
              label: 'Reports Filed',
              color: Colors.green,
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>ReportsFiledPage())),
            ),
            const SizedBox(height: 12),
            _buildDashboardButton(
              icon: Icons.car_crash_rounded,
              label: 'Patrol Details',
              color: Colors.orange,
              onTap: () => Get.toNamed('/patrol-details'),
            ),
            const SizedBox(height: 12),
            _buildDashboardButton(
              icon: Icons.schedule,
              label: 'Duty Schedule',
              color: Colors.purple,
              onTap: () => Get.toNamed('/duty-schedule'),
            ),
            const SizedBox(height: 12),
            _buildDashboardButton(
              icon: Icons.event_note,
              label: 'Incident Log',
              color: Colors.red,
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>IncidentLogPage())),
            ),
            const SizedBox(height: 12),
            _buildDashboardButton(
              icon: Icons.attach_money,
              label: 'Duty Expense',
              color: Colors.teal,
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>ExpenseDetailsPage(),),),
            ),
            
          ],
        ),
      ),
    );
  }

  TextStyle _textStyle(double size, FontWeight weight) {
    return TextStyle(fontSize: size, fontWeight: weight, color: Colors.white);
  }
}

Widget _buildDashboardButton({
  required IconData icon,
  required String label,
  required Color color,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(icon, size: 32, color: color),
            const SizedBox(width: 12),
            Text(
              label,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}


  TextStyle _textStyle(double size, FontWeight weight) {
    return TextStyle(
      fontSize: size,
      fontWeight: weight,
      color: Colors.white,
    );
  }
