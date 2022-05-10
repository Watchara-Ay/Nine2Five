import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:nine2five/model/information.dart';
import 'package:nine2five/screen/Editprofile.dart';
import 'package:nine2five/screen/login.dart';
import 'package:nine2five/screen/today.dart';

class profilepage extends StatelessWidget {
  final formkey = GlobalKey<FormState>();
  information info = information(
      username: '',
      firstname: '',
      lastname: '',
      gender: '',
      email: '',
      password: '');

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(builder: (context, snapshot) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text("Profile Page"),
          backgroundColor: Color.fromARGB(255, 255, 110, 110),
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(100, 120, 0, 0),
            child: Form(
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Image.asset("assets/images/person.png"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                          child: const Text("Username:  SomMai",
                              style: TextStyle(fontSize: 20))),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                          child: const Text("Firstname:  Somjing",
                              style: TextStyle(fontSize: 20))),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                          child: const Text("Lastname:  Maijingniyay",
                              style: TextStyle(fontSize: 20))),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                          child: const Text("Age:             340",
                              style: TextStyle(fontSize: 20))),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                          child: const Text("Gender:       Male",
                              style: TextStyle(fontSize: 20))),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox.fromSize(
                        //button to today
                        size: Size(64, 64),
                        child: ClipOval(
                          child: Material(
                            color: Color.fromARGB(255, 38, 41, 123),
                            child: InkWell(
                              splashColor: Colors.green,
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return homePage();
                                }));
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const <Widget>[
                                  Icon(Icons.home), // <-- Icon
                                  Text(
                                    "Mytask",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox.fromSize(
                        //button to logout
                        size: Size(86, 86),
                        child: ClipOval(
                          child: Material(
                            color: Color.fromARGB(255, 38, 41, 123),
                            child: InkWell(
                              splashColor: Colors.green,
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return editprofilepage();
                                }));
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const <Widget>[
                                  Icon(Icons.edit), // <-- Icon
                                  Text(
                                    "Edit profile",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        ),
      );
    });
  }
}
