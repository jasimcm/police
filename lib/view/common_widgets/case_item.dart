import 'package:flutter/material.dart';

class CaseItem extends StatelessWidget {
  final String caseName;
  final Color color;
  const CaseItem(this.caseName, this.color, {super.key});

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
