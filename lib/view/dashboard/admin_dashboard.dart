import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  DateTime currentTime = DateTime.now();
  String adminName = 'Admin User';
  String rank = 'Administrator';

  @override
  void initState() {
    super.initState();
    _startTimeUpdater();
  }

  void _startTimeUpdater() {
    Future.delayed(const Duration(minutes: 1), () {
      if (mounted) {
        setState(() {
          currentTime = DateTime.now();
        });
        _startTimeUpdater();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: Get.height * 0.335),
                  const Text(
                    'Admin Controls',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildAdminGrid(),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          _topBar(),
        ],
      ),
    );
  }

  Widget _topBar() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 93, 206, 181),
            Color.fromARGB(255, 47, 118, 194),
          ],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      width: Get.width,
      height: Get.height * 0.335,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        left: 16,
        right: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, color: Colors.black),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(adminName, style: _textStyle(20, FontWeight.w700)),
                      Text(rank, style: _textStyle(12, FontWeight.w500)),
                    ],
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white.withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.green.withOpacity(0.9),
                ),
                child: const Text('On Duty', style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w600)),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Divider(color: Colors.white.withOpacity(0.1)),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.calendar_today_outlined, size: 20, color: Colors.white),
                  const SizedBox(width: 6),
                  Text(DateFormat("d MMMM y").format(currentTime), style: _textStyle(16, FontWeight.w400)),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 0.75),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Text('Morning Shift', style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w500)),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(DateFormat("hh:mm a").format(currentTime), style: _textStyle(32, FontWeight.w700)),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              width: Get.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Center(
                child: Text('Check-Out', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAdminGrid() {
    List<Map<String, dynamic>> items = [
      {'label': 'Active Cases', 'icon': Icons.assignment},
      {'label': 'Reports Filed', 'icon': Icons.bar_chart},
      {'label': 'Patrol Details', 'icon': Icons.directions_car},
      {'label': 'Duty Schedule', 'icon': Icons.schedule},
      {'label': 'Incident Log', 'icon': Icons.warning},
      {'label': 'Duty Expense', 'icon': Icons.attach_money},
    ];
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.2,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(16.0)),
          onPressed: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(items[index]['icon'], size: 40, color: Colors.white),
              const SizedBox(height: 8.0),
              Text(items[index]['label'], style: const TextStyle(fontSize: 16, color: Colors.white)),
            ],
          ),
        );
      },
    );
  }

  TextStyle _textStyle(double size, FontWeight weight) => TextStyle(fontSize: size, fontWeight: weight, color: Colors.white);
}