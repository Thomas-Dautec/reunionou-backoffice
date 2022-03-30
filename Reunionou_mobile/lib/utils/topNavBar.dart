import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

AppBar topNavBar() {
  return AppBar(
      backgroundColor: HexColor("#365b6d"),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize:
            MainAxisSize.min, //pour fix le problème de centrage du logo
        children: const [
          Image(
              image: AssetImage('assets/images/Reunionou.png'),
              width: 120,
              height: 50),
          Text(
            'Home',
            style: TextStyle(color: Colors.white),
          )
        ],
      ));
}
