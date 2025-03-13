import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:policex/view/duty/start_patrol_bottom_sheet.dart';

void showLogIncidentBottomSheet(BuildContext context) {
  // Init text editing controllers here
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Container(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: Get.mediaQuery.padding.bottom,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(12),
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0, 1],
            colors: [
              Color(0xFF16151B),
              Color(0xFF000000),
            ],
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Opacity(
                  opacity: 0.5,
                  child: Container(
                    width: 40,
                    height: 6,
                    decoration: ShapeDecoration(
                      color: Colors.white.withOpacity(0.75),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Text(
              "Incident Details",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            StartPatrolContainer(
              itemName: 'Location',
              textEditingController: TextEditingController(),
            ),
            SizedBox(
              height: 16,
            ),
            StartPatrolContainer(
              itemName: 'Description',
              textEditingController: TextEditingController(),
            ),
            SizedBox(
              height: 24,
            ),
            Container(
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
                    'Time',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.7,
                    height: Get.width * 0.3,
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.dateAndTime,
                      initialDateTime: DateTime.now(),
                      maximumDate: DateTime.now().add(Duration(seconds: 1)),
                      minimumDate: DateTime.now().subtract(Duration(days: 1)),
                      onDateTimeChanged: (value) {},
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 24,
            ),
            BottomSheetSubmitButton(),
          ],
        ),
      );
    },
  );
}
