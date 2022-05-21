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
  FirebaseFirestore firestore = FirebaseFirestore.instance;

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
                          controller: this._userNameTextController,
                          onChanged: (username) {
                            info.username = _userNameTextController as String;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Firstname", style: TextStyle(fontSize: 20)),
                        TextFormField(
                          validator: RequiredValidator(
                              errorText: "Please fill something!!!"),
                          controller: this._firstnameTextController,
                          onChanged: (firstname) {
                            info.firstname = _firstnameTextController as String;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Lastname", style: TextStyle(fontSize: 20)),
                        TextFormField(
                          validator: RequiredValidator(
                              errorText: "Please fill something!!!"),
                          controller: this._lastnameTextController,
                          onChanged: (lastname) {
                            info.lastname = _lastnameTextController as String;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Age", style: TextStyle(fontSize: 20)),
                        TextFormField(
                          validator: RequiredValidator(
                              errorText: "Please fill age!!!"),
                          controller: this._ageTextController,
                          onChanged: (age) {
                            info.age = _ageTextController as int;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Gender", style: TextStyle(fontSize: 20)),
                        TextFormField(
                          validator: RequiredValidator(
                              errorText: "Please fill something!!!"),
                          controller: this._genderTextController,
                          onChanged: (gender) {
                            info.gender = _genderTextController as String;
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
                          controller: this._emailTextController,
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
                                    FirebaseAuth.instance
                                        .signInWithEmailAndPassword(
                                            email: _emailTextController.text,
                                            password:
                                                _passwordTextController.text);
                                    (Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return const homePage();
                                    })));
                                  });
                                  formkey.currentState!.reset();
                                } on FirebaseAuthException catch (e) {
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
