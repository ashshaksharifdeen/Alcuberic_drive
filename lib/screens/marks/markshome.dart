import 'package:flutter/material.dart';
import 'package:face_attendence/Screens/marks/components/termssub.dart';

class Markshome extends StatelessWidget {
  final String userid;
  final String classid;
  final List<String> indexnu;
  Markshome({this.userid, this.classid, this.indexnu});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Bbody(
        userid: userid,
        classid: classid,
        indexnu: indexnu,
      ),
    );
  }
}
