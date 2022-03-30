import 'package:reunionou/screens/all_events.dart';
import 'package:reunionou/screens/create_event.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:flutter_map/flutter_map.dart';
//import 'package:latlong2/latlong.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:reunionou/models/event.dart';
import 'package:reunionou/utils/topNavBar.dart';
import 'package:reunionou/screens/profil.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  static String get route => '/home';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Reunionou'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Event event;

  List<Event> events = [];
  void addEvent() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CreateEvent(
          title: "Créer Event",
          //tasksCollection: ,
        ),
      ),
    );
  }

  int _selectedTab = 0;

  List _pages = [
    Center(
      child: const Home(),
    ),
    Center(
      child: const AllEvents(),
    ),
    Center(
      child: const Profil(),
    ),
  ];

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topNavBar(),
      body: const AllEvents(),

      /*FlutterMap(
        options: MapOptions(
          center: LatLng(48.683, 6.163),
          zoom: 13.0,
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
              return Text("© OpenStreetMap contributors");
            },
          ),
        ],
      ),*/
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black45,
              blurRadius: 10,
            ),
          ],
        ),
        child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            fixedColor: HexColor("#365b6d"),
            onTap: (index) => _changeTab(index),
            currentIndex: _selectedTab,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.house),
                label: 'Accueil',
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.peopleGroup),
                label: 'Events',
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.user),
                label: 'Settings',

                //Navigator.push(context, new MaterialPageRoute(builder: (context) => const Profil()));
              )
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addEvent,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
        backgroundColor: HexColor("#365b6d"),
      ),
    );
  }
}
