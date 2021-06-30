import 'package:face_attendence/screens/listview/listmain.dart';
import 'package:flutter/cupertino.dart';
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

class Term3list extends StatelessWidget {
  String gclassname;
  final String userid;
  final String classname;
  final List<String> subjectid;
  final String indexnumber;
  Term3list({this.userid, this.classname, this.subjectid, this.indexnumber});
  String subjectval;
  String updatesubject;
  String deletesubject;
  String term;
  int markval;
  int updatemarkval;
  int deletemarkval;
  //int numInt = int.parse(markval);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "3rd Term",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      SizedBox(height: size.height * 0.03),
                      DropdownButton(
                        value: subjectid[0],
                        items: subjectid.map((String doc) {
                          return DropdownMenuItem(
                              value: doc, child: Text('$doc'));
                        }).toList(),
                        onChanged: (val) {
                          subjectval = val;
                        },
                      ),
                      SizedBox(height: size.height * 0.03),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      SizedBox(height: size.height * 0.03),
                      TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Marks',
                          ),
                          onChanged: (val) {
                            markval = val as int;
                          })
                    ],
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      SizedBox(height: size.height * 0.03),
                      RoundedButton(
                        text: "ADD marks",
                        press: () async {
                          //final stuid = await Databaservice(studentid: indexnumber)
                          //  .studentuserid(studentid: indexnumber);
                          //firebaseUser = stuid;

                          await Databaservice(
                                  uid: userid,
                                  classid: classname,
                                  studentid: indexnumber,
                                  subject: subjectval)
                              .term3rdmarks(markval);
                        },
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      SizedBox(height: size.height * 0.03),
                      DropdownButton(
                        value: subjectid[0],
                        items: subjectid.map((doc) {
                          return DropdownMenuItem(
                              value: doc, child: Text('$doc'));
                        }).toList(),
                        onChanged: (val) {
                          updatesubject = val;
                        },
                      ),
                      SizedBox(height: size.height * 0.03),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      SizedBox(height: size.height * 0.03),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Marks',
                        ),
                        onChanged: (val) => updatemarkval = val as int,
                      )
                    ],
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      SizedBox(height: size.height * 0.03),
                      RoundedButton(
                        text: "Update Marks",
                        press: () async {
                          //final stuid = await Databaservice(studentid: indexnumber)
                          //  .studentuserid(studentid: indexnumber);
                          //firebaseUser = stuid;
                          await Databaservice(
                                  uid: userid,
                                  classid: classname,
                                  studentid: indexnumber,
                                  subject: updatesubject)
                              .term3rdupdate(updatemarkval);
                        },
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      SizedBox(height: size.height * 0.03),
                      DropdownButton(
                        value: subjectid[0],
                        items: subjectid.map((doc) {
                          return DropdownMenuItem(
                              value: doc, child: Text('$doc'));
                        }).toList(),
                        onChanged: (val) {
                          deletesubject = val;
                        },
                      ),
                      SizedBox(height: size.height * 0.03),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      SizedBox(height: size.height * 0.03),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Marks',
                        ),
                        onChanged: (val) {
                          deletemarkval = val as int;
                        },
                      )
                    ],
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      SizedBox(height: size.height * 0.03),
                      RoundedButton(
                        text: "Delete",
                        press: () async {
                          //final stuid = await Databaservice(studentid: indexnumber)
                          //  .studentuserid(studentid: indexnumber);
                          //firebaseUser = stuid;
                          await Databaservice(
                                  uid: userid,
                                  classid: classname,
                                  studentid: indexnumber,
                                  subject: deletesubject)
                              .term3rddelete(deletemarkval);
                        },
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: size.height * 0.03),
                  RoundedButton(
                    text: "Return to Main",
                    press: () async {
                      //final stuid = await Databaservice(studentid: indexnumber)
                      //  .studentuserid(studentid: indexnumber);
                      //firebaseUser = stuid;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ListScreen(
                              userid: userid,
                              classid: classname,
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
