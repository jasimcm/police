import 'package:flutter/material.dart';

class FAQsPage extends StatelessWidget {
  const FAQsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FAQs"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            Text(
              "Frequently Asked Questions",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Q1: How do I reset my password?",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "Ans: Go to the login screen, click on 'Forgot Password', and follow the instructions.",
            ),
            SizedBox(height: 20),
            Text(
              "Q2: How do I report an issue?",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "Ans: You can use the 'Report a Problem' option in the Profile page or email us at support@keralapolice.gov.in.",
            ),
            SizedBox(height: 20),
            Text(
              "Q3: Who do I contact for technical issues?",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "Ans: For technical issues, contact the technical support team at +91-9999999999.",
            ),
          ],
        ),
      ),
    );
  }
}
