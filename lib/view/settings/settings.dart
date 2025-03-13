import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:policex/core/router/router.dart';
import 'package:policex/view/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ListView(
          children: [
            ListTile(
              title: const Text("Security"),
              leading: const Icon(Icons.security),
              onTap: () {
                Get.toNamed(RouterName.security);
              },
            ),
            ListTile(
              title: const Text("Privacy"),
              leading: const Icon(Icons.lock),
              onTap: () {
                Get.toNamed(RouterName.privacy);
              },
            ),
            const Divider(),
            ListTile(
              title: const Text("Help & Support"),
              leading: const Icon(Icons.help),
              onTap: () {
                Get.toNamed(RouterName.helpSupport);
              },
            ),
            ListTile(
              title: const Text("Terms and Policies"),
              leading: const Icon(Icons.policy),
              onTap: () {
                Get.toNamed(RouterName.termsConditions);
              },
            ),
            const Divider(),
            ListTile(
              title: const Text("Log Out"),
              leading: const Icon(Icons.logout),
              onTap: () {
                _showLogoutDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  /// ✅ Logout Confirmation Dialog
  void _showLogoutDialog(BuildContext context) {
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
            onPressed: () async {
              Navigator.pop(context); // Close dialog
              await _logout(context);
            },
            child: const Text("Log Out"),
          ),
        ],
      ),
    );
  }

  /// ✅ Logout Function
  Future<void> _logout(BuildContext context) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear(); // ✅ Clear login state

      // ✅ Navigate to LoginPage and remove all previous routes
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
        (route) => false,
      );
      print('✅ Logged out successfully');
    } catch (e) {
      print('❌ Logout failed: $e');
    }
  }
}
