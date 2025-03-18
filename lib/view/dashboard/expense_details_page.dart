// import 'dart:nativewrappers/_internal/vm/lib/math_patch.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:PoliceX/controller/duty_controller.dart';

class ExpenseDetailsPage extends StatelessWidget {
  const ExpenseDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
 
    final DutyController dutyController = Get.find<DutyController>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
    dutyController.fetchExpenseDetails();
  });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Details'),
        backgroundColor: Colors.blue,
      ),
      body: Obx(() {
        if (dutyController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (dutyController.patrolDetails.isEmpty) {
          return const Center(
            child: Text(
              'No expense details available.',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
          );
        }

        return ListView.builder(
          itemCount: dutyController.patrolDetails.length,
          itemBuilder: (context, index) {
            final expense = dutyController.patrolDetails[index];

            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: ListTile(
                title: Text(
                  expense['expense_type'] ?? 'NULL',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Amount: \$${expense['amount'] ?? '0.00'}'),
                    // Text('Date: ${expense['created_at'].toString().split(' ')[0]}'),
                    Text('Receipt No: ${expense['receipt_no'] ?? 'No Receipt'}'),
                    // Text('Status: ${expense['status'] == true ? 'Approved' : 'Pending'}'),
                  ],
                ),
                onTap: () => _showExpenseDetails(context, expense),
              ),
            );
          },
        );
      }),
    );
  }

  void _showExpenseDetails(BuildContext context, Map<String, dynamic> expense) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Expense ID: ${expense['id'] ?? 'N/A'}'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Description: ${expense['description'] ?? 'No description'}'),
              Text('Amount: \$${expense['amount'] ?? '0.00'}'),
              Text('Date: ${expense['created_at'].toString().split(' ')[0]}'),
              Text('Category: ${expense['category'] ?? 'Uncategorized'}'),
              Text('Status: ${expense['status'] == true ? 'Approved' : 'Pending'}'),
            ],
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
