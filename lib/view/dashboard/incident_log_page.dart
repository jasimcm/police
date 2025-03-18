import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:PoliceX/controller/duty_controller.dart';

class IncidentLogPage extends StatelessWidget {
  const IncidentLogPage({super.key});

  @override
  Widget build(BuildContext context) {
     final DutyController dutyController = Get.find<DutyController>();

  // ✅ Ensure reports are fetched when the page opens
  WidgetsBinding.instance.addPostFrameCallback((_) {
    dutyController.fetchIncidentDetails();
  });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Incident Log'),
        backgroundColor: Colors.blue,
      ),
      body: Obx(() {
        if (dutyController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (dutyController.incidentDetails.isEmpty) {
          return const Center(
            child: Text(
              'No incident logs available.',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
          );
        }

        return ListView.builder(
          itemCount: dutyController.incidentDetails.length,
          itemBuilder: (context, index) {
            final incident = dutyController.incidentDetails[index];

            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: ListTile(
                title: Text(
                  incident['id']?.toString() ?? 'No ID',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Date: ${incident['date'] ?? 'Unknown'}'),
                    Text('Location: ${incident['location'] ?? 'Unknown'}'),
                    Text('Description: ${incident['description'] ?? 'Unknown'}'),
                    Text('Time: ${incident['time'] ?? 'Unknown'}'),
                  ],
                ),
                onTap: () {
                  _showIncidentDetails(context, incident);
                },
              ),
            );
          },
        );
      }),
    );
  }

  void _showIncidentDetails(BuildContext context, Map<String, dynamic> incident) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Incident ID: ${incident['id']}'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Type: ${incident['incident_type'] ?? 'Unknown'}'),
              Text('Date: ${incident['incident_date'] ?? 'Unknown'}'),
              Text('Location: ${incident['location'] ?? 'Unknown'}'),
              Text('Reported by: ${incident['reported_by'] ?? 'Unknown'}'),
              Text('Description: ${incident['description'] ?? 'No description'}'),
              Text('Status: ${incident['status'] == true ? 'Resolved' : 'Pending'}'),
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
