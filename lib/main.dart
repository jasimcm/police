import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:police/core/di/get_di.dart';
import 'package:police/core/router/router.dart';
import 'package:police/view/splash/splash.dart';
import 'view/login/login.dart';
import 'view/dashboard/dashboard.dart';
import 'view/duty/duty.dart';
import 'view/notification/notification.dart';
import 'view/settings/settings.dart';

void main() async {
  await initDi();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppRoute.initialRoute,
      getPages: AppRoute.getRouter,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
    );
  }
}
