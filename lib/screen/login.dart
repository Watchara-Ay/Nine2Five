import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:nine2five/screen/forgetpassword.dart';
import 'package:nine2five/screen/today.dart';
import 'package:nine2five/screen/register.dart';
import 'package:nine2five/model/information.dart';

class LoginPage extends StatelessWidget {
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
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: new Text("Nine 2 Five",
            style: const TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.w500,
                fontFamily: "Roboto",
                fontStyle: FontStyle.normal,
                fontSize: 24.00)),
        backgroundColor: Color.fromARGB(255, 255, 110, 110),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset("assets/images/Nine2Five.png"),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("Username",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              TextFormField(
                validator:
                    RequiredValidator(errorText: "Please fill something!!!"),
                onSaved: (username) {
                  info.username = username!;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("Password",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              TextFormField(
                validator:
                    RequiredValidator(errorText: "Please fill something!!!"),
                obscureText: true,
                onSaved: (password) {
                  info.password = password!;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                  alignment: Alignment.topRight,
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: (() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => forgetpassword()));
                          }),
                          child: const Text(
                            "Forget password?",
                            style: TextStyle(
                                color: Color.fromARGB(255, 4, 0, 252),
                                fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ])),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color.fromARGB(255, 0, 0, 0)),
                  ),
                  icon: const Icon(Icons.login),
                  label: const Text("Login", style: TextStyle(fontSize: 32)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const homePage();
                    }));
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 255, 110, 110)),
                  ),
                  icon: const Icon(Icons.app_registration),
                  label: const Text(
                    "Register",
                    style: TextStyle(fontSize: 32),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const RegisterScreen();
                    }));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
