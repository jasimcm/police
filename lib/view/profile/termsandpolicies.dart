import 'package:flutter/material.dart';

class TermsAndPoliciesPage extends StatelessWidget {
  const TermsAndPoliciesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Terms and Policies")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Terms and Policies",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "1. This app is a control panel tool designed for Kerala Police to streamline their activities and schedules.",
              ),
              SizedBox(height: 8),
              Text(
                "2. All users must use this application strictly for official purposes only.",
              ),
              SizedBox(height: 8),
              Text(
                "3. User data will be stored and managed following data protection laws applicable in the state of Kerala.",
              ),
              SizedBox(height: 8),
              Text(
                "4. Sharing your credentials or misuse of this app for unauthorized activities is strictly prohibited and will result in disciplinary action.",
              ),
              SizedBox(height: 8),
              Text(
                "5. Notifications and updates shared through the app should be considered official communication.",
              ),
              SizedBox(height: 8),
              Text(
                "6. For support or issues, contact the IT team of Kerala Police directly.",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
