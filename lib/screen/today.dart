//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:intl/date_symbol_data_local.dart';
import 'package:nine2five/screen/login.dart';
import 'package:nine2five/screen/profile.dart';
import 'package:table_calendar/table_calendar.dart';
//import 'package:flutter/material.dart';
//import 'package:newtotolist/CheckList.dart';
//import 'package:newtotolist/NewTask.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
//import 'package:newtotolist/NewNote.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  String filterType = "today";
  DateTime today = new DateTime.now();
  String taskPop = "close";
  var monthNames = [
    "JAN",
    "FEB",
    "MAR",
    "APR",
    "MAY",
    "JUN",
    "JUL",
    "AUG",
    "SEPT",
    "OCT",
    "NOV",
    "DEC"
  ];
  CalendarBuilders ctrlr = new CalendarBuilders();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                backgroundColor: Color(0xfff96060),
                elevation: 0,
                title: Text(
                  "Work List",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Container(
                height: 70,
                color: Color(0xfff96060),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            changeFilter("today");
                          },
                          child: Text(
                            "Today",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 4,
                          width: 120,
                          color: (filterType == "today")
                              ? Colors.white
                              : Colors.transparent,
                        )
                      ],
                    ),
                    SizedBox.fromSize(
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
                                ), // <-- Text
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox.fromSize(
                      size: Size(64, 64),
                      child: ClipOval(
                        child: Material(
                          color: Color.fromARGB(255, 38, 41, 123),
                          child: InkWell(
                            splashColor: Colors.green,
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return LoginPage();
                              }));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.logout_sharp), // <-- Icon
                                Text(
                                  "Logout",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.grey),
                                ),
                                // <-- Text
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            changeFilter("weekly");
                          },
                          child: Text(
                            "Weekly",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 4,
                          width: 120,
                          color: (filterType == "weekly")
                              ? Colors.white
                              : Colors.transparent,
                        )
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Today ${monthNames[today.month - 1]}, ${today.day}/${today.year}",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 110,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      child: Container(
                        height: 90,
                        width: MediaQuery.of(context).size.width,
                        color: Color(0xff292e4e),
                        padding: EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.account_circle,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Profile",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.logout,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Logout",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 25,
                      left: 0,
                      right: 0,
                      child: InkWell(
                        onTap: openTaskPop,
                        child: Container(
                          height: 85,
                          width: 85,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [Color(0xfff96060), Colors.red],
                              ),
                              shape: BoxShape.circle),
                          child: Center(
                            child: Text(
                              "+",
                              style:
                                  TextStyle(fontSize: 30, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Container(
            child: (taskPop == "open")
                ? Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black.withOpacity(0.3),
                    child: Center(
                      child: InkWell(
                        onTap: closeTaskPop,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.white),
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                height: 1,
                              ),
                              InkWell(
                                //onTap: openNewTask,
                                child: Container(
                                  child: Text(
                                    "Add Task",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 1,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(),
          )
        ],
      ),
    );
  }

  openTaskPop() {
    taskPop = "open";
    setState(() {});
  }

  closeTaskPop() {
    taskPop = "close";
    setState(() {});
  }

  changeFilter(String filter) {
    filterType = filter;
    setState(() {});
  }
}
