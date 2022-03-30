import 'package:reunionou/models/event.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class EventsCollection extends ChangeNotifier {
  Future<List<Event>> getEvents() async {
    String url = "http://docketu.iutnc.univ-lorraine.fr:62640/events";
    Dio dio = Dio();
    List<Event> event = [];
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers['Accept'] = 'application/json';

    /* Event newEvent = Event(id: 'titre', titre: 'titre',description: 'desc' , lieu: 'lieu', idCreateur: '@username', createdAt: '29/03/2022', date: '30/03/2022'); 
          event.insert(0, newEvent); */

    var response = await dio.get(url);
    if (response.statusCode == 200) {
      //return event.fromJson(response.data);
      int i = 0;
      for (var e in response.data['events']) {
        Event newEvent = Event(
            id: e['event']['id'],
            title: e['event']['title'],
            description: e['event']['description'],
            place: e['event']['place'],
            iduser: e['event']['id_user'],
            date: e['event']['date']);
        event.insert(i, newEvent);

        i++;
      }
    } else {
      throw Exception("Something gone wrong, ${response.statusCode}");
    }
    //print(event);
    return event;
  }
}

/*final url = Uri(
      scheme: 'http',
      host: 'api.local',
      port: 19080,
      path: '/shared/' + event.id.toString(),
      queryParameters: queryParameters,
    );*/