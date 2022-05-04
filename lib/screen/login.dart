import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:nine2five/screen/forgetpassword.dart';
import 'package:nine2five/screen/today.dart';
import 'package:nine2five/screen/register.dart';
import 'package:nine2five/model/profile.dart';

class LoginPage extends StatelessWidget {
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
        centerTitle: true,
        title: const Text("Login Page"),
        backgroundColor: Color.fromARGB(255, 255, 110, 110),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 40, 10, 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("assets/images/Nine2Five.png"),
              const SizedBox(
                height: 10,
              ),
              const Text("Username", style: TextStyle(fontSize: 14)),
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
              const Text("Password", style: TextStyle(fontSize: 14)),
              TextFormField(
                validator:
                    RequiredValidator(errorText: "Please fill something!!!"),
                obscureText: true,
                onSaved: (password) {
                  profile.password = password!;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 255, 110, 110)),
                  ),
                  icon: const Icon(Icons.edit),
                  label: const Text("Forget password",
                      style: TextStyle(fontSize: 14)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return forgetpassword();
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
                        Color.fromARGB(255, 255, 110, 110)),
                  ),
                  icon: const Icon(Icons.login),
                  label: const Text("Login", style: TextStyle(fontSize: 20)),
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
                    style: TextStyle(fontSize: 20),
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
