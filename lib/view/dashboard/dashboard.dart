import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:police/controller/duty_controller.dart';
import 'package:police/controller/user_controller.dart';
import 'package:police/core/images/images.dart';
import 'package:police/view/common_widgets/case_item.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final DutyController dutyController = Get.find<DutyController>();
  final UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Get.height * 0.335,
                  ),
                  Text(
                    'Active Cases',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 16),
                  Container(
                    height: Get.height * 0.31,
                    child: ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: 4,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 4,
                        );
                      },
                      itemBuilder: (context, index) {
                        return CaseItem(
                          dutyController.cases[index]['name'],
                          dutyController.cases[index]['color'],
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    // TO PREVENT ANY CONTENTS BEING HIDDEN BY THE NAVBAR
                    height: MediaQuery.of(context).padding.bottom * 3,
                  )
                ],
              ),
            ),
          ),
          topBar(context),
        ],
      ),
    );
  }

  Container topBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color.fromARGB(255, 93, 206, 181),
              const Color.fromARGB(255, 47, 118, 194),
            ],
            stops: [
              0.3,
              1
            ]),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(32), bottomRight: Radius.circular(32)),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(3),
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
                      child: ClipOval(
                        clipBehavior: Clip.antiAlias,
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: FittedBox(
                            fit: BoxFit
                                .cover, // Ensure the image covers the circular area
                            child: Image.asset(
                              Images.demoDP,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Shahjahan P",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      Text(
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
              GetBuilder<UserController>(
                id: 'checkin_status',
                builder: (userController) {
                  switch (userController.isCheckedIn) {
                    case true:
                      return Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.green.withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.green.withOpacity(0.9),
                        ),
                        child: Text(
                          'On Duty',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      );
                    case false:
                      return Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.red.withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.red.withOpacity(0.9),
                        ),
                        child: Text(
                          'Off Duty',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      );
                  }
                },
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            color: Colors.black.withOpacity(0.1),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.calendar_month_outlined,
                    size: 20,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    DateFormat("d MMMM, y")
                        .format(DateTime.parse(DateTime.now().toString())),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                decoration: BoxDecoration(
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.white.withOpacity(0.15),
                  //     // offset: Offset(0, 5),
                  //     blurRadius: 5,
                  //     spreadRadius: 5,
                  //   )
                  // ],
                  border: Border.all(
                    color: Colors.white,
                    width: 0.75,
                  ),
                  borderRadius: BorderRadius.circular(50),
                  // color: Colors.black.withOpacity(0.5),
                ),
                child: GetBuilder<UserController>(
                    id: 'work_shift',
                    builder: (userController) {
                      return Text(
                        '${userController.workShift['name']} Shift',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      );
                    }),
              )
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            DateFormat("hh:mm a").format(DateTime.now()),
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          GestureDetector(
            onTap: () {
              userController.setCheckInStatus(!userController.isCheckedIn);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              width: Get.width,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.2),
                    // offset: Offset(0, 5),
                    blurRadius: 20,
                    spreadRadius: 5,
                  )
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.fingerprint_rounded,
                      color: Colors.black,
                      size: 30,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    GetBuilder<UserController>(
                      id: 'checkin_status',
                      builder: (userController) {
                        switch (userController.isCheckedIn) {
                          case true:
                            return Text(
                              "Check-Out",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            );
                          case false:
                            return Text(
                              "Check-In",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
