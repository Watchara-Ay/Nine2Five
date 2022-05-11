import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:nine2five/model/information.dart';
import 'package:nine2five/screen/today.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                          onSaved: (username) {
                            info.username = username!;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Firstname", style: TextStyle(fontSize: 20)),
                        TextFormField(
                          validator: RequiredValidator(
                              errorText: "Please fill something!!!"),
                          onSaved: (firstname) {
                            info.firstname = firstname!;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Lastname", style: TextStyle(fontSize: 20)),
                        TextFormField(
                          validator: RequiredValidator(
                              errorText: "Please fill something!!!"),
                          onSaved: (lastname) {
                            info.lastname = lastname!;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Age", style: TextStyle(fontSize: 20)),
                        TextFormField(
                          validator: RequiredValidator(
                              errorText: "Please fill age!!!"),
                          onSaved: (age) {
                            info.age = age! as int;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Gender", style: TextStyle(fontSize: 20)),
                        TextFormField(
                          validator: RequiredValidator(
                              errorText: "Please fill something!!!"),
                          onSaved: (gender) {
                            info.gender = gender!;
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
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (email) {
                            info.email = email!;
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
                          onSaved: (password) {
                            info.password = password!;
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
                              if (formkey.currentState!.validate()) {
                                formkey.currentState!.save();
                                print("username = ${info.username} "
                                    "firstname = ${info.firstname} "
                                    "lastname = ${info.lastname} "
                                    "age = ${info.age} "
                                    "gender = ${info.gender} "
                                    "email = ${info.email} "
                                    "password = ${info.password}");
                                formkey.currentState!.reset();
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const homePage();
                                }));
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
