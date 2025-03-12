import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:PoliceX/view/duty/start_patrol_bottom_sheet.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void showReportBottomSheet(BuildContext context) {
  TextEditingController typeController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Container(height: Get.height * 0.9,
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
              "Report Details",
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
            itemName: 'Type',
              textEditingController: typeController,
            ),
            SizedBox(
              height: 16,
            ),
            StartPatrolContainer(
              itemName: 'Location',
              textEditingController: locationController,
            ),
            SizedBox(
              height: 24,
            ),
            StartPatrolContainer(
              itemName: 'Description',
              textEditingController: descriptionController,
            ),
            SizedBox(
              height: 24,
            ),
            StartPatrolContainer(
              itemName: 'Name',
              textEditingController: nameController,
            ),
            GestureDetector(
              onTap: () async {
        try {
            final supabase = Supabase.instance.client;
            if (locationController.text.isEmpty || descriptionController.text.isEmpty|| typeController.text.isEmpty|| nameController.text.isEmpty) {
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
    final response = await supabase.from('report_details').insert({
      'type': typeController.text,
      'location': locationController.text,
      'description': descriptionController.text,
      'name': nameController.text,
    });

    if (response.error == null) {
      log('✅ User details added successfully');
    } else {
      log('❌ Error inserting user: ${response.error!.message}');
    }
  } catch (e) {
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
    )
          ],
        ),
      );
    },
  );
}

// class StartReportContainer extends StatelessWidget {
//   final textEditingController;
//   final String itemName;

//   const StartReportContainer({
//     super.key,
//     required this.itemName,
//     required this.textEditingController
//   });
  
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
// }