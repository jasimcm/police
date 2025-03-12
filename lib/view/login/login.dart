import 'dart:developer';

import 'package:PoliceX/controller/duty_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:PoliceX/controller/home_controller.dart';
import 'package:PoliceX/controller/user_controller.dart';
import 'package:PoliceX/view/home/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final UserController userController = Get.find<UserController>();

  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Police X",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: usernameController,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "User ID",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: passwordController,
                style: const TextStyle(color: Colors.black),
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Passcode",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final isSuccess = await checkUserCredentials(
                  usernameController.text.trim(),
                  passwordController.text.trim(),
                );

                if (isSuccess) {
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setBool('isuserloggedin', true);
                  prefs.setString('username', usernameController.text);
                  final HomeController homeController = Get.find<HomeController>();
                  homeController.setHomeIndex(0);
                  final DutyController dutyController = Get.find<DutyController>();
                  dutyController.fetchReports();
                  // Navigate to HomeScreen
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                } else {
                  _showErrorDialog(context);
                }
              },
              child: const Text("Login"),
            ),
          ],
        ),
      ),
      
    );
  }

  /// ✅ Query Supabase using username and password directly
  Future<bool> checkUserCredentials(String username, String password) async {
    try {
      final supabase = Supabase.instance.client;

      // Query logintable for matching username and password
      final result = await supabase
          .from('logintable')
          .select()
          .eq('username', username)
          .eq('password', password)
          .maybeSingle(); // ✅ Use maybeSingle() for single record

      if (result != null) {
        userController.setCurrentUser(result);

        log(result.toString());
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('username', result['username'].toString());

        log('✅ Login successful');
        return true;
      } else {
        log('❌ Invalid credentials');
        return false;
      }
    } catch (e) {
      log('Error: $e');
      return false;
    }
  }

  void _showErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Invalid Credentials'),
        content: const Text('Please enter correct User ID and Passcode'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
