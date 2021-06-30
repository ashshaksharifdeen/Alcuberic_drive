import 'package:flutter/material.dart';
import 'package:face_attendence/Screens/listview/components/body.dart';

class ListScreen extends StatelessWidget {
  final String userid;
  final String classid;
  ListScreen({this.userid, this.classid});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        userid: userid,
        classid: classid,
      ),
    );
  }
}
