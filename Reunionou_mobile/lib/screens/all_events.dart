import 'package:flutter/material.dart';

import 'package:reunionou/models/event.dart';
import 'package:reunionou/components/events/event_master.dart';
import 'package:reunionou/data/events.dart' as data;
import 'package:reunionou/screens/create_event.dart';

class AllEvents extends StatefulWidget {
  const AllEvents({Key? key}) : super(key: key);

  static String get route => '/all_tasks';

  @override
  State<AllEvents> createState() => _AllTasksState();
}

class _AllTasksState extends State<AllEvents> {
  Event? taskChosen;
  //bool isPreview = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
              child: EventMaster(
            dataevents: data.events,
            callbackSetTask: (Event event) {
              debugPrint('All task are ok !');
              setState(() {
                taskChosen = event;
                //isPreview = true;
              });
            },
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, CreateEvent.route);
        },
        tooltip: 'Ajout Task',
        child: const Icon(Icons.add),
      ),
    );
  }
}


/*
class AllEvents extends StatefulWidget {
  const AllEvents({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  static String get route => '/AllEvents';

  @override
  State<AllEvents> createState() => _AllEventsState();
}

class _AllEventsState extends State<AllEvents> {
  /*final List<Event> listText = [
    Event(
      title: 'Test',
      description: 'test again',
      date: 
    )
  ];*/

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Event Title',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'Date: test',
                    style: TextStyle(fontSize: 17),
                  ),
                ],
              ),
            ),
            // const Text(
            //   'Date: test',
            //   style: TextStyle(fontSize: 17),
            // ),
            // const Text(
            //   'Time : 18h',
            //   style: TextStyle(fontSize: 17),
            // ),
            const Text(
              'Lieu : Place Stan',
              style: TextStyle(fontSize: 17),
            ),
            const SizedBox(height: 12),
            const Text(
              'Fred',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  ButtonBar(
                    alignment: MainAxisAlignment.start,
                    children: [
                      TextButton(
                        child: const Text('Plus de détails'),
                        onPressed: () {
                          Navigator.pushNamed(context, EventDetails.route);
                        },
                      ),
                    ],
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: const Icon(Icons.cancel),
                    color: Colors.red,
                    onPressed: () {
                      //callback in allTasks (after that, there is a setState ...)
                      const Text('test');
                    },
                  ),
                  IconButton(
                      onPressed: () {
                        const Text('test');
                      },
                      icon: const Icon(Icons.check),
                      color: Colors.green)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/
