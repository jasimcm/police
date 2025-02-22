import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:police/view/landing/landing.dart';
import 'view/login/login.dart';
import 'view/dashboard/dashboard.dart';
import 'view/schedule/schedule.dart';
import 'view/notification/notification.dart';
import 'view/profile/profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Police X App',
      theme: ThemeData.dark(),
      home: LandingPage(), // Start with the landing page
    );
  }
}
