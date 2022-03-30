import 'package:reunionou/models/event.dart';

List<Event> events = [
  Event(
      id: 1,
      title: 'Café place Stan',
      description: "café 14h",
      date: DateTime(2022, 3, 3),
      //hour: '14h',
      place: "Place Stanislas, Nancy",
      iduser: 'Fred'),
  Event(
      id: 2,
      title: 'Shopping Saint Sébastien',
      description: "magasin solde",
      date: DateTime(2022, 4, 4),
      //hour: '15h',
      place: "Nancy centre ville",
      iduser: 'Toto'),
  Event(
      id: 3,
      title: 'regarder le match de foot',
      description: "nancy vs metz",
      date: DateTime(2022, 5, 5),
      //hour: '20h',
      place: "Stade Marcel Picot",
      iduser: 'Fred'),
  Event(
      id: 4,
      title: 'Rdv devoir',
      description: "tp Flutter",
      date: DateTime(2022, 6, 6),
      //hour: '9h',
      place: "IUT Charlemagne, Nancy",
      iduser: 'Sam'),
  Event(
      id: 5,
      title: 'Conférence',
      description: "Surdité",
      date: DateTime(2022, 7, 7),
      //hour: '13h30',
      place: "IJS Malgrange",
      iduser: 'Toto'),
  Event(
      id: 6,
      title: 'Party Fluo',
      description: "Uniquement les étudiants",
      date: DateTime(2022, 8, 8),
      //hour: '23h',
      place: "Centre ville nancy",
      iduser: 'Fred'),
];
