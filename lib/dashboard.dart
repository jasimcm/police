import 'dart:math';

import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(title: Text("Dashboard")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  "Hi, Abu Nafi",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.15),
                        // offset: Offset(0, 5),
                        blurRadius: 5,
                        spreadRadius: 5,
                      )
                    ],
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.green.withOpacity(0.75),
                  ),
                  child: Text(
                    'On Duty',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                )
              ]),
              SizedBox(height: 32),
              Container(
                width: size.width,
                height: 200,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.15),
                      // offset: Offset(0, 5),
                      blurRadius: 5,
                      spreadRadius: 5,
                    )
                  ],
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black.withOpacity(0.9),
                ),
                child: Column(
                  children: [],
                ),
              ),
              SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Active Cases',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                  Row(
                    children: [
                      Text(
                        'View All',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Transform.rotate(
                        angle: pi,
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          size: 1,
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: 10),
              Column(
                children: [
                  CaseItem("KNM/2024/07489", Colors.red),
                  CaseItem("EKM/2024/02234", Colors.green),
                  CaseItem("TVM/2023/23405", Colors.blue),
                  CaseItem("THR/2023/23450", Colors.grey),
                ],
              ),
              SizedBox(height: 16),
              Divider(),
              SizedBox(height: 16),
              Text(
                'Duty Schedule',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(7, (index) {
                  return Column(
                    children: [
                      Text("S${"MTWTFSS"[index]}"),
                      SizedBox(height: 8),
                      Container(
                        height: 50,
                        width: 20,
                        color: index % 2 == 0 ? Colors.green : Colors.grey,
                      ),
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CaseItem extends StatelessWidget {
  final String caseName;
  final Color color;
  CaseItem(this.caseName, this.color);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(caseName, style: TextStyle(fontSize: 16)),
            CircleAvatar(
              radius: 8,
              backgroundColor: color,
            ),
          ],
        ),
      ),
    );
  }
}
