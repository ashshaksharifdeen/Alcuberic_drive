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
import 'package:face_attendence/Screens/studentdetail/components/term1subjects.dart';
import 'package:face_attendence/Screens/studentdetail/components/term2subjects copy.dart';
import 'package:face_attendence/Screens/studentdetail/components/term3subjects copy 2.dart';
import 'package:face_attendence/Screens/studentdetail/components/term4subjects copy 3.dart';
import 'package:face_attendence/Screens/studentdetail/components/term5subjects copy 4.dart';
import 'package:face_attendence/screens/studentdetail/components/classes.dart';

var firebaseUser = FirebaseAuth.instance.currentUser;

class Termsub extends StatelessWidget {
  final String userid;
  final String classid;
  Termsub({this.userid, this.classid});
  String fullname;
  String indexnumber;
  String parentphonenumber;
  String Address;
  String studentemail;
  DateTime newDateTime;
  List<String> inreco = [];

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
                  "SELECT Term You Want to Add",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: size.height * 0.03),
                RoundedButton(
                  text: "1st Term",
                  press: () async {
                    await Databaservice(uid: userid, classid: classid)
                        .documentid(inreco);

                    inreco.forEach((rut) {
                      print(rut);
                    });

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Term1marks(
                              userid: userid,
                              classid: classid,
                              indexnu:
                                  inreco); //before move check that if account already exist give notification from database
                        },
                      ),
                    );
                  },
                ),
                RoundedButton(
                  text: "2nd Term",
                  press: () async {
                    await Databaservice(uid: userid, classid: classid)
                        .documentid(inreco);

                    inreco.forEach((rut) {
                      print(rut);
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Term2marks(
                            userid: userid,
                            classid: classid,
                            indexnu: inreco,
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
                    await Databaservice(uid: userid, classid: classid)
                        .documentid(inreco);

                    inreco.forEach((rut) {
                      print(rut);
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Term3marks(
                            userid: userid,
                            classid: classid,
                            indexnu: inreco,
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
                    await Databaservice(uid: userid, classid: classid)
                        .documentid(inreco);

                    inreco.forEach((rut) {
                      print(rut);
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Term4marks(
                            userid: userid,
                            classid: classid,
                            indexnu: inreco,
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
                    await Databaservice(uid: userid, classid: classid)
                        .documentid(inreco);

                    inreco.forEach((rut) {
                      print(rut);
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Term5marks(
                            userid: userid,
                            classid: classid,
                            indexnu: inreco,
                          ); //before move check that if account already exist give notification from database
                        },
                      ),
                    );
                  },
                ),
                RoundedButton(
                  text: "Back to Main",
                  press: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ListScreen(
                                  userid: userid,
                                  classid: classid,
                                )));
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
