import './name_of_months.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import './list_structure.dart';

class eventList extends StatelessWidget {
  final String monName;
  final List<ListStructure> eventInfo;

  eventList(this.monName, this.eventInfo);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: eventInfo.map((tx) {
        return (tx.eventDate.month == nameMonths[monName]-1)
            ? Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                  ),
                ),
                elevation: 10,
                margin: EdgeInsets.all(7),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.amberAccent,
                        ),
                        child: Text(
                          tx.eventName,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.purple,
                          width: 5,
                        ),
                      ),
                      child: Text(
                        Jiffy(tx.eventDate).format("do"),
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              )
            : Center(
                child: Text("Empty List"),
              );
      }).toList(),
    );
  }
}

/*final List<list_structure> ListStructure = [
    list_structure(
        id: "e1", eventName: "Aniket Bday", eventInfo: DateTime(2000, 6, 2)),
    list_structure(
        id: "e2", eventName: "Amit Bday", eventInfo: DateTime(2000, 3, 25)),
  ];*/
