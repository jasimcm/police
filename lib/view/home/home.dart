import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:police/controller/home_controller.dart';
import 'package:police/view/duty/duty.dart';
import 'package:police/view/common_widgets/navbar_item.dart';
import 'package:police/view/dashboard/dashboard.dart';
import 'package:police/view/notification/notification.dart';
import 'package:police/view/settings/settings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeController>(
          id: 'home',
          builder: (homeController) {
            return Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                // _pages[_currentIndex],
                GetBuilder<HomeController>(
                  builder: (homeController) {
                    switch (homeController.homeIndex) {
                      case 0:
                        return DashboardPage();
                      case 1:
                        return DutySchedulePage();
                      // case 2:
                      //   return NotificationPage();
                      case 2:
                        return SettingsPage();
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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            homeController.setHomeIndex(0);
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: NavbarItem(
                              itemIcon: Icons.dashboard,
                              itemName: 'Dashboard',
                              isSelected: homeController.homeIndex == 0,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            homeController.setHomeIndex(1);
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: NavbarItem(
                              itemIcon: Icons.work,
                              itemName: 'Duty',
                              isSelected: homeController.homeIndex == 1,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            homeController.setHomeIndex(2);
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: NavbarItem(
                              itemIcon: Icons.settings,
                              itemName: 'Settings',
                              isSelected: homeController.homeIndex == 2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          }),
    );
  }
}
