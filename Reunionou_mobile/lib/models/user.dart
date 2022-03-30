class User {
  //Les attributs
  int id;
  String mail;
  String fullname;
  String username;
  String password;

  //Constructeur
  User(this.id, this.mail, this.fullname, this.username, this.password);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(json['id'], json['mail'], json['fullname'], json['username'],
        json['password']);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'mail': mail,
        'fullname': fullname,
        'username': username,
        'password': password,
      };
}
