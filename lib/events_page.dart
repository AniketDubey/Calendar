import 'package:flutter/material.dart';
import './new_event.dart';

class EventsPage extends StatelessWidget {
  final String monName;

  EventsPage(this.monName);

  void addEvent(BuildContext ctx) {
    Navigator.of(ctx)
        .push(MaterialPageRoute(builder: (ctx) => NewEvent(monName)));
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
              addEvent(context);
            },
          ),
        ],
      ),
      body: Center(
        child: Text("Events for $monName with size ${EventList.length}"),
      ),
    );
  }
}
