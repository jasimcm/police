import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:PoliceX/controller/duty_controller.dart';

class CaseDetailsOverlay extends StatelessWidget {
  final String caseId;

  const CaseDetailsOverlay({super.key, required this.caseId});

  @override
  Widget build(BuildContext context) {
    final DutyController dutyController = Get.find<DutyController>();
    final caseDetails = dutyController.cases.firstWhere(
      (caseItem) => caseItem['id'].toString() == caseId,
      orElse: () => <String, dynamic>{},
    );

    if (caseDetails.isEmpty) {
      return Center(
        child: Text(
          'Case not found',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      );
    }

    return Material(
      color: Colors.black.withOpacity(0.5), // Reduced opacity for better contrast
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.85,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ✅ Case ID
                Text(
                  caseDetails['id'].toString(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // High contrast
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const SizedBox(height: 12),

                // ✅ Description
                Text(
                  'Description:',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // High contrast
                  ),
                ),
                Text(
                  caseDetails['description'] ?? 'No description available',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black87, // Slightly lighter for readability
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
                const SizedBox(height: 12),

                // ✅ Date and Location (Fix overflow + improve contrast)
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Date: ${caseDetails['created_at'].toString().split(' ')[0]}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Location: ${caseDetails['location']}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // ✅ Logged By
                Text(
                  'Logged by: ${caseDetails['name']}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const SizedBox(height: 16),

                // ✅ Buttons Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Close Case Button
                    ElevatedButton(
  onPressed: () async {
    await dutyController.updateCaseStatus(
      caseId,
      true, // ✅ Change to boolean true for 'Closed'
    );
    Get.back();
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.red,
    padding: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 8,
    ),
  ),
  child: const Text(
    'Close Case',
    style: TextStyle(color: Colors.white),
  ),
),


                    // Close Button
                    ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                      ),
                      child: const Text(
                        'Close',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
