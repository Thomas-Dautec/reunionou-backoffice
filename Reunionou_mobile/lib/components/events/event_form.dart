import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:latlong2/latlong.dart';

import 'package:reunionou/models/event.dart';

class EventForm extends StatefulWidget {
  const EventForm({
    Key? key,
    this.event,
  }) : super(key: key);

  final Event? event;

  @override
  State<EventForm> createState() => _EventFormState();
}

class _EventFormState extends State<EventForm> {
  final _formKey = GlobalKey<FormState>();

  //Les textes
  final titleTxtController = TextEditingController();
  final DescripTxtController = TextEditingController();
  final PlaceTxtController = TextEditingController();

  static final now = DateTime.now();
  DateTime selectDate = now;
  final last = now.add(const Duration(days: 365));
  //qlq

  @override
  Widget build(BuildContext context) {
    final isKey = MediaQuery.of(context).viewInsets.bottom != 0;
    return SingleChildScrollView(
      child: Column(
        children: [
          Form(
            key: _formKey,
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 40.0, right: 40.0, top: 40.0),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 48.0,
                    child: Image.asset(
                      'assets/images/Reunionou.png',
                      height: 100,
                      width: 200,
                    ),
                  ),
                  TextFormField(
                    controller: titleTxtController,
                    decoration: const InputDecoration(
                      hintText: 'Titre',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez rentrer une valeur correcte';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: DescripTxtController,
                    decoration: const InputDecoration(
                      hintText: 'Description',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez rentrer une valeur correcte';
                      }
                      return null;
                    },
                  ),
                  /*
                  CalendarDatePicker(
                    initialDate: now,
                    firstDate: now,
                    lastDate: last,
                    onDateChanged: (DateTime? value) {
                      setState(() {
                        selectDate = value!;
                      });
                    },
                  ),*/
                  ElevatedButton(
                      onPressed: () {
                        showDatePicker(
                            context: context,
                            //locale: const Locale("fr", "FR"),
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2025),
                            builder: (context, child) => Theme(
                                  data: ThemeData().copyWith(
                                    colorScheme: ColorScheme.dark(
                                      primary: HexColor("#365b6d"),
                                      surface: HexColor("#365b6d"),
                                      onSurface: Colors.black,
                                    ),
                                  ),
                                  child: child!,
                                ));
                      },
                      child: const Icon(Icons.calendar_today),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(HexColor("#365b6d")))),
                  ElevatedButton(
                      onPressed: () {
                        showTimePicker(
                            context: context,
                            initialTime: const TimeOfDay(hour: 13, minute: 30),
                            builder: (context, child) => Theme(
                                  data: ThemeData().copyWith(
                                    colorScheme: ColorScheme.dark(
                                      primary: HexColor("#365b6d"),
                                      surface: Colors.white,
                                      onSurface: Colors.black,
                                    ),
                                  ),
                                  child: child!,
                                ));
                      },
                      child: const Icon(Icons.timelapse),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(HexColor("#365b6d")))),
                  const SizedBox(height: 12.0),
                  /*
                  ElevatedButton(
                    child: Icon(Icons.timelapse),
                    onPressed: () {
                      Future<TimeOfDay> selectedTime = showTimePicker(
                        initialTime: TimeOfDay.now(),
                        context: context,
                      );
                    },
                  ),*/
                  TextFormField(
                    controller: PlaceTxtController,
                    decoration: const InputDecoration(
                      hintText: 'Lieu',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez rentrer une valeur correcte';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12.0),
                  Container(
                    height: 300,
                    margin: const EdgeInsets.all(10),
                    alignment: const Alignment(0, 0),
                    child: FlutterMap(
                      options: MapOptions(
                        center: LatLng(48.683, 6.163),
                        zoom: 13.0,
                        screenSize: MediaQuery.of(context).size,
                      ),
                      layers: [
                        TileLayerOptions(
                          urlTemplate:
                              "https://api.mapbox.com/styles/v1/totodautec/cl1bxfbcq002o15ntdtkuiv9d/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoidG90b2RhdXRlYyIsImEiOiJjbDFieGVvcDIwMjRrM2JucjR5MWpuaWh2In0.ByTxd0PnDM6ecc3iwnkDgg",
                          additionalOptions: {
                            'accessToken':
                                'pk.eyJ1IjoidG90b2RhdXRlYyIsImEiOiJjbDFieGVvcDIwMjRrM2JucjR5MWpuaWh2In0.ByTxd0PnDM6ecc3iwnkDgg',
                            'id': ''
                          },
                          attributionBuilder: (_) {
                            return const Text("© OpenStreetMap contributors");
                          },
                        ),
                      ],
                    ),
                  ),
                  /*
            MarkerLayerOptions(
              markers: [
                Marker(
                  width: 80.0,
                  height: 80.0,
                  point: LatLng(51.5, -0.09),
                  builder: (ctx) => Container(
                    child: FlutterLogo(),
                  ),
                ),
              ],
            ),*/
                ],
              ),
            ),
          ),
          if (!isKey)
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  String message = "";
                  Event event = Event(
                      title: titleTxtController.text,
                      description: DescripTxtController.text,
                      date: selectDate,
                      //hour: 'test',
                      place: PlaceTxtController.text,
                      iduser: 'test');
                  if (widget.event != null) {
                    message = "L'événement " + event.title + " a été modifier";
                  } else {
                    message = "L'événement " + event.title + " a été créer";
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(message)),
                  );
                  Navigator.pop(context);
                }
              },
              child: const Text('Submit'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(HexColor("#365b6d")),
              ),
            ),
          /*
            TextButton(
              child: Text(
                'Create New Account',
                style: TextStyle(
                    color: Colors.black87,
                    decoration: TextDecoration.underline),
              ),
              onPressed: () {
                print("Signin");
              },
            ),*/
          const SizedBox(height: 50.0),
        ],
      ),
    );
  }
}
