import 'package:flutter/material.dart';
import 'package:nine2five/screen/login.dart';

class TodayPage extends StatefulWidget {
  const TodayPage({Key? key}) : super(key: key);

  @override
  State<TodayPage> createState() => _TodayPageState();
}

class _TodayPageState extends State<TodayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Today Page"),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 255, 110, 110),
        ),
        body: Padding(
          padding: const EdgeInsets.all(100.0),
          child: SingleChildScrollView(
            child: Row(
              children: [Text("data")],
            ),
          ),
        ));
  }
}
