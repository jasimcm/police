import 'package:PoliceX/view/dashboard/incident_log_page.dart';
import 'package:get/get.dart';
import 'package:PoliceX/view/home/home.dart';
import 'package:PoliceX/view/login/login.dart';
import 'package:PoliceX/view/scheduler/scheduler.dart';
import 'package:PoliceX/view/settings/faq.dart';
import 'package:PoliceX/view/settings/help_and_support.dart';
import 'package:PoliceX/view/settings/privacy.dart';
import 'package:PoliceX/view/settings/security.dart';
import 'package:PoliceX/view/settings/termsandpolicies.dart';
import 'package:PoliceX/view/splash/splash.dart';
import 'package:PoliceX/view/dashboard/admin_dashboard.dart';
import 'package:PoliceX/view/dashboard/reports_filed_page.dart';
import 'package:PoliceX/view/dashboard/patrol_details_page.dart'; // ✅ Import ReportsFiledPage

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
      name: RouterName.adminDashboard,
      page: () => AdminDashboard(),
    ),
    GetPage(
      name: RouterName.reportsFiled, // ✅ Add ReportsFiled route
      page: () => ReportsFiledPage(),
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
    GetPage(
  name: RouterName.patrolDetails,
  page: () => const PatrolDetailsPage(),
),
GetPage(
  name: RouterName.incidentLog,
  page: () => IncidentLogPage(),
),


  ];
}

class RouterName {
  static const String splash = '/';
  static const String login = '/login';
  static const String home = '/home';
  static const String adminDashboard = '/admin-dashboard';
  static const String reportsFiled = '/reports-filed'; // ✅ Define ReportsFiled route
  static const String faq = '/faq';
  static const String helpSupport = '/helpSupport';
  static const String privacy = '/privacy';
  static const String security = '/security';
  static const String termsConditions = '/termsConditions';
  static const String scheduler = '/scheduler';
  static const String patrolDetails = '/patrol-details';
  static const String incidentLog = '/incident-log';


}
