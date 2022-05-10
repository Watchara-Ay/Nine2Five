import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:nine2five/model/information.dart';
import 'package:nine2five/screen/profile.dart';
import 'package:nine2five/screen/today.dart';

class editprofilepage extends StatelessWidget {
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
          title: const Text("Register Page"),
          backgroundColor: Color.fromARGB(255, 255, 110, 110),
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Form(
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Firstname", style: TextStyle(fontSize: 20)),
                      TextFormField(
                        validator: RequiredValidator(
                            errorText: "Please fill something!!!"),
                        onSaved: (firstname) {
                          info.firstname = firstname!;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("Lastname", style: TextStyle(fontSize: 20)),
                      TextFormField(
                        validator: RequiredValidator(
                            errorText: "Please fill something!!!"),
                        onSaved: (lastname) {
                          info.lastname = lastname!;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("Gender", style: TextStyle(fontSize: 20)),
                      TextFormField(
                        validator: RequiredValidator(
                            errorText: "Please fill something!!!"),
                        onSaved: (gender) {
                          info.gender = gender!;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Color.fromARGB(255, 255, 110, 110)),
                          ),
                          child: const Text("Confirm"),
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              formkey.currentState!.save();
                              print("firstname = ${info.firstname} "
                                  "lastname = ${info.lastname} "
                                  "gender = ${info.gender} ");
                              formkey.currentState!.reset();
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const homePage();
                              }));
                            }
                          },
                        ),
                      ),
                      SizedBox.fromSize(
                        //button to today
                        size: Size(64, 64),
                        child: ClipOval(
                          child: Material(
                            color: Color.fromARGB(255, 38, 41, 123),
                            child: InkWell(
                              splashColor: Colors.green,
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return homePage();
                                }));
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const <Widget>[
                                  Icon(Icons.home), // <-- Icon
                                  Text(
                                    "Mytask",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox.fromSize(
                        //button to profile
                        size: Size(64, 64),
                        child: ClipOval(
                          child: Material(
                            color: Color.fromARGB(255, 38, 41, 123),
                            child: InkWell(
                              splashColor: Colors.green,
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return profilepage();
                                }));
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.account_circle), // <-- Icon
                                  Text(
                                    "Profile",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        ),
      );
    });
  }
}
