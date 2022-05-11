import 'package:flutter/material.dart';
import 'package:nine2five/screen/addnewtask.dart';
import 'package:nine2five/screen/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Color.fromRGBO(255, 204, 175, 100),
        ),
        home: LoginPage());
  }
}
