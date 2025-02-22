import 'package:flutter/material.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Privacy"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              "Privacy Policy",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "This Privacy Policy describes how your personal information is collected, used, and shared when you use this application.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              "1. Data Collection",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
              "We collect data such as your User ID, name, and other relevant details to provide better service and ensure security.",
            ),
            const SizedBox(height: 20),
            const Text(
              "2. Data Usage",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Your data is used to improve app functionality, maintain records, and enhance security measures.",
            ),
            const SizedBox(height: 20),
            const Text(
              "3. Data Sharing",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
              "We do not share your data with third parties except as required by law or to comply with legal obligations.",
            ),
            const SizedBox(height: 20),
            const Text(
              "4. Security",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
              "We implement strong security measures to protect your data from unauthorized access, alteration, or disclosure.",
            ),
            const SizedBox(height: 20),
            const Text(
              "5. User Rights",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
              "You have the right to access, update, or delete your personal data. Contact us for assistance.",
            ),
            const SizedBox(height: 20),
            const Text(
              "6. Contact Us",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
              "If you have any questions about our Privacy Policy, contact us at privacy@keralapolice.gov.in.",
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Back"),
            ),
          ],
        ),
      ),
    );
  }
}
