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
      age: 0,
      gender: '',
      email: '',
      password: '');

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(builder: (context, snapshot) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text("Register Page"),
          backgroundColor: Color.fromARGB(255, 255, 110, 110),
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
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
                      const Text("Age", style: TextStyle(fontSize: 20)),
                      TextFormField(
                        validator:
                            RequiredValidator(errorText: "Please fill age!!!"),
                        onSaved: (age) {
                          info.age = age! as int;
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
                                  "age = ${info.age} "
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
                      Container(
                        height: 70,
                        color: Color(0xff292e4e),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: (() {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => homePage()));
                                  }),
                                  child: Text(
                                    "Mytask",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: (() {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                profilepage()));
                                  }),
                                  child: Text(
                                    "Profile",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ),
                              ],
                            ),
                          ],
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
