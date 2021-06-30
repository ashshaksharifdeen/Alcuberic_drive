import 'package:face_attendence/screens/listview/listmain.dart';
import 'package:flutter/material.dart';
import 'package:face_attendence/Screens/classlogin/components/background.dart';
import 'package:face_attendence/screens/classsignin/classsign.dart';
import 'package:face_attendence/widgets/already_have_an_account_acheck.dart';
import 'package:face_attendence/widgets/rounded_button.dart';
import 'package:face_attendence/widgets/rounded_input_field.dart';
import 'package:face_attendence/widgets/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:face_attendence/model/database.dart';
import 'package:firebase_core/firebase_core.dart';

class Body extends StatelessWidget {
  String gclassname;
  final String userid;
  final String classname;
  Body({this.userid, this.classname});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN INTO YOUR CLASS",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            Positioned(
              top: 50,
              left: 50,
              child: Image.asset(
                "assets/images/educationalclassroom.png",
                width: size.width * 0.35,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "eg 10-A",
              onChanged: (value) {
                gclassname = value;
              }, //if account is not in the database call that or return any error message
            ),
            RoundedButton(
                text: "GET INTO YOUR Class",
                press: () async {
                  print('help me Allah');

                  final CollectionReference classcollections =
                      FirebaseFirestore.instance.collection('Shools');
                  print(classcollections.toString());

                  QuerySnapshot querySnapshots = await classcollections
                      .doc(userid)
                      .collection('classes')
                      .get();
                  print(querySnapshots.toString());

                  querySnapshots.docs.forEach((doc) {
                    print(doc);
                    if (doc == gclassname) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ListScreen()));
                    }
                  });
                }),
            //push to next page and check already have account

            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ClassSignUpScreen();
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
