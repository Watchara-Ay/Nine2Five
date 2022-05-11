import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:nine2five/model/taskinfo.dart';
import 'package:nine2five/screen/taskdetail.dart';
import 'package:nine2five/screen/today.dart';

class addnewtask extends StatelessWidget {
  final formkey = GlobalKey<FormState>();
  taskinfo info = taskinfo(
    tname: "",
    tdetail: "",
    tdate: DateTime.now(),
    priority: "",
    stime: DateTime.now(),
    etime: DateTime.now(),
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(builder: (context, snapshot) {
      return Scaffold(
          // body: Stack(
          //   children: [
          //     Container(
          //       height: 160,
          //       child: AppBar(
          //         backgroundColor: Color(0xfff96060),
          //         title: Text("Add task"),
          //         centerTitle: true,
          //       ),
          //     ),
          //     Padding(
          //       padding: EdgeInsets.all(30),
          //       child: Card(
          //         color: Color.fromRGBO(255, 177, 134, 30),
          //         child: _buildBody(),
          //       ),
          //     )
          //   ],
          // ),
          // appBar: AppBar(
          //   centerTitle: true,
          //   title: const Text("Add task"),
          //   backgroundColor: Color.fromARGB(255, 255, 110, 110),
          // ),
          // body: Container(
          //   child: Padding(
          //     padding: const EdgeInsets.all(30.0),
          //     child: Form(
          //       child: SingleChildScrollView(
          //         child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               const Text("Task name", style: TextStyle(fontSize: 20)),
          //               TextFormField(
          //                 validator: RequiredValidator(
          //                     errorText: "Please fill something!!!"),
          //                 onSaved: (tname) {
          //                   info.tname = tname!;
          //                 },
          //               ),
          //               const SizedBox(
          //                 height: 10,
          //               ),
          //               const Text("Task detail", style: TextStyle(fontSize: 20)),
          //               TextFormField(
          //                 validator: RequiredValidator(
          //                     errorText: "Please fill something!!!"),
          //                 onSaved: (Taskdetail) {
          //                   info.tdetail = Taskdetail!;
          //                 },
          //               ),
          //               const SizedBox(
          //                 height: 10,
          //               ),
          //               const Text("Date", style: TextStyle(fontSize: 20)),
          //               TextFormField(
          //                 validator: RequiredValidator(
          //                     errorText: "Please fill something!!!"),
          //                 onSaved: (Tdate) {
          //                   info.tdate = Tdate! as DateTime;
          //                 },
          //               ),
          //               const SizedBox(
          //                 height: 10,
          //               ),
          //               const Text("priority", style: TextStyle(fontSize: 20)),
          //               TextFormField(
          //                 validator:
          //                     RequiredValidator(errorText: "Please fill age!!!"),
          //                 onSaved: (priority) {
          //                   info.priority = priority!;
          //                 },
          //               ),
          //               const SizedBox(
          //                 height: 10,
          //               ),
          //               const Text("Start time", style: TextStyle(fontSize: 20)),
          //               TextFormField(
          //                 validator: RequiredValidator(
          //                     errorText: "Please fill something!!!"),
          //                 onSaved: (stime) {
          //                   info.stime = stime! as DateTime;
          //                 },
          //               ),
          //               const SizedBox(
          //                 height: 10,
          //               ),
          //               const Text("End time", style: TextStyle(fontSize: 20)),
          //               TextFormField(
          //                 validator: RequiredValidator(
          //                     errorText: "Please fill something!!!"),
          //                 onSaved: (etime) {
          //                   info.etime = etime! as DateTime;
          //                 },
          //               ),
          //               const SizedBox(
          //                 height: 10,
          //               ),
          //               SizedBox(
          //                 width: double.infinity,
          //                 child: ElevatedButton(
          //                   style: ButtonStyle(
          //                     backgroundColor: MaterialStateProperty.all(
          //                         Color.fromARGB(255, 255, 110, 110)),
          //                   ),
          //                   child: const Text("Submit"),
          //                   onPressed: () {
          //                     if (formkey.currentState!.validate()) {
          //                       formkey.currentState!.save();
          //                       print("username = ${info.tname} "
          //                           "firstname = ${info.tdetail}"
          //                           "lastname = ${info.tdate} "
          //                           "age = ${info.priority} "
          //                           "gender = ${info.stime} "
          //                           "email = ${info.etime} ");
          //                       formkey.currentState!.reset();
          //                       Navigator.push(context,
          //                           MaterialPageRoute(builder: (context) {
          //                         return const homePage();
          //                       }));
          //                     }
          //                   },
          //                 ),
          //               ),
          //             ]),
          //       ),
          //     ),
          //   ),
          // ),
          );
    });
  }

  _buildBody() {
    return ListView(
      children: [
        Container(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Form(
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Task name", style: TextStyle(fontSize: 20)),
                      TextFormField(
                        validator: RequiredValidator(
                            errorText: "Please fill something!!!"),
                        onSaved: (tname) {
                          info.tname = tname!;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("Task detail", style: TextStyle(fontSize: 20)),
                      TextFormField(
                        validator: RequiredValidator(
                            errorText: "Please fill something!!!"),
                        onSaved: (Taskdetail) {
                          info.tdetail = Taskdetail!;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("Date", style: TextStyle(fontSize: 20)),
                      TextFormField(
                        validator: RequiredValidator(
                            errorText: "Please fill something!!!"),
                        onSaved: (Tdate) {
                          info.tdate = Tdate! as DateTime;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("priority", style: TextStyle(fontSize: 20)),
                      TextFormField(
                        validator:
                            RequiredValidator(errorText: "Please fill age!!!"),
                        onSaved: (priority) {
                          info.priority = priority!;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("Start time", style: TextStyle(fontSize: 20)),
                      TextFormField(
                        validator: RequiredValidator(
                            errorText: "Please fill something!!!"),
                        onSaved: (stime) {
                          info.stime = stime! as DateTime;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("End time", style: TextStyle(fontSize: 20)),
                      TextFormField(
                        validator: RequiredValidator(
                            errorText: "Please fill something!!!"),
                        onSaved: (etime) {
                          info.etime = etime! as DateTime;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: FractionalOffset.bottomCenter,
                        height: 70,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: (() => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => homePage()),
                                      )),
                                  child: const Text(
                                    "Submit",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 18),
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
                                        context!,
                                        MaterialPageRoute(
                                            builder: (context) => homePage()));
                                  }),
                                  child: const Text(
                                    "Exit",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 18),
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
      ],
    );
  }
}
