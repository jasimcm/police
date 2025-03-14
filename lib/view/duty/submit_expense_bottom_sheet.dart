import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:policex/view/duty/start_patrol_bottom_sheet.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void showExpenseBottomSheet(BuildContext context) {
  TextEditingController expence_typeController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController receipt_noController = TextEditingController();
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Container(
        height: Get.height * 1.1,
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
          // mainAxisSize: MainAxisSize.min,
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
              textEditingController: expence_typeController,
            ),
            SizedBox(
              height: 16,
            ),
            StartPatrolContainer(
              itemName: 'Amount',
              textEditingController: amountController,
            ),
            SizedBox(
              height: 24,
            ),
            StartPatrolContainer(
              itemName: 'Receipt No.',
              textEditingController: receipt_noController,
            ),
            SizedBox(
              height: 24,
            ),
            GestureDetector(
      onTap: () async {
        try {
          final supabase = Supabase.instance.client;
          if (expence_typeController.text.isEmpty || amountController.text.isEmpty|| receipt_noController.text.isEmpty) {
              log('❌ All fields are required');
              Fluttertoast.showToast(
        msg: "All fields are required",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
            );
              return;
            }
    // ✅ Insert user data into the 'logintable'
    final response = await supabase.from('expense_details').insert({
      'expense_type': expence_typeController.text,
      'amount': amountController.text,
      'receipt_no': receipt_noController.text,
    });

    //if (response.error == null) {
      log('✅ Expense details added successfully');
    // } else {
    //   log('❌ Error inserting user: ${response.error!.message}');
    // }
  }   catch (e) {
        log('❌ Exception: $e');
  }
        Get.back();
      },
      child: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
    ),
          ],
        ),
      );
    },
  );
}
// class StartPatrolContainer extends StatelessWidget {
//   final textEditingController;
//   final String itemName;

//   const StartPatrolContainer({
//     super.key,
//     required this.itemName,
//     required this.textEditingController
//   });
  
//   @override
//   Widget build(BuildContext context) {
//   //TODO: implement build
// //     throw UnimplementedError();
//   }
// }