import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:reunionou/components/events/event_form.dart';
//import 'package:toto/data/events_collection.dart';;

class CreateEvent extends StatefulWidget {
  const CreateEvent({
    Key? key,
    required this.title,
  }) : super(key: key);

  static String get route => '/create_event';

  final String title;

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        toolbarHeight: 60,
        backgroundColor: HexColor("#365b6d"),
      ),
      body: const EventForm(),
    );
  }
}
