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
import 'package:face_attendence/Screens/marks/components/term1list.dart';
import 'package:face_attendence/Screens/marks/components/term2list copy 2.dart';
import 'package:face_attendence/Screens/marks/components/term3list copy.dart';
import 'package:face_attendence/Screens/marks/components/term4list copy 2.dart';
import 'package:face_attendence/Screens/marks/components/term5list copy 3.dart';

var firebaseUser = FirebaseAuth.instance.currentUser;

class Bbody extends StatelessWidget {
  final String userid;
  final String classid;
  final List<String> indexnu;
  Bbody({this.userid, this.classid, this.indexnu});
  String indexnumber;
  List<String> sub1sttermid = [];
  List<String> sub2ndtermid = [];
  List<String> sub3rdtermid = [];
  List<String> sub4thtermid = [];
  List<String> sub5thtermid = [];

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
                  "SELECT Term & Index You Want to Add",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: size.height * 0.03),
                DropdownButton(
                  value: indexnu[0],
                  items: indexnu.map((String viru) {
                    return DropdownMenuItem(value: viru, child: Text('$viru'));
                  }).toList(),
                  hint: Text(
                    "Please choose a Index",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  onChanged: (val) {
                    indexnumber = val;
                  },
                ),
                RoundedButton(
                  text: "1st Term",
                  press: () async {
                    await Databaservice(
                      uid: userid,
                      classid: classid,
                      studentid: indexnumber,
                    ).term1stid(sub1sttermid);
                    sub1sttermid.forEach((element1) {
                      print(element1);
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Term1list(
                            userid: userid,
                            classname: classid,
                            indexnumber: indexnumber,
                            subjectid: sub1sttermid,
                          ); //before move check that if account already exist give notification from database
                        },
                      ),
                    );
                  },
                ),
                RoundedButton(
                  text: "2nd Term",
                  press: () async {
                    await Databaservice(
                      uid: userid,
                      classid: classid,
                      studentid: indexnumber,
                    ).term2ndid(sub2ndtermid);
                    sub2ndtermid.forEach((element2) {
                      print(element2);
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Term2list(
                            userid: userid,
                            classname: classid,
                            indexnumber: indexnumber,
                            subjectid: sub2ndtermid,
                          ); //before move check that if account already exist give notification from database
                        },
                      ),
                    );
                  },
                ),
                SizedBox(height: size.height * 0.03),
                RoundedButton(
                  text: "3rd Term",
                  press: () async {
                    await Databaservice(
                      uid: userid,
                      classid: classid,
                      studentid: indexnumber,
                    ).term3rdid(sub3rdtermid);
                    sub3rdtermid.forEach((element3) {
                      print(element3);
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Term3list(
                            userid: userid,
                            classname: classid,
                            indexnumber: indexnumber,
                            subjectid: sub3rdtermid,
                          ); //before move check that if account already exist give notification from database
                        },
                      ),
                    );
                  },
                ),
                SizedBox(height: size.height * 0.03),
                RoundedButton(
                  text: "4th term",
                  press: () async {
                    await Databaservice(
                      uid: userid,
                      classid: classid,
                      studentid: indexnumber,
                    ).term4thid(sub4thtermid);
                    sub4thtermid.forEach((element4) {
                      print(element4);
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Term4list(
                            userid: userid,
                            classname: classid,
                            indexnumber: indexnumber,
                            subjectid: sub4thtermid,
                          ); //before move check that if account already exist give notification from database
                        },
                      ),
                    );
                  },
                ),
                SizedBox(height: size.height * 0.03),
                RoundedButton(
                  text: "5th Term",
                  press: () async {
                    await Databaservice(
                      uid: userid,
                      classid: classid,
                      studentid: indexnumber,
                    ).term5thid(sub5thtermid);
                    sub5thtermid.forEach((element5) {
                      print(element5);
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Term5list(
                            userid: userid,
                            classname: classid,
                            indexnumber: indexnumber,
                            subjectid: sub5thtermid,
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
