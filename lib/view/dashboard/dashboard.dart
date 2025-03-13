import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:policex/controller/duty_controller.dart';
import 'package:policex/controller/user_controller.dart';
import 'package:policex/core/images/images.dart';
import 'package:policex/view/common_widgets/case_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final DutyController dutyController = Get.find<DutyController>();
  final UserController userController = Get.find<UserController>();

  String officerName = ''; // ✅ Variable to store officer's name

  @override
  void initState() {
    super.initState();
    loadOfficerName(); // ✅ Load officer's name on init
  }

  /// ✅ Load officer's name from SharedPreferences
  Future<void> loadOfficerName() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      officerName = userController.userResult['Name'] ?? 'Officer';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Get.height * 0.335,
                  ),
                  const Text(
                    'Active Cases',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: Get.height * 0.31,
                    child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: dutyController.cases.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(height: 4);
                      },
                      itemBuilder: (context, index) {
                        return CaseItem(
                          dutyController.cases[index]['name'],
                          dutyController.cases[index]['color'],
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: MediaQuery.of(context).padding.bottom * 3,
                  ),
                ],
              ),
            ),
          ),
          topBar(context),
        ],
      ),
    );
  }

  /// ✅ Top Bar Section
  Container topBar(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 93, 206, 181),
            Color.fromARGB(255, 47, 118, 194),
          ],
          stops: [0.3, 1],
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
          // ✅ Officer Name and Profile Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        color: Colors.white,
                        width: 2.5,
                      ),
                    ),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(Images.demoDP),
                      radius: 24,
                      backgroundColor: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userController.userResult['Name'] ?? 'Officer',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        "Circle Inspector",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              // ✅ Duty Status
              GetBuilder<UserController>(
                id: 'checkin_status',
                builder: (userController) {
                  return Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: userController.isCheckedIn
                            ? Colors.green.withOpacity(0.5)
                            : Colors.red.withOpacity(0.5),
                      ),
                      borderRadius: BorderRadius.circular(50),
                      color: userController.isCheckedIn
                          ? Colors.green.withOpacity(0.9)
                          : Colors.red.withOpacity(0.9),
                    ),
                    child: Text(
                      userController.isCheckedIn ? 'On Duty' : 'Off Duty',
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
          Divider(color: Colors.black.withOpacity(0.1)),
          const SizedBox(height: 10),

          // ✅ Date and Time Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.calendar_month_outlined,
                    size: 20,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    DateFormat("d MMMM, y").format(DateTime.now()),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              GetBuilder<UserController>(
                id: 'work_shift',
                builder: (userController) {
                  return Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 0.75),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      '${userController.workShift['name']} Shift',
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
          Text(
            DateFormat("hh:mm a").format(DateTime.now()),
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),

          // ✅ Check-In/Check-Out Button
          GestureDetector(
            onTap: () {
              userController.setCheckInStatus(!userController.isCheckedIn);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              width: Get.width,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.2),
                    blurRadius: 20,
                    spreadRadius: 5,
                  )
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: GetBuilder<UserController>(
                  id: 'checkin_status',
                  builder: (context) {
                    return Text(
                      userController.isCheckedIn ? 'Check-Out' : 'Check-In',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    );
                  }
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
