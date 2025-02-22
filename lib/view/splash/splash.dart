import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:police/core/router/router.dart';
import 'package:police/view/login/login.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

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
                Get.offAndToNamed(RouterName.login);
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
