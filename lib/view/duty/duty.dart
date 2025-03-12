import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:PoliceX/controller/duty_controller.dart';
import 'package:PoliceX/controller/user_controller.dart';
import 'package:PoliceX/core/router/router.dart';
import 'package:PoliceX/view/common_widgets/case_item.dart';
import 'package:PoliceX/view/duty/file_report_bottom_sheet.dart';
import 'package:PoliceX/view/duty/log_incident_bottom_sheet.dart';
import 'package:PoliceX/view/duty/start_patrol_bottom_sheet.dart';
import 'package:PoliceX/view/duty/submit_expense_bottom_sheet.dart';

class DutySchedulePage extends StatefulWidget {
  const DutySchedulePage({super.key});

  @override
  State<DutySchedulePage> createState() => _DutySchedulePageState();
}

class _DutySchedulePageState extends State<DutySchedulePage> {
  final DutyController dutyController = Get.find<DutyController>();
  final List<Map<String, dynamic>> quickActions = [
    {
      'actionIcon': Icon(
        Icons.access_time_rounded,
        color: Colors.teal,
        size: 28,
      ),
      'actionName': 'Duty Scheduler',
    },
    {
      'actionIcon': Icon(
        Icons.local_police_outlined,
        color: Colors.blueAccent,
        size: 28,
      ),
      'actionName': 'Start Patrol',
    },
    {
      'actionIcon': Icon(
        Icons.article_rounded,
        color: Colors.yellowAccent,
        size: 28,
      ),
      'actionName': 'File Report',
    },
    {
      'actionIcon': Icon(
        Icons.report_problem,
        color: Colors.redAccent,
        size: 28,
      ),
      'actionName': 'Log Incident',
    },
    {
      'actionIcon': Icon(
        Icons.monetization_on_rounded,
        color: Colors.lightGreen,
        size: 28,
      ),
      'actionName': 'Submit Duty Expenses',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.only(
          top: Get.mediaQuery.padding.top * 1.25,
          bottom: 0,
          // left: 16,
          // right: 16,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 100,
              child: GetBuilder<UserController>(builder: (userController) {
                return ListView.separated(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  separatorBuilder: (BuildContext context, int index) {
                    if (index == 0 && userController.isAdminUser == false) {
                      return SizedBox();
                    }
                    return SizedBox(
                      width: 16,
                    );
                  },
                  itemCount: quickActions.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0 && userController.isAdminUser == false) {
                      return SizedBox();
                    }
                    return GestureDetector(
                      onTap: () {
                        switch (index) {
                          case 0:
                            Get.toNamed(RouterName.scheduler);
                          case 1:
                            showPatrolBottomSheet(context);
                          case 2:
                            showReportBottomSheet(context);
                          case 3:
                            showLogIncidentBottomSheet(context);
                          case 4:
                            showExpenseBottomSheet(context);
                        }
                      },
                      child: Container(
                        width: 100,
                        // height: 120,
                        padding: EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey.withOpacity(0.3),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            quickActions[index]['actionIcon'],
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              quickActions[index]['actionName'],
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              softWrap: true,
                              overflow: TextOverflow.fade,
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SizedBox(
                    height: 32,
                  ),
                  GetBuilder<DutyController>(
                      id: 'duty_tabs',
                      builder: (dutyController) {
                        return Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(32),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.3),
                                  width: 0.5,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 12,
                                  right: 12,
                                  bottom: 12,
                                  top: 12,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        dutyController.setDutyIndex(0);
                                      },
                                      child: Text(
                                        dutyController.tabBars[0],
                                        style: TextStyle(
                                          color: dutyController.dutyIndex == 0
                                              ? Colors.white
                                              : Colors.white.withOpacity(0.5),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        dutyController.setDutyIndex(1);
                                      },
                                      child: Text(
                                        dutyController.tabBars[1],
                                        style: TextStyle(
                                          color: dutyController.dutyIndex == 1
                                              ? Colors.white
                                              : Colors.white.withOpacity(0.5),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        dutyController.setDutyIndex(2);
                                      },
                                      child: Text(
                                        dutyController.tabBars[2],
                                        style: TextStyle(
                                          color: dutyController.dutyIndex == 2
                                              ? Colors.white
                                              : Colors.white.withOpacity(0.5),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            SizedBox(
                              height: Get.height * 0.6,
                              child: ListView.separated(
                                // physics: NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                itemCount: dutyController.cases.length,
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  switch (dutyController.dutyIndex) {
                                    case 0:
                                      if (dutyController.cases[index]
                                          ['status']) {
                                        return SizedBox(
                                          height: 4,
                                        );
                                      } else {
                                        return SizedBox();
                                      }
                                    case 1:
                                      if (!dutyController.cases[index]
                                          ['status']) {
                                        return SizedBox(
                                          height: 4,
                                        );
                                      } else {
                                        return SizedBox();
                                      }
                                    case 2:
                                      return SizedBox(
                                        height: 4,
                                      );
                                    default:
                                      return SizedBox();
                                  }
                                },
                                itemBuilder: (context, index) {
                                  return CaseItem(
                                        dutyController.cases[index]['id'].toString(),
                                        Colors.red,
                                      );
                                },
                              ),
                            ),
                          ],
                        );
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String label;
  final Color color;

  const FilterButton(this.label, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(backgroundColor: color),
      child: Text(label),
    );
  }
}
