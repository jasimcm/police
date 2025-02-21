import 'package:flutter/material.dart';

class DutySchedulePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Duty Schedule")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FilterButton("Night", Colors.black),
                FilterButton("Morning", Colors.blue),
                FilterButton("OFF", Colors.red),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.grey[900],
                    child: ListTile(
                      title: Text("Assign To: Nahayan Khan"),
                      subtitle: Text(
                          "Shift: ${["Night", "Morning", "OFF"][index % 3]}"),
                      trailing: Text("Date: 10/10/2024"),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String label;
  final Color color;

  FilterButton(this.label, this.color);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(backgroundColor: color),
      child: Text(label),
    );
  }
}
