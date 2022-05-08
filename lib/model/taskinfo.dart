import 'dart:async';

class taskinfo {
  String tname;
  String tdetail;
  DateTime tdate;
  String priority;
  Timer stime;
  Timer etime;

  taskinfo({
    required this.tname,
    required this.tdetail,
    required this.tdate,
    required this.priority,
    required this.stime,
    required this.etime,
  });
}
