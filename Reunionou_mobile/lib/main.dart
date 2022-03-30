import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:reunionou/components/events/event_details.dart';
import 'package:reunionou/screens/all_events.dart';

import 'package:reunionou/screens/create_event.dart';
import 'package:reunionou/data/users_collection.dart';
import 'package:reunionou/screens/connexion_user.dart';
import 'package:reunionou/screens/home.dart';
import 'package:reunionou/screens/profil.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => UsersCollection(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UsersCollection>(builder: (context, userCollection, child) {
      return FutureBuilder(
          future: userCollection.getTaskFromAPI(),
          builder: ((context, snapshot) {
            return MaterialApp(
              title: 'Reunionou',
              theme: ThemeData(
                primaryColor: HexColor("#365b6d"),
              ),
              debugShowCheckedModeBanner: false,
              initialRoute: ConnexionUser.route,
              routes: {
                Profil.route: (context) => const Profil(),
                Home.route: (context) => const Home(),
                CreateEvent.route: (context) => const CreateEvent(
                      title: 'Créer un événement',
                    ),
                ConnexionUser.route: (context) => const ConnexionUser(),
                AllEvents.route: (context) => const AllEvents(),
                EventDetails.route: (context) =>
                    const EventDetails(title: 'Details')
              },
            );
          }));
    });
  }
}
