import 'package:face_attendence/screens/classlogin/components/body.dart';
import 'package:flutter/material.dart';
import 'package:face_attendence/Screens/studentdetail/components/body.dart';

class Studentdetails extends StatelessWidget {
  final String userid;
  final String classid;
  Studentdetails({this.userid, this.classid});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Bbody(userid: userid, classid: classid),
    );
  }
}
