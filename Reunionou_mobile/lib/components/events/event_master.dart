import 'package:reunionou/models/event.dart';
import 'package:flutter/material.dart';
import 'package:reunionou/components/events/event_details.dart';

class EventMaster extends StatelessWidget {
  const EventMaster(
      {Key? key, required this.dataevents, required this.callbackSetTask})
      : super(key: key);

  final List<Event> dataevents;
  final Function callbackSetTask;

  void click() => runApp(const MaterialApp(
        home: EventDetails(title: 'test'),
      ));

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: dataevents.length,
        itemBuilder: (context, index) {
          return Container(
            child: Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: Text('Evenement : ' + dataevents[index].title),
                    textColor: Colors.black,
                    onTap: () {
                      click();
                      //Navigator.pushNamed(context, EventDetails.route);
                    },
                  ),
                ),
              ],
            ),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 5.0,
                  color: Colors.grey,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

/*
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
                dataevents[index].title,
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
