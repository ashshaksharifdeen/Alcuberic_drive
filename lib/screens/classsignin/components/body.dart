import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:face_attendence/screens/classlogin/classlog.dart';
import 'package:face_attendence/screens/classsignin/components/background.dart';
import 'package:face_attendence/widgets/already_have_an_account_acheck.dart';
import 'package:face_attendence/widgets/rounded_button.dart';
import 'package:face_attendence/widgets/rounded_input_field.dart';
import 'package:face_attendence/widgets/rounded_password_field.dart';
import 'package:face_attendence/model/database.dart';
import 'package:flutter_svg/svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:face_attendence/screens/listview/listmain.dart';

class Body extends StatelessWidget {
  final String userid;
  Body({this.userid});
  final _auth = FirebaseAuth.instance;
  String classname;
  var classid = FirebaseAuth.instance.currentUser;
  bool showProgress = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGNUP FOR YOUR CLASS",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            Positioned(
              top: 50,
              left: 50,
              child: Image.asset(
                "assets/images/digitalclassroom.png",
                width: size.width * 0.35,
              ),
            ),
            RoundedInputField(
              hintText: "(Eg:10-A)",
              onChanged: (value) {
                classname = value;
              },
            ),
            RoundedButton(
              text: "SIGNUP FOR NEW Class",
              press: () async {
                //uid get it from regitered email
                await Databaservice(uid: userid, classid: classname)
                    .createclasses(classname);
                if (classname != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ListScreen(userid: userid, classid: classname)),
                  );

                  showProgress = false;
                }
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ClassLoginScreen(
                        userid: userid,
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
