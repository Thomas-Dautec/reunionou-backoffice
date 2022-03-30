import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:reunionou/models/user.dart';
import 'package:reunionou/data/users_collection.dart';
import 'package:reunionou/screens/home.dart';
//import 'package:toto/screens/home.dart';

class UserCon extends StatefulWidget {
  const UserCon({Key? key, this.user}) : super(key: key);
  final User? user;

  @override
  State<UserCon> createState() => _UserConState();
}

class _UserConState extends State<UserCon> {
  final GlobalKey<FormState> _conKey = GlobalKey<FormState>();

  TextEditingController userMailController = TextEditingController();
  TextEditingController userMdpController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.user != null) {
      // * si on reçoit une task (par exemple depuis One_Task())
      userMailController = TextEditingController(text: widget.user!.mail);
      userMdpController = TextEditingController(text: widget.user!.password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey[200],
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
                key: _conKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: TextFormField(
                              controller: userMailController,
                              // The validator receives the text that the user has entered.
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white60,
                                alignLabelWithHint: true,
                                labelStyle: const TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold),
                                labelText: 'Mail',
                                //border when input is enable
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 0.2),
                                ),
                                focusedErrorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                                errorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                                //border when user clicked on it
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary)),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Veuillez insérer un mail valide.';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: TextFormField(
                              controller: userMdpController,
                              // The validator receives the text that the user has entered.
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white60,
                                alignLabelWithHint: true,
                                labelStyle: const TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold),
                                labelText: 'Mot de passe',
                                //border when input is enable
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 0.2),
                                ),
                                focusedErrorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                                errorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                                //border when user clicked on it
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary)),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Veuillez insérer un mot de passe valide.';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12.0),
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Consumer<UsersCollection>(
                              builder: (context, usersCollection, child) {
                            return ElevatedButton(
                                onPressed: () {
                                  // * si on reçoit une task (par exemple depuis One_Task())
                                  /*if (widget.user != null) {
                                    if (_conKey.currentState!.validate()) {
                                      usersCollection.updateTask(User(
                                        widget.user!.id,
                                        userMailController.text,
                                        widget.user!.fullname,
                                        widget.user!.username,
                                        userMdpController.text,
                                      ));
                                      Navigator.pop(context);
                                      //hide current snackbar
                                      ScaffoldMessenger.of(context)
                                          .hideCurrentSnackBar();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBarMessage().info(
                                              'Une tâche vient d\'être modifiée'));
                                    } else {
                                      //hide current snackbar
                                      ScaffoldMessenger.of(context)
                                          .hideCurrentSnackBar();
                                      ScaffoldMessenger.of(context).showSnackBar(
                                          snackBarMessage().danger(
                                              'Un ou plusieurs champs du formulaire sont incorrects.'));
                                    }
                                  } else {
                                    if (_conKey.currentState!.validate()) {
                                      int id =
                                          usersCollection.lengthListUsers();
                                      usersCollection.createTask(User(
                                        id,
                                        userMailController.text,
                                        widget.user!.fullname,
                                        widget.user!.username,
                                        userMdpController.text,
                                      ));
                                      Navigator.pop(context);
                                      //hide current snackbar
                                      ScaffoldMessenger.of(context)
                                          .hideCurrentSnackBar();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBarMessage()
                                              .success(
                                                  'Connexion effectuée !'));
                                      //return Home();
                                    } else {
                                      //hide current snackbar
                                      ScaffoldMessenger.of(context)
                                          .hideCurrentSnackBar();
                                      ScaffoldMessenger.of(context).showSnackBar(
                                          snackBarMessage().danger(
                                              'Un ou plusieurs champs du connexion sont incorrects.'));
                                    }
                                  }*/
                                  Navigator.pushNamed(context, Home.route);
                                },
                                child:
                                    const Text('Connecter'), //=> const Home(),
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        HexColor("#365b6d"))));
                          }))
                    ]))));
  }
}
