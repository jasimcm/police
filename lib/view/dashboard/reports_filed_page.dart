import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:PoliceX/controller/duty_controller.dart';

class ReportsFiledPage extends StatelessWidget {
  const ReportsFiledPage({Key? key}) : super(key: key);

 @override
Widget build(BuildContext context) {
  final DutyController dutyController = Get.find<DutyController>();

  // ✅ Ensure reports are fetched when the page opens
  WidgetsBinding.instance.addPostFrameCallback((_) {
    dutyController.fetchReports();
  });

  return Scaffold(
    appBar: AppBar(
      title: const Text('Reports Filed'),
      backgroundColor: const Color.fromARGB(255, 8, 91, 5),
    ),
    body: Obx(() {
      if (dutyController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (dutyController.cases.isEmpty) {
        return const Center(
          child: Text(
            'No reports available.',
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
        );
      }

      return ListView.builder(
        itemCount: dutyController.cases.length,
        itemBuilder: (context, index) {
          final report = dutyController.cases[index];

          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              title: Text(
                report['description'] ?? 'No description',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Date: ${report['created_at'].toString().split(' ')[0]}'),
                  Text('Location: ${report['location'] ?? 'Unknown'}'),
                  Text('Logged by: ${report['name'] ?? 'Unknown'}'),
                  Text('Status: ${report['status'] == true ? 'Closed' : 'Active'}'),
                ],
              ),
              onTap: () {
                _showReportDetails(context, report);
              },
            ),
          );
        },
      );
    }),
  );
}


  void _showReportDetails(BuildContext context, Map<String, dynamic> report) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Report ID: ${report['id']}'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Description: ${report['description'] ?? 'No description'}'),
              Text('Date: ${report['created_at'].toString().split(' ')[0]}'),
              Text('Location: ${report['location'] ?? 'Unknown'}'),
              Text('Logged by: ${report['name'] ?? 'Unknown'}'),
              Text('Status: ${report['status'] == true ? 'Closed' : 'Active'}'),
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
