import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:PoliceX/controller/duty_controller.dart';
import 'package:PoliceX/controller/user_controller.dart'; // Added import for UserController

class DutySchedulerPage extends StatelessWidget {
  const DutySchedulerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DutyController dutyController = Get.find<DutyController>();
    final UserController userController = Get.find<UserController>(); // Define userController
    final String kid = userController.userResult['kid']; // Retrieve the kid from userController

    // ✅ Fetch duty details when the page opens
    WidgetsBinding.instance.addPostFrameCallback((_) {
      dutyController.fetchDutyByKid(kid); // Pass the kid argument
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Duty Schedule'),
        backgroundColor: const Color.fromARGB(255, 8, 91, 5),
      ),
      body: Obx(() {
        if (dutyController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (dutyController.dutyDetails.isEmpty) {
          return const Center(
            child: Text(
              'No duty schedules available.',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
          );
        }

        return ListView.builder(
          itemCount: dutyController.dutyDetails.length,
          itemBuilder: (context, index) {
            final duty = dutyController.dutyDetails[index];

            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: ListTile(
                title: Text(
                  duty['name'] ?? 'No name',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Date: ${duty['date']}'),
                    Text('Time: ${duty['time'] ?? 'Unknown'}'),
                  ],
                ),
                onTap: () {
                  _showDutyDetails(context, duty);
                },
              ),
            );
          },
        );
      }),
    );
  }

  void _showDutyDetails(BuildContext context, Map<String, dynamic> duty) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Duty ID: ${duty['id']}' ?? 'N/A'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name: ${duty['name'] ?? 'No name'}'),
              Text('Date: ${duty['date']}'),
              Text('Time: ${duty['time'] ?? 'Unknown'}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
