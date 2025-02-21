import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'login.dart';
import 'dashboard.dart';
import 'schedule.dart';
import 'notification.dart';
import 'profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          // _pages[_currentIndex],
          Builder(
            builder: (BuildContext context) {
              switch (_currentIndex) {
                case 0:
                  return DashboardPage();
                case 1:
                  return DutySchedulePage();
                case 2:
                  return NotificationPage();
                case 3:
                  return ProfilePage();
                default:
                  return SizedBox();
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 32,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: NavbarItem(
                    itemIcon: Icons.dashboard,
                    itemName: 'Dashboard',
                    isSelected: _currentIndex == 0,
                  ),
                ),
                GestureDetector(
                  child: NavbarItem(
                    itemIcon: Icons.schedule,
                    itemName: 'Duty Schedule',
                    isSelected: _currentIndex == 1,
                  ),
                ),
                GestureDetector(
                  child: NavbarItem(
                    itemIcon: Icons.notifications,
                    itemName: 'Notification',
                    isSelected: _currentIndex == 2,
                  ),
                ),
                GestureDetector(
                  child: NavbarItem(
                    itemIcon: Icons.person,
                    itemName: 'Profile',
                    isSelected: _currentIndex == 3,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class NavbarItem extends StatefulWidget {
  final IconData itemIcon;
  final String itemName;
  final bool isSelected;

  const NavbarItem({
    super.key,
    required this.itemIcon,
    required this.itemName,
    required this.isSelected,
  });

  @override
  State<NavbarItem> createState() => _NavbarItemState();
}

class _NavbarItemState extends State<NavbarItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          widget.itemIcon,
          color: widget.isSelected ? Colors.green : Colors.grey,
        ),
        Text(
          widget.itemName,
          style: TextStyle(
            color: widget.isSelected ? Colors.green : Colors.grey,
          ),
        ),
      ],
    );
  }
}
