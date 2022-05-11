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
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text("Add task"),
          backgroundColor: const Color.fromARGB(255, 255, 110, 110),
        ),
        body: Padding(
          padding: EdgeInsets.all(30.0),
          child: InkWell(
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: MediaQuery.of(context).size.height / 1.2,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: Color.fromRGBO(255, 177, 134, 0.778),
                        ),
                        padding: EdgeInsets.all(20),
                        alignment: Alignment.bottomCenter,
                        child: Column(children: [
                          Text("Task name", style: TextStyle(fontSize: 20)),
                          TextFormField(
                            validator: RequiredValidator(
                                errorText: "Please fill something!!!"),
                            onSaved: (tname) {
                              info.tname = tname!;
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Task detail", style: TextStyle(fontSize: 20)),
                          TextFormField(
                            validator: RequiredValidator(
                                errorText: "Please fill something!!!"),
                            onSaved: (Taskdetail) {
                              info.tdetail = Taskdetail!;
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Date", style: TextStyle(fontSize: 20)),
                          TextFormField(
                            validator: RequiredValidator(
                                errorText: "Please fill something!!!"),
                            onSaved: (Tdate) {
                              info.tdate = Tdate! as DateTime;
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("priority", style: TextStyle(fontSize: 20)),
                          TextFormField(
                            validator: RequiredValidator(
                                errorText: "Please fill age!!!"),
                            onSaved: (priority) {
                              info.priority = priority!;
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Start time", style: TextStyle(fontSize: 20)),
                          TextFormField(
                            validator: RequiredValidator(
                                errorText: "Please fill something!!!"),
                            onSaved: (stime) {
                              info.stime = stime! as DateTime;
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("End time", style: TextStyle(fontSize: 20)),
                          TextFormField(
                            validator: RequiredValidator(
                                errorText: "Please fill something!!!"),
                            onSaved: (etime) {
                              info.etime = etime! as DateTime;
                            },
                          ),
                          SizedBox(
                            height: 17,
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
                                                builder: (context) =>
                                                    const homePage()),
                                          )),
                                      child: Text(
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
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const homePage()));
                                      }),
                                      child: Text(
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
                        ])),
                    // Text("Task name", style: TextStyle(fontSize: 20)),
                    // TextFormField(
                    //   validator: RequiredValidator(
                    //       errorText: "Please fill something!!!"),
                    //   onSaved: (tname) {
                    //     info.tname = tname!;
                    //   },
                    // ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // Text("Task detail", style: TextStyle(fontSize: 20)),
                    // TextFormField(
                    //   validator: RequiredValidator(
                    //       errorText: "Please fill something!!!"),
                    //   onSaved: (Taskdetail) {
                    //     info.tdetail = Taskdetail!;
                    //   },
                    // ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // Text("Date", style: TextStyle(fontSize: 20)),
                    // TextFormField(
                    //   validator: RequiredValidator(
                    //       errorText: "Please fill something!!!"),
                    //   onSaved: (Tdate) {
                    //     info.tdate = Tdate! as DateTime;
                    //   },
                    // ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // Text("priority", style: TextStyle(fontSize: 20)),
                    // TextFormField(
                    //   validator:
                    //       RequiredValidator(errorText: "Please fill age!!!"),
                    //   onSaved: (priority) {
                    //     info.priority = priority!;
                    //   },
                    // ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // Text("Start time", style: TextStyle(fontSize: 20)),
                    // TextFormField(
                    //   validator: RequiredValidator(
                    //       errorText: "Please fill something!!!"),
                    //   onSaved: (stime) {
                    //     info.stime = stime! as DateTime;
                    //   },
                    // ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // Text("End time", style: TextStyle(fontSize: 20)),
                    // TextFormField(
                    //   validator: RequiredValidator(
                    //       errorText: "Please fill something!!!"),
                    //   onSaved: (etime) {
                    //     info.etime = etime! as DateTime;
                    //   },
                    // ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                  ]),
            ),
          ),
        ),
      );
    });
  }

  _buildBody() {
    return ListView();
  }
}
