import 'package:get/get.dart';
import 'package:police/view/home/home.dart';
import 'package:police/view/login/login.dart';
import 'package:police/view/scheduler/scheduler.dart';
import 'package:police/view/settings/faq.dart';
import 'package:police/view/settings/help_and_support.dart';
import 'package:police/view/settings/privacy.dart';
import 'package:police/view/settings/security.dart';
import 'package:police/view/settings/termsandpolicies.dart';
import 'package:police/view/splash/splash.dart';

class AppRoute {
  static const String initialRoute = RouterName.splash;

  static final getRouter = [
    GetPage(
      name: RouterName.splash,
      page: () => SplashPage(),
    ),
    GetPage(
      name: RouterName.login,
      page: () => LoginPage(),
    ),
    GetPage(
      name: RouterName.home,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: RouterName.faq,
      page: () => FAQsPage(),
    ),
    GetPage(
      name: RouterName.helpSupport,
      page: () => HelpAndSupportPage(),
    ),
    GetPage(
      name: RouterName.privacy,
      page: () => PrivacyPage(),
    ),
    GetPage(
      name: RouterName.security,
      page: () => SecurityPage(),
    ),
    GetPage(
      name: RouterName.termsConditions,
      page: () => TermsAndPoliciesPage(),
    ),
    GetPage(
      name: RouterName.scheduler,
      page: () => SchedulerPage(),
    ),
  ];
}

class RouterName {
  static const String splash = '/';
  static const String login = '/login';
  static const String home = '/home';
  static const String faq = '/faq';
  static const String helpSupport = '/helpSupport';
  static const String privacy = '/privacy';
  static const String security = '/security';
  static const String termsConditions = '/termsConditions';
  static const String scheduler = '/scheduler';
}
