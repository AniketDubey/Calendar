import './eventList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './new_event.dart';
import './list_structure.dart';

class EventsPage extends StatelessWidget {
  final String monName;
  final List<ListStructure> eventInfo = [];

  EventsPage(this.monName);

  void addEvent(BuildContext ctx, List<ListStructure> eventInfo) {
    Navigator.of(ctx)
        .push(MaterialPageRoute(builder: (ctx) => NewEvent(monName,eventInfo)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(monName),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              addEvent(context,eventInfo);
            },
          ),
        ],
      ),
      body: eventList(monName,eventInfo),
    );
  }
}
