import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:policex/controller/home_controller.dart';
import 'package:policex/controller/user_controller.dart';
import 'package:policex/view/common_widgets/navbar_item.dart';
import 'package:policex/view/dashboard/admin_dashboard.dart';
import 'package:policex/view/dashboard/dashboard.dart';
import 'package:policex/view/duty/duty.dart';
import 'package:policex/view/settings/settings.dart'; 

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController homeController = Get.find<HomeController>();
  final UserController userController = Get.find<UserController>(); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: GetBuilder<HomeController>(
        id: 'home',
        builder: (homeController) {
          return Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              GetBuilder<HomeController>(
                builder: (homeController) {

                  switch (homeController.homeIndex) {
                    case 0:
                      if (userController.isAdminUser) {
                        return AdminDashboard(); // ✅ Admin Dashboard Page
                      } else {
                        return DashboardPage(); // ✅ Dashboard Page
                        }
                    case 1:
                      return const DutySchedulePage(); // ✅ Duty Page
                    case 2:
                      return const SettingsPage(); // ✅ Settings Page
                    default:
                      return const SizedBox();
                  }
                },
              ),
              // ✅ Bottom Navigation Bar
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
                        child: NavbarItem(
                          itemIcon: Icons.dashboard,
                          itemName: 'Dashboard',
                          isSelected: homeController.homeIndex == 0,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          homeController.setHomeIndex(1);
                        },
                        child: NavbarItem(
                          itemIcon: Icons.work,
                          itemName: 'Duty',
                          isSelected: homeController.homeIndex == 1,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          homeController.setHomeIndex(2);
                        },
                        child: NavbarItem(
                          itemIcon: Icons.settings,
                          itemName: 'Settings',
                          isSelected: homeController.homeIndex == 2,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}