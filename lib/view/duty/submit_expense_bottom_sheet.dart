import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:policex/view/duty/start_patrol_bottom_sheet.dart';

void showExpenseBottomSheet(BuildContext context) {
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
              "Expense Details",
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
              itemName: 'Expense Type',
              textEditingController: TextEditingController(),
            ),
            SizedBox(
              height: 16,
            ),
            StartPatrolContainer(
              itemName: 'Amount',
              textEditingController: TextEditingController(),
            ),
            SizedBox(
              height: 24,
            ),
            StartPatrolContainer(
              itemName: 'Receipt No.',
              textEditingController: TextEditingController(),
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
