import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void showPatrolBottomSheet(BuildContext context) {
  TextEditingController areaController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  TextEditingController vehicleNoController = TextEditingController();
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Container(
        height: Get.height * 0.9,
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
              "Patrol Details",
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
              itemName: 'Area',
              textEditingController: areaController,
            ),
            SizedBox(
              height: 16,
            ),
            StartPatrolContainer(
              itemName: 'Duration',
              textEditingController: durationController,
            ),
            SizedBox(
              height: 24,
            ),
            StartPatrolContainer(
              itemName: 'Vehicle No.',
              textEditingController: vehicleNoController,
            ),
            SizedBox(
              height: 24,
            ),
            // BottomSheetSubmitButton(),
            GestureDetector(
      onTap: () async {
        try {
    final supabase = Supabase.instance.client;
    if (areaController.text.isEmpty || durationController.text.isEmpty || vehicleNoController.text.isEmpty) {
      log('❌ All fields are required');
      Fluttertoast.showToast(
        msg: "All fields are requiredt",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
      return;
    }
    // ✅ Insert user data into the 'logintable'
    final response = await supabase.from('patrol_details').insert({
      'area': areaController.text,
      'duration': int.parse(durationController.text),
      'vehicle_no': vehicleNoController.text,
    });

    // if (response.error == null) {
      log('✅ Patrol details added successfully');
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
    )
          ],
        ),
      );
    },
  );
}

class BottomSheetSubmitButton extends StatelessWidget {
  const BottomSheetSubmitButton(Set<dynamic> set, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
         try {
    final supabase = Supabase.instance.client;

    // ✅ Insert user data into the 'logintable'
    final response = await supabase.from('patrol_details').insert({
      'area': 'Mahe',
      'duration': 1000,
      'vehicle_no': 'KL11BG4242',
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
    );
  }
}

class StartPatrolContainer extends StatelessWidget {
  final textEditingController;
  final String itemName;

  const StartPatrolContainer({
    super.key,
    required this.itemName,
    required this.textEditingController
  });

  @override
  Widget build(BuildContext context) {
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
            itemName,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            width: Get.width * 0.35,
            // height: 35,
            child: TextField(
              controller: textEditingController,
              cursorColor: Colors.white.withOpacity(0.5),
              cursorOpacityAnimates: true,
              keyboardType: itemName == 'Duration' ? TextInputType.number : TextInputType.text,
              textCapitalization: TextCapitalization.characters,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white.withOpacity(0.5),
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white.withOpacity(0.5),
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
