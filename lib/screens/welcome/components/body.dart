import 'package:flutter/material.dart';
import 'package:face_attendence/widgets/ScaleRout.dart';
import 'package:face_attendence/Screens/Login/login_screen.dart';
import 'package:face_attendence/Screens/Signup/signup_screen.dart';
import 'package:face_attendence/Screens/Welcome/components/background.dart';
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
              "School Management",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.05),
            SvgPicture.asset(
              "assets/icons/chat.svg",
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "LOGIN in your School",
              press: () =>
                  {Navigator.push(context, ScaleRoute(page: LoginScreen()))},
            ),
            RoundedButton(
              text: "SIGN UP in your School",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () =>
                  {Navigator.push(context, ScaleRoute(page: SignUpScreen()))},
            ),
          ],
        ),
      ),
    );
  }
}
