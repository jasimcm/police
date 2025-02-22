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
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.15),
              // offset: Offset(0, 5),
              blurRadius: 5,
              spreadRadius: 1,
            )
          ],
          color: Colors.black,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.white.withOpacity(0.2),
            width: 0.5,
          ),
        ),
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(caseName, style: TextStyle(fontSize: 16)),
            Row(
              children: [
                CircleAvatar(
                  radius: 8,
                  backgroundColor: color,
                ),
                // SizedBox(
                //   width: 2,
                // ),
                // Icon(
                //   Icons.chevron_right_rounded,
                //   size: 28,
                //   color: Colors.grey,
                // )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
