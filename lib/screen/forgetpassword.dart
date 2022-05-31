import 'package:firebase_auth/firebase_auth.dart';
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
        backgroundColor: const Color.fromARGB(255, 255, 110, 110),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 255, 110, 110)),
                  ),
                  child: const Text("Submit", style: TextStyle(fontSize: 26)),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Are you sure?'),
                            content: const Text(
                                'Are you confirm to register? if yes then link to reset password will send to your email'),
                            actions: <Widget>[
                              FlatButton(
                                onPressed: () async {
                                  if (formkey.currentState!.validate()) {
                                    formkey.currentState!.save();
                                    resetpassword();
                                    formkey.currentState!.reset();
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return LoginPage();
                                    }));
                                  }
                                },
                                child: const Text('Confirm'),
                              ),
                              FlatButton(
                                  onPressed: () {
                                    if (formkey.currentState!.validate()) {}
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
  }
}
