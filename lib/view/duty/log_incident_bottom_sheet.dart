import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:policex/view/duty/start_patrol_bottom_sheet.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void showLogIncidentBottomSheet(BuildContext context) {
  TextEditingController locationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  // Init text editing controllers here
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
              textEditingController: locationController,
            ),
            SizedBox(
              height: 16,
            ),
            StartPatrolContainer(
              itemName: 'Description',
              textEditingController: descriptionController,
            ),
            SizedBox(
              height: 24,
            ),
            StartPatrolContainer(
              itemName: 'Time (HH:MM:SS)',
              textEditingController: timeController,
            ),
            SizedBox(
              height: 24,
            ),
            StartPatrolContainer(
              itemName: 'Date (YYYY-MM-DD)',
              textEditingController: dateController,
            ),
            SizedBox(
              height: 24,
            ),
            // Container(
            //   width: Get.width,
            //   padding: EdgeInsets.symmetric(
            //     vertical: 16,
            //     horizontal: 20,
            //   ),
            //   decoration: BoxDecoration(
            //     boxShadow: [
            //       BoxShadow(
            //         color: Colors.white.withOpacity(0.1),
            //         blurRadius: 5,
            //         spreadRadius: 0.5,
            //       )
            //     ],
            //     gradient: LinearGradient(
            //       begin: Alignment.topCenter,
            //       end: Alignment.bottomCenter,
            //       stops: [0, 1],
            //       colors: [
            //         Color(0xFF16151B),
            //         Color(0xFF000000),
            //       ],
            //     ),
            //     border: Border.all(
            //       color: Colors.white.withOpacity(0.2),
            //       width: 0.5,
            //     ),
            //     borderRadius: BorderRadius.circular(12),
            //   ),
              // child: Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
                  // Text(
                  //   'Time',
                  //   style: TextStyle(
                  //     fontSize: 18,
                  //     color: Colors.white,
                  //     fontWeight: FontWeight.w500,
                  //   ),
                  // ),
                  // SizedBox(
                  //   width: Get.width * 0.7,
                  //   height: Get.width * 0.3,
                  //   child: CupertinoDatePicker(
                  //     mode: CupertinoDatePickerMode.dateAndTime,
                  //     initialDateTime: DateTime.now(),
                  //     maximumDate: DateTime.now().add(Duration(seconds: 1)),
                  //     minimumDate: DateTime.now().subtract(Duration(days: 1)),
                  //     onDateTimeChanged: (value) {},
                  //   ),
                  // ),
            //     ],
            //   ),
            // ),
            SizedBox(
              height: 24,
            ),
            
            GestureDetector(
              onTap: () async {
        try {
            final supabase = Supabase.instance.client;
            if (locationController.text.isEmpty || descriptionController.text.isEmpty|| timeController.text.isEmpty|| dateController.text.isEmpty) {
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
            final response = await supabase.from('incident_details').insert({
              'location': locationController.text,
              'description': descriptionController.text,
              'time': timeController.text,
              'date': dateController.text,
            });
        
            // if (response.error == null) {
              log('✅ incident details added successfully');
            // } else {
              // log('❌ Error inserting user: ${response.error!.message}');
            // }
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
        ),
            
        ]  ,),);
    },
  );
}

//