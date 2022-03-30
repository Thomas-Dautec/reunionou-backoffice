class Event {
  //Les attributs
  int? id;
  String title;
  String description;
  DateTime date;
  //String hour;
  String place;
  String iduser;

  //Constructeur
  Event(
      {this.id,
      required this.title,
      required this.description,
      required this.date,
      //required this.hour,
      required this.place,
      required this.iduser});
/*
  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(json['id'], json['title'], json['description'], json['date'],
        json['place'], json['id_user']);
  }*/
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'descrition': description,
        'date': date,
        'place': place,
        'id_user': iduser,
      };
}
