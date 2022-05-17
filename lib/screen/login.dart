import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:nine2five/screen/forgetpassword.dart';
import 'package:nine2five/screen/today.dart';
import 'package:nine2five/screen/register.dart';
import 'package:nine2five/model/information.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formkey = GlobalKey<FormState>();

  information info = information(
      username: '',
      firstname: '',
      lastname: '',
      age: 0,
      gender: '',
      email: '',
      password: '');

  Future<void> initFirebase() async {
    await Firebase.initializeApp();
    print('Firebase initialized');
  }

  Future<void> login() async {
    try {
      print('Call login');
      print(info.email);
      print(info.password);
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: info.email, password: info.password);
      print(credential);
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const homePage();
      }));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('#######################');
    print('Init state!!');
    print('#######################');
    initFirebase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text("Nine 2 Five",
            style: TextStyle(
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
              const Text("Email",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              TextFormField(
                validator:
                    RequiredValidator(errorText: "Please fill something!!!"),
                onChanged: (email) {
                  info.email = email;
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
                onChanged: (password) {
                  info.password = password;
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
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 0, 0, 0)),
                  ),
                  icon: const Icon(Icons.login),
                  label: const Text("Login", style: TextStyle(fontSize: 32)),
                  onPressed: () {
                    login();
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
