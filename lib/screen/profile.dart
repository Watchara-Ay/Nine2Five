import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:nine2five/model/information.dart';
import 'package:nine2five/screen/login.dart';

class profilepage extends StatelessWidget {
  final formkey = GlobalKey<FormState>();
  information info = information(
      username: '',
      firstname: '',
      lastname: '',
      gender: '',
      email: '',
      password: '');

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(builder: (context, snapshot) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Profile Page"),
          backgroundColor: Color.fromARGB(255, 255, 110, 110),
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Form(
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, children: []),
              ),
            ),
          ),
        ),
      );
    });
  }
}
