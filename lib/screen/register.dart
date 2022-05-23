import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:nine2five/model/information.dart';
import 'package:nine2five/screen/today.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _userNameTextController = TextEditingController();
  TextEditingController _firstnameTextController = TextEditingController();
  TextEditingController _lastnameTextController = TextEditingController();
  TextEditingController _ageTextController = TextEditingController();
  TextEditingController _genderTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  information info = information(
      username: '',
      firstname: '',
      lastname: '',
      age: 0,
      gender: '',
      email: '',
      password: '');
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  User? user = FirebaseAuth.instance.currentUser;

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
                          controller: _userNameTextController,
                          onChanged: (username) {
                            _userNameTextController;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Firstname", style: TextStyle(fontSize: 20)),
                        TextFormField(
                          validator: RequiredValidator(
                              errorText: "Please fill something!!!"),
                          controller: _firstnameTextController,
                          onChanged: (firstname) {
                            _firstnameTextController;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Lastname", style: TextStyle(fontSize: 20)),
                        TextFormField(
                          validator: RequiredValidator(
                              errorText: "Please fill something!!!"),
                          controller: _lastnameTextController,
                          onChanged: (lastname) {
                            _lastnameTextController;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Age", style: TextStyle(fontSize: 20)),
                        TextFormField(
                          validator: RequiredValidator(
                              errorText: "Please fill age!!!"),
                          controller: _ageTextController,
                          onChanged: (age) {
                            _ageTextController;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Gender", style: TextStyle(fontSize: 20)),
                        TextFormField(
                          validator: RequiredValidator(
                              errorText: "Please fill something!!!"),
                          controller: _genderTextController,
                          onChanged: (gender) {
                            _genderTextController;
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
                          controller: _emailTextController,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (email) {
                            _emailTextController;
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
                          controller: this._passwordTextController,
                          onChanged: (password) {
                            _passwordTextController;
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
                            onPressed: () async {
                              if (formkey.currentState!.validate()) {
                                formkey.currentState!.save();
                                try {
                                  await FirebaseAuth.instance
                                      .createUserWithEmailAndPassword(
                                          email: _emailTextController.text,
                                          password:
                                              _passwordTextController.text)
                                      .then((value) {
                                    user?.updateDisplayName(
                                        _userNameTextController.text);
                                    FirebaseAuth.instance
                                        .signInWithEmailAndPassword(
                                            email: _emailTextController.text,
                                            password:
                                                _passwordTextController.text)
                                        .then((value) {
                                      print(user);
                                      (Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return const homePage();
                                      })));
                                    });
                                  });
                                  formkey.currentState!.reset();
                                } on FirebaseAuthException catch (e) {
                                  if (e.code == 'weak-password') {
                                    print('The password provided is too weak.');
                                  } else if (e.code == 'email-already-in-use') {
                                    print(
                                        'The account already exists for that email.');
                                  }
                                  print(e.message);
                                }
                              }
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
