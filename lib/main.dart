import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:PoliceX/core/di/get_di.dart';
import 'package:PoliceX/core/router/router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseConfig.init(); // ✅ Initialize Supabase before running the app
  await initDi();
  runApp(MyApp());
}

class SupabaseConfig {
  static const String supabaseUrl = 'https://pcyavlkmkxodthtzfxsg.supabase.co';
  static const String supabaseAnonKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBjeWF2bGtta3hvZHRodHpmeHNnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzk3ODIwNzEsImV4cCI6MjA1NTM1ODA3MX0.8xnXn9XpnEIY9Z7pdduA8KhJl3yX5OW9OmrsqlMjaYc';

  static Future<void> init() async {
    await Supabase.initialize(
      url: supabaseUrl,
      anonKey: supabaseAnonKey,
    );
    print('✅ Supabase initialized successfully');
  }
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
