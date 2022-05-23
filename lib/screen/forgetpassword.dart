import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:nine2five/model/information.dart';
import 'package:nine2five/screen/login.dart';

class forgetpassword extends StatelessWidget {
  final formkey = GlobalKey<FormState>();
  final TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

  information info = information(
      username: '',
      firstname: '',
      lastname: '',
      age: 0,
      gender: '',
      email: '',
      password: '');

  Future<void> resetpassword() async {
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: _emailTextController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Forget Password Page"),
        backgroundColor: Color.fromARGB(255, 255, 110, 110),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: formkey,
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Email", style: TextStyle(fontSize: 20)),
                    TextFormField(
                      validator: MultiValidator([
                        RequiredValidator(errorText: "Please fill email"),
                        EmailValidator(errorText: "Wrong email formation")
                      ]),
                      controller: this._emailTextController,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (email) {
                        this._emailTextController;
                      },
                    ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // const Text("Password", style: TextStyle(fontSize: 20)),
                    // TextFormField(
                    //   validator: RequiredValidator(
                    //       errorText: "Please fill something!!!"),
                    //   obscureText: true,
                    //   onSaved: (password) {
                    //     info.password = password!;
                    //   },
                    // ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // const Text("New Password", style: TextStyle(fontSize: 20)),
                    // TextFormField(
                    //   validator: RequiredValidator(
                    //       errorText: "Please fill something!!!"),
                    //   obscureText: true,
                    //   onSaved: (password) {
                    //     info.password = password!;
                    //   },
                    // ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 255, 110, 110)),
                        ),
                        child: const Text("Submit",
                            style: TextStyle(fontSize: 26)),
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            formkey.currentState!.save();
                            // print("username = ${info.username} "
                            //     "email = ${info.email} "
                            //     "password = ${info.password}");
                            resetpassword();
                            formkey.currentState!.reset();

                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return LoginPage();
                            }));
                          }
                        },
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
