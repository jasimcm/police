import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:police/controller/scheduler_controller.dart';
import 'package:police/view/duty/start_patrol_bottom_sheet.dart';

class SchedulerPage extends StatefulWidget {
  const SchedulerPage({super.key});

  @override
  State<SchedulerPage> createState() => _SchedulerPageState();
}

class _SchedulerPageState extends State<SchedulerPage> {
  final SchedulerController schedulerController =
      Get.find<SchedulerController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
            'Schedule - ${DateFormat('dd MMM yyyy').format(DateTime.now().add(Duration(days: 1)))}'),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.only(
          top: 24,
          left: 16,
          right: 16,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Officer'),
                  Row(
                    children: [
                      Text('Day'),
                      SizedBox(
                        width: 36,
                      ),
                      Text('Night')
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 12,
            ),
            SizedBox(
              height: Get.height * 0.725,
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: Get.width,
                    padding: EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.1),
                          blurRadius: 5,
                          spreadRadius: 0.5,
                        )
                      ],
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0, 1],
                        colors: [
                          Color(0xFF16151B),
                          Color(0xFF000000),
                        ],
                      ),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.2),
                        width: 0.5,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          schedulerController.officersShift[index]['name'],
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          children: [
                            // Day
                            GestureDetector(
                              onTap: () {
                                schedulerController.setUserShift(index, 'Day');
                              },
                              child: Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
                                  Container(
                                    width: 16,
                                    height: 16,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white.withOpacity(0.5),
                                      ),
                                    ),
                                  ),
                                  GetBuilder<SchedulerController>(
                                    id: 'user_shifts',
                                    builder: (sc) {
                                      if (sc.officersShift[index]['shift'] ==
                                          'Day') {
                                        return Icon(
                                          Icons.check_rounded,
                                          size: 28,
                                          color: Color(0xFF0A84FF),
                                        );
                                      } else {
                                        return Icon(
                                          Icons.check_rounded,
                                          size: 28,
                                          color: Colors.transparent,
                                        );
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 48,
                            ),
                            // Night
                            GestureDetector(
                              onTap: () {
                                schedulerController.setUserShift(
                                    index, 'Night');
                              },
                              child: Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
                                  Container(
                                    width: 16,
                                    height: 16,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white.withOpacity(0.5),
                                      ),
                                    ),
                                  ),
                                  GetBuilder<SchedulerController>(
                                    id: 'user_shifts',
                                    builder: (sc) {
                                      if (sc.officersShift[index]['shift'] ==
                                          'Night') {
                                        return Icon(
                                          Icons.check_rounded,
                                          size: 28,
                                          color: Color(0xFF0A84FF),
                                        );
                                      } else {
                                        return Icon(
                                          Icons.check_rounded,
                                          size: 28,
                                          color: Colors.transparent,
                                        );
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
                itemCount: schedulerController.officersShift.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 16,
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    schedulerController.resetOfficerShifts();
                  },
                  child: Center(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      width: Get.width * 0.4,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          color: Colors.white,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Center(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      width: Get.width * 0.4,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          color: Colors.white,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Submit",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      )),
    );
  }
}
