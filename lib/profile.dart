import 'package:flutter/material.dart';
import 'package:police/helpandsupport.dart';
import 'package:police/privacy.dart';
import 'package:police/security.dart';
import 'package:police/termsandpolicies.dart';
import 'notification.dart'; // Import NotificationPage
// Import TermsAndPoliciesPage

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Edit Profile"),
            leading: const Icon(Icons.edit),
            onTap: () {
              // Action for Edit Profile
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Edit Profile"),
                  content: const Text("Edit Profile button clicked."),
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
            title: const Text("Security"),
            leading: const Icon(Icons.security),
            onTap: () {
              // Navigate to NotificationPage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecurityPage()),
              );
            },
          ),
          ListTile(
            title: const Text("Notifications"),
            leading: const Icon(Icons.notifications),
            onTap: () {
              // Navigate to NotificationPage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationPage()),
              );
            },
          ),
          ListTile(
            title: const Text("Privacy"),
            leading: const Icon(Icons.lock),
            onTap: () {
              // Navigate to TermsAndPoliciesPage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PrivacyPage()),
              );
            },
          ),
          const Divider(),
          ListTile(
            title: const Text("Help & Support"),
            leading: const Icon(Icons.help),
            onTap: () {
              // Navigate to TermsAndPoliciesPage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HelpAndSupportPage()),
              );
            },
          ),
          ListTile(
            title: const Text("Terms and Policies"),
            leading: const Icon(Icons.policy),
            onTap: () {
              // Navigate to TermsAndPoliciesPage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TermsAndPoliciesPage()),
              );
            },
          ),
          const Divider(),
          ListTile(
            title: const Text("Report a Problem"),
            leading: const Icon(Icons.report),
            onTap: () {
              // Action for Report a Problem
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Report a Problem"),
                  content: const Text("Report a Problem button clicked."),
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
            title: const Text("Add Account"),
            leading: const Icon(Icons.add),
            onTap: () {
              // Action for Add Account
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Add Account"),
                  content: const Text("Add Account button clicked."),
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
            title: const Text("Log Out"),
            leading: const Icon(Icons.logout),
            onTap: () {
              // Log Out Confirmation Dialog
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Log Out"),
                  content: const Text("Are you sure you want to log out?"),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Cancel"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context); // Simulate logging out
                      },
                      child: const Text("Log Out"),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
