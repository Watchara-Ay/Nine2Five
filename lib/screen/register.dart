import 'dart:async';
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_web/cloud_firestore_web.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:nine2five/model/information.dart';
import 'package:nine2five/screen/login.dart';
import 'package:nine2five/screen/today.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class User {
  String id;
  String username;
  String firstname;
  String lastname;
  int age;
  String gender;

  User({
    this.id = '',
    required this.username,
    required this.firstname,
    required this.lastname,
    required this.age,
    required this.gender,
  });
}

Future createUser(user) async {
  final docUser = FirebaseFirestore.instance.collection('users').doc();
  user.id = docUser.id;

  final json = toJSON();
  await docUser.set(json);
}

Map<String, dynamic> toJSON() => {
      'id': '',
      'username': '',
      'firstname': '',
      'lastname': '',
      'age': 0,
      'gender': '',
    };

class _RegisterScreenState extends State<RegisterScreen> {
  final userNameTextController = TextEditingController();
  final firstnameTextController = TextEditingController();
  final lastnameTextController = TextEditingController();
  final ageTextController = TextEditingController();
  final genderTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  final FirebaseAuth auth = FirebaseAuth.instance;

  final controller = TextEditingController();
  final controllerAge = TextEditingValue();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text("Register Page"),
              backgroundColor: const Color.fromARGB(255, 255, 110, 110),
            ),
            body: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Form(
                key: formkey,
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Username", style: TextStyle(fontSize: 20)),
                        TextFormField(
                          validator: RequiredValidator(
                              errorText: "Please fill something!!!"),
                          controller: userNameTextController,
                          onChanged: (username) {
                            userNameTextController;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Firstname", style: TextStyle(fontSize: 20)),
                        TextFormField(
                          validator: RequiredValidator(
                              errorText: "Please fill something!!!"),
                          controller: firstnameTextController,
                          onChanged: (firstname) {
                            firstnameTextController;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Lastname", style: TextStyle(fontSize: 20)),
                        TextFormField(
                          validator: RequiredValidator(
                              errorText: "Please fill something!!!"),
                          controller: lastnameTextController,
                          onChanged: (lastname) {
                            lastnameTextController;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Age", style: TextStyle(fontSize: 20)),
                        TextFormField(
                          validator: RequiredValidator(
                              errorText: "Please fill age!!!"),
                          controller: ageTextController,
                          onChanged: (age) {
                            ageTextController;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Gender", style: TextStyle(fontSize: 20)),
                        TextFormField(
                          validator: RequiredValidator(
                              errorText: "Please fill something!!!"),
                          controller: genderTextController,
                          onChanged: (gender) {
                            genderTextController;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Email", style: TextStyle(fontSize: 20)),
                        TextFormField(
                          validator: MultiValidator([
                            RequiredValidator(errorText: "Please fill email"),
                            EmailValidator(errorText: "Wrong email formation")
                          ]),
                          controller: emailTextController,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (email) {
                            emailTextController;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Password", style: TextStyle(fontSize: 20)),
                        TextFormField(
                          validator: RequiredValidator(
                              errorText: "Please fill something!!!"),
                          obscureText: true,
                          controller: passwordTextController,
                          onChanged: (password) {
                            passwordTextController;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color.fromARGB(255, 255, 110, 110)),
                            ),
                            child: const Text("Submit",
                                style: TextStyle(fontSize: 26)),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Are you sure?'),
                                      content: Text(
                                          'Are tou confirm to register? if yes then Email confirmation will send to your email'),
                                      actions: <Widget>[
                                        FlatButton(
                                          onPressed: () async {
                                            if (formkey.currentState!
                                                .validate()) {
                                              formkey.currentState!.save();
                                              const user = User;
                                              {
                                                id:
                                                '';
                                                username:
                                                userNameTextController;
                                                firstname:
                                                firstnameTextController;
                                                lastname:
                                                lastnameTextController;
                                                age:
                                                ageTextController;
                                                gender:
                                                genderTextController;
                                              }
                                              createUser(user);
                                              try {
                                                await FirebaseAuth.instance
                                                    .createUserWithEmailAndPassword(
                                                        email:
                                                            emailTextController
                                                                .text,
                                                        password:
                                                            passwordTextController
                                                                .text)
                                                    .then((value) {
                                                  FirebaseAuth.instance
                                                      .signInWithEmailAndPassword(
                                                          email:
                                                              emailTextController
                                                                  .text,
                                                          password:
                                                              passwordTextController
                                                                  .text)
                                                      .then((value) {
                                                    (Navigator.push(context,
                                                        MaterialPageRoute(
                                                            builder: (context) {
                                                      return const homePage();
                                                    })));
                                                  });
                                                });
                                                formkey.currentState!.reset();
                                              } on FirebaseAuthException catch (e) {
                                                if (e.code == 'weak-password') {
                                                  print(
                                                      'The password provided is too weak.');
                                                } else if (e.code ==
                                                    'email-already-in-use') {
                                                  print(
                                                      'The account already exists for that email.');
                                                }
                                                print(e.message);
                                              }
                                            }
                                          },
                                          child: Text('Confirm'),
                                        ),
                                        FlatButton(
                                            onPressed: () {
                                              if (formkey.currentState!
                                                  .validate()) {}
                                              Navigator.pop(context);
                                              formkey.currentState!.save();
                                            },
                                            child: Text('Cancal')),
                                      ],
                                    );
                                  });
                            },
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          );
        });
  }
}
