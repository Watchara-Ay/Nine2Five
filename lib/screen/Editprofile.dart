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
          title: const Text("Edit profile"),
          backgroundColor: const Color.fromARGB(255, 255, 110, 110),
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: Form(
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 1.26,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(20),
                        alignment: Alignment.bottomCenter,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Firstname",
                                  style: TextStyle(fontSize: 20)),
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
                              const Text("Lastname",
                                  style: TextStyle(fontSize: 20)),
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
                                validator: RequiredValidator(
                                    errorText: "Please fill age!!!"),
                                onSaved: (age) {
                                  info.age = age! as int;
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text("Gender",
                                  style: TextStyle(fontSize: 20)),
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
                                width: 100,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        const Color.fromARGB(
                                            255, 255, 110, 110)),
                                  ),
                                  child: const Text(
                                    "Confirm",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 18),
                                  ),
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
                            ]),
                      ),
                      Container(
                        height: 70,
                        color: const Color(0xff292e4e),
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
                                            builder: (context) =>
                                                const homePage()));
                                  }),
                                  child: const Text(
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
                                  child: const Text(
                                    "Profile",
                                    style: const TextStyle(
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
