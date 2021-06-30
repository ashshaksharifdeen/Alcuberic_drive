import 'package:flutter/material.dart';
import 'package:face_attendence/screens/classsignin/components/body.dart';

class ClassSignUpScreen extends StatelessWidget {
  final String userid;
  ClassSignUpScreen({this.userid});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        userid: userid,
      ),
    );
  }
}
