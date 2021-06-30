import 'package:face_attendence/screens/studentdetail/components/termssub.dart';
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
import 'package:face_attendence/screens/studentdetail/components/deletecol.dart';
import 'package:face_attendence/screens/listview/listmain.dart';
import 'package:face_attendence/screens/studentdetail/components/liststu.dart';

var firebaseUser = FirebaseAuth.instance.currentUser;

class Bbody extends StatelessWidget {
  final String userid;
  final String classid;
  Bbody({this.userid, this.classid});
  String fullname;
  String indexnumber;
  String parentphonenumber;
  String Address;
  String studentemail;
  DateTime newDateTime;

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
                  hintText: "Full Name",
                  onChanged: (value) {
                    fullname = value;
                  },
                ),
                RoundedInputField(
                  hintText: "Index Number",
                  onChanged: (value) {
                    indexnumber = value;
                  },
                ),
                RoundedInputField(
                  hintText: "Parent Phone Number",
                  onChanged: (value) {
                    parentphonenumber = value;
                  },
                ),
                RoundedInputField(
                  hintText: "Address",
                  onChanged: (value) {
                    Address = value;
                  },
                ),
                RoundedInputField(
                  hintText: "Student Email",
                  onChanged: (value) {
                    studentemail = value;
                  },
                ),
                Container(
                  height: 200,
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    initialDateTime: DateTime(2000, 1, 1),
                    onDateTimeChanged: (value) {
                      newDateTime = value;
                      // Do something
                    },
                  ),
                ),
                RoundedButton(
                  text: "Submit",
                  press: () async {
                    //final stuid = await Databaservice(studentid: indexnumber)
                    //  .studentuserid(studentid: indexnumber);
                    //firebaseUser = stuid;
                    print(firebaseUser);
                    await Databaservice(
                            uid: userid,
                            classid: classid,
                            studentid: indexnumber)
                        .studentdetails(
                            fullname,
                            indexnumber,
                            parentphonenumber,
                            Address,
                            studentemail,
                            newDateTime);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ListScreen(
                              userid: userid,
                              classid:
                                  classid); //before move check that if account already exist give notification from database
                        },
                      ),
                    );
                  },
                ),
                RoundedButton(
                  text: "Delete Student details",
                  press: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Delete(
                            userid: userid,
                            classid: classid,
                          ); //before move check that if account already exist give notification from database
                        },
                      ),
                    );
                  },
                ),
                RoundedButton(
                  text: "View Student",
                  press: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Listpageid(
                            userid: userid,
                            classid: classid,
                          ); //before move check that if account already exist give notification from database
                        },
                      ),
                    );
                  },
                ),
                RoundedButton(
                  text: "Add subjects",
                  press: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Termsub(
                            userid: userid,
                            classid: classid,
                          ); //before move check that if account already exist give notification from database
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
