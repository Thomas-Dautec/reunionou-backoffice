import 'package:flutter/widgets.dart';
import 'package:reunionou/data/users.dart';
import 'package:reunionou/models/user.dart';
import 'package:dio/dio.dart';

class UsersCollection extends ChangeNotifier {
  List<User> usersList = users;

  Future getTaskFromAPI() async {
    var response =
        await Dio().get('http://docketu.iutnc.univ-lorraine.fr:62640/sign_in',
            options: Options(headers: {
              Headers.contentTypeHeader: 'application/json',
              Headers.acceptHeader: 'application/json'
            }));
    List user = response.data;
    usersList.addAll(user.map((i) => User.fromJson(i)).toList());
    usersList = user.map((i) => User.fromJson(i)).toList();
    notifyListeners();
    return usersList;
  }

  List<User> getAllUsers() {
    return usersList;
  }

  int lengthListUsers() {
    return usersList.length;
  }

  void createTask(User user) {
    usersList.add(user);
    notifyListeners();
  }

  void updateTask(User newUser) {
    usersList[usersList.indexWhere((item) => item.id == newUser.id)] = newUser;
    notifyListeners();
  }

  void deleteTask(User task) {
    usersList.removeWhere((item) => item.id == task.id);
    notifyListeners();
  }
}
