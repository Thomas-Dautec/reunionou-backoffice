import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:reunionou/screens/home.dart';

class EventDetails extends StatelessWidget {
  const EventDetails({Key? key, required this.title}) : super(key: key);

  static String get route => '/EventDetails';
  final String title;
  //Event event;

  void click() => runApp(const MaterialApp(
        home: Home(),
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: HexColor("#365b6d"),
            title: const Text(
              'Détail de l\'évément',
              style: TextStyle(color: Colors.white),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                click();
              },
            )),
        body: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18.0),
                  topRight: Radius.circular(18.0)),
            ),
            child: Column(children: [
              Container(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: HexColor("#365b6d"),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      SizedBox(height: 10),
                      Text(
                        'Café Place Stan',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Text(
                        'RDV à 14h',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  MaterialButton(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Icon(FontAwesomeIcons.rectangleList,
                              color: HexColor("#4E1A1A")),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            "Liste des invités",
                            style: TextStyle(
                              color: HexColor("#4E1A1A"),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      print("send mail author");
                    },
                  ),
                  MaterialButton(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Icon(FontAwesomeIcons.comments,
                              color: HexColor("#4E1A1A")),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            "Messagerie",
                            style: TextStyle(
                              color: HexColor("#4E1A1A"),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      print("send mail author");
                    },
                  ),
                  //if(event.author.fullname == loggedUser.fullname) ...[
                  MaterialButton(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Icon(FontAwesomeIcons.share,
                              color: HexColor("#4E1A1A")),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            "Partager",
                            style: TextStyle(
                              color: HexColor("#4E1A1A"),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      print("partager l'évenement");
                    },
                  ), /*
                                      MaterialButton(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: Icon(FontAwesomeIcons.envelope, color: HexColor("#4E1A1A")),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(2.0),
                                              child: Text(
                                                "Contacter",
                                                style: TextStyle(
                                                  color: HexColor("#4E1A1A"),
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        onPressed: () {
                                          print("partager l'évenement");
                                        },
                                      ),
                                    ]*/
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Icon(FontAwesomeIcons.locationDot,
                              color: HexColor("#4E1A1A"))),
                      const Expanded(
                        child: Text(
                          'Nancy',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ),
                    ],
                  )),
              const SizedBox(height: 20),
              Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Icon(FontAwesomeIcons.road,
                              color: HexColor("#4E1A1A"))),
                      const Expanded(
                        child: Text(
                          "Vous êtes à moins 1 km de l'événement",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ),
                    ],
                  )),
              const SizedBox(height: 20),
              Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Icon(FontAwesomeIcons.clock,
                              color: HexColor("#4E1A1A"))),
                      const Expanded(
                          child: Text(
                        " 14h00",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      )),
                      Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Icon(FontAwesomeIcons.calendarDay,
                              color: HexColor("#4E1A1A"))),
                      const Text(
                        '30/03/22',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ],
                  )),
              const SizedBox(height: 20),
              Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Icon(FontAwesomeIcons.crown,
                              color: HexColor("#4E1A1A"))),
                      const Expanded(
                          child: Text(
                        "Fred",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      )),
                      Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Icon(FontAwesomeIcons.userLarge,
                              color: HexColor("#4E1A1A"))),
                      const Text(
                        " 11 invité(s)",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      )
                    ],
                  )),
              const SizedBox(height: 12.0),
              Container(
                height: 260,
                width: 320,
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
                    ),
                  ],
                ),
              ),
              Container(
                  //child: ,
                  ),
              const SizedBox(height: 20),
            ])));
  }
}
