import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nine2five/screen/login.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  Future<void> initFirebase() async {
    await Firebase.initializeApp();
    print('Firebase initialized');
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Color.fromARGB(233, 255, 171, 146),
        ),
        home: LoginPage());
  }
}
