import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SchedulerPage extends StatefulWidget {
  const SchedulerPage({super.key});

  @override
  State<SchedulerPage> createState() => _SchedulerPageState();
}

class _SchedulerPageState extends State<SchedulerPage> {
  final TextEditingController officerController = TextEditingController();
  String? selectedShift;
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Schedule - ${DateFormat('dd MMM yyyy').format(DateTime.now().add(const Duration(days: 1)))}',
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Officer Name Field
            Text(
              'Officer',
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: officerController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Enter Officer Name',
                hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                filled: true,
                fillColor: Colors.grey[900],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:
                      BorderSide(color: Colors.white.withOpacity(0.2)),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              ),
            ),
            const SizedBox(height: 16),

            // Date Picker
            Text(
              'Date',
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now().add(const Duration(days: 1)),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 365)),
                );
                if (pickedDate != null) {
                  setState(() {
                    selectedDate = pickedDate;
                  });
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.white.withOpacity(0.2)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      selectedDate != null
                          ? DateFormat('yyyy-MM-dd').format(selectedDate!)
                          : 'Select Date',
                      style: const TextStyle(color: Colors.white),
                    ),
                    const Icon(Icons.calendar_today, color: Colors.white),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Shift Picker
            Text(
              'Shift',
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                ChoiceChip(
                  label: const Text('Day'),
                  selected: selectedShift == 'Day',
                  onSelected: (selected) {
                    setState(() {
                      selectedShift = selected ? 'Day' : null;
                    });
                  },
                  selectedColor: Colors.blue,
                  backgroundColor: Colors.grey[800],
                  labelStyle: const TextStyle(color: Colors.white),
                ),
                const SizedBox(width: 16),
                ChoiceChip(
                  label: const Text('Night'),
                  selected: selectedShift == 'Night',
                  onSelected: (selected) {
                    setState(() {
                      selectedShift = selected ? 'Night' : null;
                    });
                  },
                  selectedColor: Colors.blue,
                  backgroundColor: Colors.grey[800],
                  labelStyle: const TextStyle(color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Cancel Button
                GestureDetector(
                  onTap: () {
                    officerController.clear();
                    selectedDate = null;
                    selectedShift = null;
                    setState(() {});
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    width: Get.width * 0.4,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: Colors.white),
                    ),
                    child: const Center(
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

                // Submit Button
                GestureDetector(
                  onTap: () async {
                    if (officerController.text.isEmpty ||
                        selectedDate == null ||
                        selectedShift == null) {
                      Fluttertoast.showToast(
                        msg: "All fields are required",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.TOP,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                      return;
                    }

                    try {
                      final supabase = Supabase.instance.client;

                      // Fetch 'kid' based on officer name
                      final kidResponse = await supabase
                          .from('logintable')
                          .select('kid')
                          .eq('Name', officerController.text)
                          .maybeSingle();

                      if (kidResponse == null) {
                        Fluttertoast.showToast(
                          msg: "Officer not found",
                          backgroundColor: Colors.red,
                        );
                        return;
                      }

                      final kid = kidResponse['kid'];

                      // Insert into duty_schedule table
                      await supabase.from('duty_schedule').insert({
                        'name': officerController.text,
                        'date': DateFormat('yyyy-MM-dd').format(selectedDate!),
                        'time': selectedShift,
                        'kid': kid,
                      });

                      Fluttertoast.showToast(
                        msg: "Schedule added successfully",
                        backgroundColor: Colors.green,
                      );

                      Get.back(); // ✅ Close on success
                    } catch (e) {
                      log('❌ Error: $e');
                      Fluttertoast.showToast(
                        msg: "Error occurred. Try again.",
                        backgroundColor: Colors.red,
                      );
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    width: Get.width * 0.4,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const Center(
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
