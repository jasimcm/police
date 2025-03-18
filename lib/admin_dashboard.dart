import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:PoliceX/controller/duty_controller.dart';
import 'package:PoliceX/view/common_widgets/case_item.dart';
import 'package:PoliceX/view/common_widgets/case_details_overlay.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  final DutyController dutyController = Get.find<DutyController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                // Fetch and display cases when the button is clicked
                setState(() {
                  // Logic to fetch cases can be added here
                });
              },
              child: Text('Reports Filed'),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                itemCount: dutyController.cases.length,
                separatorBuilder: (context, index) => SizedBox(height: 4),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.dialog(
                        CaseDetailsOverlay(caseId: dutyController.cases[index]['id'].toString()),
                      );
                    },
                    child: CaseItem(
                      '${dutyController.cases[index]['type']}, ${dutyController.cases[index]['location']}',
                      dutyController.cases[index]['status'] ? Colors.red : Colors.green,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
