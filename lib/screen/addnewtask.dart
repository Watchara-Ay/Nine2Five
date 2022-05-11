import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:nine2five/model/taskinfo.dart';
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
          padding: const EdgeInsets.all(30.0),
          child: InkWell(
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: const Color.fromRGBO(255, 177, 134, 0.778),
                        ),
                        padding: const EdgeInsets.all(20),
                        alignment: Alignment.bottomCenter,
                        child: Column(children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Task name",
                                    style: TextStyle(fontSize: 20)),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height / 12,
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          213, 190, 190, 190),
                                      border: Border.all(width: 1),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Column(children: [
                                    TextFormField(
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                      validator: RequiredValidator(
                                          errorText:
                                              "Please fill something!!!"),
                                      onSaved: (Taskname) {
                                        info.tname = Taskname!;
                                      },
                                    ),
                                  ]),
                                )
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Task detail",
                                    style: TextStyle(fontSize: 20)),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height / 6,
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          213, 190, 190, 190),
                                      border: Border.all(width: 1),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Column(children: [
                                    TextFormField(
                                      keyboardType: TextInputType.multiline,
                                      minLines: 1,
                                      maxLines: 5,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                      validator: RequiredValidator(
                                          errorText:
                                              "Please fill something!!!"),
                                      onSaved: (Taskdetail) {
                                        info.tdetail = Taskdetail!;
                                      },
                                    ),
                                  ]),
                                )
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Notify",
                                    style: TextStyle(fontSize: 20)),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height / 12,
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          213, 190, 190, 190),
                                      border: Border.all(width: 1),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Column(children: [
                                    TextFormField(
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                      validator: RequiredValidator(
                                          errorText:
                                              "Please fill something!!!"),
                                      onSaved: (priority) {
                                        info.priority = priority!;
                                      },
                                    ),
                                  ]),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height / 12,
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          213, 190, 190, 190),
                                      border: Border.all(width: 1),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Column(children: [
                                    TextFormField(
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Date",
                                      ),
                                      validator: RequiredValidator(
                                          errorText:
                                              "Please fill something!!!"),
                                      onSaved: (Tdate) {
                                        info.tdate = Tdate! as DateTime;
                                      },
                                    ),
                                  ]),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height / 12,
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          213, 190, 190, 190),
                                      border: Border.all(width: 1),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Column(children: [
                                    TextFormField(
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Start time",
                                      ),
                                      validator: RequiredValidator(
                                          errorText:
                                              "Please fill something!!!"),
                                      onSaved: (stime) {
                                        info.stime = stime! as DateTime;
                                      },
                                    ),
                                  ]),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height / 12,
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          213, 190, 190, 190),
                                      border: Border.all(width: 1),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Column(children: [
                                    TextFormField(
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "End time",
                                      ),
                                      validator: RequiredValidator(
                                          errorText:
                                              "Please fill something!!!"),
                                      onSaved: (etime) {
                                        info.etime = etime! as DateTime;
                                      },
                                    ),
                                  ]),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 70,
                          ),
                          Container(
                            alignment: FractionalOffset.bottomCenter,
                            height: 21,
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
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const homePage()));
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
                        ])),
                    //
                  ]),
            ),
          ),
        ),
      );
    });
  }
}
