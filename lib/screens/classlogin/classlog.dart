import 'package:flutter/material.dart';
import 'package:face_attendence/screens/classlogin/components/body.dart';

class ClassLoginScreen extends StatelessWidget {
  final String userid;
  final String classid;
  ClassLoginScreen({this.userid, this.classid});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
