import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:police/view/login/login.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            ).animate(
              onComplete: (controller) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const LoginPage(), // Navigate to LoginPage
                  ),
                );
              },
            ).fadeIn(
              duration: Duration(milliseconds: 700),
            ),
          ],
        ),
      ),
    );
  }
}
