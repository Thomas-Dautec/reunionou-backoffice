import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Profil extends StatelessWidget {
  const Profil({Key? key}) : super(key: key);
  static String get route => '/profil';

  @override
  Widget build(BuildContext context) {
    return ListView(physics: const BouncingScrollPhysics(), children: <Widget>[
      Container(
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.all(40),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Column(children: <Widget>[
            Container(
                padding: const EdgeInsets.all(0),
                height: 80,
                child: const Icon(Icons.supervised_user_circle, size: 90)),
            const SizedBox(height: 12.0),
            const Text('Username',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20.0,
                    color: Colors.orange)),
            _infoUser()
          ])),
      Container(
        padding: const EdgeInsets.all(0),
        child: ElevatedButton(
          child: const Text("Se deconnecter"),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(HexColor("#365b6d"))),
          onPressed: () {},
        ),
      )
    ]);
  } /*

  _headerUser() => Column(children: <Widget>[
        Container(
            padding: const EdgeInsets.all(0),
            height: 80,
            child: const Icon(Icons.supervised_user_circle, size: 90)),
        const SizedBox(height: 12.0),
        const Text('Username',
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20.0,
                color: Colors.orange)),
      ]);
*/

  _infoUser() {
    return Container(
      padding: const EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 40.0),
          _email(),
          const SizedBox(height: 12.0),
          _mobile(),
          const SizedBox(height: 12.0),
          _birthDate(),
          const SizedBox(height: 12.0),
          _gender(),
          const SizedBox(height: 12.0),
        ],
      ),
    );
  }

  _email() {
    return Row(children: <Widget>[
      _prefixIcon(Icons.email),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Email',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15.0,
                  color: Colors.grey)),
          SizedBox(height: 1),
          Text(
            'user@gmail.com',
            style: TextStyle(fontSize: 15),
          )
        ],
      )
    ]);
  }

  _mobile() {
    return Row(children: <Widget>[
      _prefixIcon(Icons.phone),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Mobile',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15.0,
                  color: Colors.grey)),
          SizedBox(height: 1),
          Text(
            '06060606',
            style: TextStyle(fontSize: 15),
          )
        ],
      )
    ]);
  }

  _birthDate() {
    return Row(children: <Widget>[
      _prefixIcon(Icons.date_range),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Birth date',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15.0,
                  color: Colors.grey)),
          SizedBox(height: 1),
          Text(
            '30/03/2022',
            style: TextStyle(fontSize: 15),
          )
        ],
      )
    ]);
  }

  _gender() {
    return Row(children: <Widget>[
      _prefixIcon(Icons.person),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Name',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15.0,
                  color: Colors.grey)),
          SizedBox(height: 1),
          Text(
            'Test',
            style: TextStyle(fontSize: 15),
          )
        ],
      )
    ]);
  }

  _prefixIcon(IconData iconData) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 48.0, minHeight: 48.0),
      child: Container(
          padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
          margin: const EdgeInsets.only(right: 8.0),
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                  bottomRight: Radius.circular(10.0))),
          child: Icon(
            iconData,
            size: 20,
            color: Colors.grey,
          )),
    );
  }
}
