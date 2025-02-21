import 'package:flutter/material.dart';

class SecurityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Security"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              "Security Settings",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.lock),
              title: const Text("Change Password"),
              onTap: () {
                // Add functionality to change password
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Change Password clicked."),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.fingerprint),
              title: const Text("Enable Fingerprint Authentication"),
              onTap: () {
                // Add functionality to enable fingerprint authentication
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Enable Fingerprint Authentication clicked."),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.security),
              title: const Text("Two-Factor Authentication"),
              onTap: () {
                // Add functionality for two-factor authentication
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Two-Factor Authentication clicked."),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.shield),
              title: const Text("View Security Logs"),
              onTap: () {
                // Add functionality to view security logs
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("View Security Logs clicked."),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            const Text(
              "Security Tips",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
              "1. Use a strong password and update it regularly.\n"
              "2. Enable two-factor authentication for extra protection.\n"
              "3. Avoid sharing your credentials with others.\n"
              "4. Monitor your account activity for any unusual behavior.",
              style: TextStyle(fontSize: 16),
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
