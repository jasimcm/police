import 'package:flutter/material.dart';
import 'package:police/view/schedule/schedule.dart';
import 'package:police/view/common_widgets/navbar_item.dart';
import 'package:police/view/dashboard/dashboard.dart';
import 'package:police/view/notification/notification.dart';
import 'package:police/view/profile/profile.dart';

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
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              border: Border(
                top: BorderSide(
                  color: Colors.white.withOpacity(0.3),
                  width: 0.5,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 32,
                top: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _currentIndex = 0;
                      });
                    },
                    child: NavbarItem(
                      itemIcon: Icons.dashboard,
                      itemName: 'Dashboard',
                      isSelected: _currentIndex == 0,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _currentIndex = 1;
                      });
                    },
                    child: NavbarItem(
                      itemIcon: Icons.schedule,
                      itemName: 'Duty Schedule',
                      isSelected: _currentIndex == 1,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _currentIndex = 2;
                      });
                    },
                    child: NavbarItem(
                      itemIcon: Icons.notifications,
                      itemName: 'Notification',
                      isSelected: _currentIndex == 2,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _currentIndex = 3;
                      });
                    },
                    child: NavbarItem(
                      itemIcon: Icons.person,
                      itemName: 'Profile',
                      isSelected: _currentIndex == 3,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
