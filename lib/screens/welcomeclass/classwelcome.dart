import 'package:flutter/material.dart';
import 'package:face_attendence/Screens/welcomeclass/components/body.dart';

class WelcomeScreenclasscheck extends StatelessWidget {
  final String text;
  WelcomeScreenclasscheck({this.text});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
