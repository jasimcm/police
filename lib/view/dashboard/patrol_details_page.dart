import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:PoliceX/controller/duty_controller.dart';

class PatrolDetailsPage extends StatelessWidget {
  const PatrolDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DutyController dutyController = Get.find<DutyController>();

  // ✅ Ensure reports are fetched when the page opens
  WidgetsBinding.instance.addPostFrameCallback((_) {
    dutyController.fetchPatrolDetails();
  });
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patrol Details'),
        backgroundColor: Colors.blue,
      ),
      body: Obx(() {
        if (dutyController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (dutyController.patrolDetails.isEmpty) {
          return const Center(
            child: Text(
              'No patrol details available.',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
          );
        }

        return ListView.builder(
          itemCount: dutyController.patrolDetails.length,
          itemBuilder: (context, index) {
            final patrol = dutyController.patrolDetails[index];

            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: ListTile(
                title: Text(
                  patrol['id'] != null
                      ? 'Patrol ID: ${patrol['id']}'
                      : 'No ID',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: patrol.entries.map((entry) {
                    // Skip showing 'id' and 'kid' if not needed
                    if (entry.key == 'id') {
                      return const SizedBox.shrink();
                    }
                    return Text(
                      '${_formatKey(entry.key)}: ${entry.value ?? 'N/A'}',
                      style: const TextStyle(fontSize: 14),
                    );
                  }).toList(),
                ),
                onTap: () {
                  _showPatrolDetails(context, patrol);
                },
              ),
            );
          },
        );
      }),
    );
  }

  // Format key names to be more readable (e.g., 'created_at' -> 'Created At')
  String _formatKey(String key) {
    return key
        .replaceAll('_', ' ') // Replace underscores with spaces
        .split(' ')
        .map((word) => word.capitalizeFirst!)
        .join(' ');
  }

  // Function to show detailed patrol info
  void _showPatrolDetails(BuildContext context, Map<String, dynamic> patrol) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Patrol ID: ${patrol['id'] ?? 'Unknown'}'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: patrol.entries.map((entry) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    '${_formatKey(entry.key)}: ${entry.value ?? 'N/A'}',
                    style: const TextStyle(fontSize: 14),
                  ),
                );
              }).toList(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
