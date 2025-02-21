import 'package:flutter/material.dart';
import 'package:police/view/profile/faq.dart';

class HelpAndSupportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Help & Support"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              "Help & Support",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.email, color: Colors.blue),
              title: const Text("Contact Us"),
              subtitle: const Text("Reach out to our support team"),
              onTap: () {
                // Open an email client or show a dialog
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Contact Us"),
                    content:
                        const Text("Email us at: support@keralapolice.gov.in"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Close"),
                      ),
                    ],
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.help_outline, color: Colors.orange),
              title: const Text("FAQs"),
              subtitle: const Text("Frequently Asked Questions"),
              onTap: () {
                // Navigate to the FAQs section within the same page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FAQsPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.support, color: Colors.green),
              title: const Text("Technical Support"),
              subtitle: const Text("Get help with technical issues"),
              onTap: () {
                // Show a technical support dialog
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Technical Support"),
                    content: const Text(
                        "For technical support, call: +91-9999999999"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Close"),
                      ),
                    ],
                  ),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.feedback, color: Colors.purple),
              title: const Text("Submit Feedback"),
              subtitle: const Text("Tell us how we can improve"),
              onTap: () {
                // Navigate to a feedback form or show a feedback dialog
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Submit Feedback"),
                    content: const Text(
                        "We value your feedback. Send your suggestions to: feedback@keralapolice.gov.in"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Close"),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
