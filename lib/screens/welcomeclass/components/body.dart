import 'package:flutter/material.dart';
import 'package:face_attendence/widgets/ScaleRout.dart';
import 'package:face_attendence/screens/classlogin/classlog.dart';
import 'package:face_attendence/screens/classsignin/classsign.dart';
import 'package:face_attendence/screens/welcomeclass/components/background.dart';
import 'package:face_attendence/widgets/rounded_button.dart';
import 'package:face_attendence/constants.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "GET into your Classroom",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.05),
            Positioned(
              top: 50,
              left: 50,
              child: Image.asset(
                "assets/images/welcomeclassroom.png",
                width: size.width * 0.45,
              ),
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "LOGIN in your Class",
              press: () => {
                Navigator.push(context, ScaleRoute(page: ClassLoginScreen()))
              }, //login into the created classroom
            ),
            RoundedButton(
              text: "SIGN UP in your Class",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () => {
                Navigator.push(context, ScaleRoute(page: ClassSignUpScreen()))
              }, //Signinto created classrom
            ),
          ],
        ),
      ),
    );
  }
}
