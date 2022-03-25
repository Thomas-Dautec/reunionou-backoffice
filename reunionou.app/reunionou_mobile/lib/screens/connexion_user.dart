import 'package:flutter/material.dart';
import 'package:reunionou_mobile/components/users/user_connexion.dart';

class ConnexionUser extends StatefulWidget {
  const ConnexionUser({Key? key}) : super(key: key);

  static String get route => '/connexion_user';

  @override
  State<ConnexionUser> createState() => _ConnexionUserState();
}

class _ConnexionUserState extends State<ConnexionUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Connexion'),
        ),
        body: const UserCon());
  }
}
