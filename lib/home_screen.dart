import 'package:flutter/material.dart';

import './month_screen.dart';

class HomeScreen extends StatelessWidget {
  final monthName = [
    {"mname": "January", "mcolor": Colors.purple},
    {"mname": "February", "mcolor": Colors.green},
    {"mname": "March", "mcolor": Colors.red},
    {"mname": "April", "mcolor": Colors.orange},
    {"mname": "May", "mcolor": Colors.amber},
    {"mname": "June", "mcolor": Colors.yellow},
    {"mname": "July", "mcolor": Colors.blue},
    {"mname": "August", "mcolor": Colors.lightGreen},
    {"mname": "September", "mcolor": Colors.lightBlue},
    {"mname": "October", "mcolor": Colors.pink},
    {"mname": "November", "mcolor": Colors.teal},
    {"mname": "December", "mcolor": Colors.lime},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home View"),
      ),
      body: GridView.builder(
          padding: EdgeInsets.all(15),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemCount: monthName.length,
          itemBuilder: (BuildContext ctx, index) {
            return MonthScreen(
                monthName[index]["mname"], monthName[index]["mcolor"]);
          }),
    );
  }
}
