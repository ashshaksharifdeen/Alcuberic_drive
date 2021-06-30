import 'package:face_attendence/screens/studentdetail/studentdetails.dart';
import 'package:flutter/material.dart';
import 'package:face_attendence/screens/studentdetail/components/background.dart';
import 'package:face_attendence/screens/welcomeclass/classwelcome.dart';
import 'package:face_attendence/widgets/rounded_button.dart';
import 'package:face_attendence/widgets/rounded_input_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:face_attendence/model/database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:face_attendence/screens/listview/listmain.dart';

var firebaseUser = FirebaseAuth.instance.currentUser;

class Delete extends StatelessWidget {
  final String userid;
  final String classid;
  Delete({this.userid, this.classid});
  String indexnumber;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Form(
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Student details",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: size.height * 0.03),
                RoundedInputField(
                  hintText: "Index number",
                  onChanged: (value) {
                    indexnumber = value;
                  },
                ),
                RoundedButton(
                  text: "Delete Student details",
                  press: () async {
                    //final stuid = await Databaservice(studentid: indexnumber)
                    //  .studentuserid(studentid: indexnumber);
                    //firebaseUser = stuid;
                    print(firebaseUser);
                    await Databaservice(
                            uid: userid,
                            classid: classid,
                            studentid: indexnumber)
                        .deletestudent(indexnumber);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ListScreen(userid: userid, classid: classid);
                        },
                      ),
                    );
                  },
                ),
                SizedBox(height: size.height * 0.03),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
