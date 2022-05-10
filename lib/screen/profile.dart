import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:nine2five/model/information.dart';
import 'package:nine2five/screen/Editprofile.dart';
import 'package:nine2five/screen/addnewtask.dart';
import 'package:nine2five/screen/login.dart';
import 'package:nine2five/screen/today.dart';

class profilepage extends StatelessWidget {
  final formkey = GlobalKey<FormState>();
  information info = information(
      username: '',
      firstname: '',
      lastname: '',
      age: 0,
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
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Form(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset("assets/images/person.png"),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                            alignment: Alignment.center,
                            child: const Text("Username: SomMai",
                                style: TextStyle(fontSize: 20))),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                            alignment: Alignment.center,
                            child: const Text("Firstname: Somjing",
                                style: TextStyle(fontSize: 20))),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                            alignment: Alignment.center,
                            child: const Text("Lastname: Maijingniyay",
                                style: TextStyle(fontSize: 20))),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                            alignment: Alignment.center,
                            child: const Text("Age: 340",
                                style: TextStyle(fontSize: 20))),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                            alignment: Alignment.center,
                            child: const Text("Gender: Male",
                                style: TextStyle(fontSize: 20))),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                    Container(
                      height: 70,
                      color: Color(0xff292e4e),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: (() {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => homePage()));
                                }),
                                child: Text(
                                  "Mytask",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: (() {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              editprofilepage()));
                                }),
                                child: Text(
                                  "Edit profile",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
