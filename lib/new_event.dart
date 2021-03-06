import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './name_of_months.dart';
import './list_structure.dart';

class NewEvent extends StatefulWidget {
  final String monName;
  final List<ListStructure> eventInfo;

  NewEvent(this.monName, this.eventInfo);

  @override
  _NewEventState createState() => _NewEventState();
}

class _NewEventState extends State<NewEvent> {
  DateTime selectedDate;
  final eventNameController = TextEditingController();

  void selectDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime(2020, nameMonths[widget.monName]-1),
      firstDate: DateTime(2020, nameMonths[widget.monName]-1),
      lastDate: DateTime(2020, nameMonths[widget.monName]-1),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        selectedDate = pickedDate;
      });
    });
  }

  void submitEvent(DateTime eventInfo) {
    final tx = ListStructure(
      id: DateTime.now().toString(),
      eventName: eventNameController.text,
      eventDate: selectedDate,
    );
    widget.eventInfo.add(tx);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Input for New Event"),
      ),
      body: Container(
        padding: EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  maxLines: 2,
                  controller: eventNameController,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    labelText: "Event Name",
                    labelStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        selectedDate == null
                            ? "Select Date"
                            : DateFormat.yMMMMd().format(selectedDate),
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  IconButton(
                      icon: Icon(Icons.date_range),
                      onPressed: () {
                        selectDate();
                      }),
                ],
              ),
            ),
            RaisedButton(
              child: Text("Submit Event"),
              color: Colors.amber,
              textColor: Colors.black,
              onPressed: selectedDate == null
                  ? null
                  : () {
                      submitEvent(selectedDate);
                    },
            ),
          ],
        ),
      ),
    );
  }
}
