import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:nine2five/model/profile.dart';

class forgetpassword extends StatelessWidget {
  final formkey = GlobalKey<FormState>();
  Profile profile = Profile(
      username: '',
      firstname: '',
      lastname: '',
      gender: '',
      email: '',
      password: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Forget Password Page"),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 255, 110, 110),
        ),
        body: Padding(
          padding: const EdgeInsets.all(100.0),
          child: SingleChildScrollView(
            child: Row(
              children: [
                const Text("Username", style: TextStyle(fontSize: 20)),
                TextFormField(
                  validator:
                      RequiredValidator(errorText: "Please fill something!!!"),
                  onSaved: (username) {
                    profile.username = username!;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text("Password", style: TextStyle(fontSize: 20)),
                TextFormField(
                  validator:
                      RequiredValidator(errorText: "Please fill something!!!"),
                  obscureText: true,
                  onSaved: (password) {
                    profile.password = password!;
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
