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

class Term1list extends StatelessWidget {
  String gclassname;
  final String userid;
  final String classname;
  final List<String> subjectid;
  final String indexnumber;
  Term1list({this.userid, this.classname, this.subjectid, this.indexnumber});
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
        child: Card(
          child: Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "1st Term",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Column(
                  children: [
                    Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: DropdownButton(
                                value: subjectid[0],
                                items: subjectid.map((String doc1) {
                                  return DropdownMenuItem(
                                      value: doc1, child: Text('$doc1'));
                                }).toList(),
                                onChanged: (val) {
                                  subjectval = val;
                                },
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                  decoration: const InputDecoration(
                                    hintText: 'Marks',
                                  ),
                                  onChanged: (val) {
                                    markval = val as int;
                                  }),
                            ),
                            Expanded(
                              child: RoundedButton(
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
                                      .term1stmarks(markval);
                                },
                              ),
                            ),
                          ]),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Expanded(
                            child: DropdownButton(
                              value: subjectid[0],
                              items: subjectid.map((doc2) {
                                return DropdownMenuItem(
                                    value: doc2, child: Text('$doc2'));
                              }).toList(),
                              onChanged: (val) {
                                updatesubject = val;
                              },
                            ),
                          ),
                          Expanded(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'Marks',
                              ),
                              onChanged: (val) => updatemarkval = val as int,
                            ),
                          ),
                          Expanded(
                            child: RoundedButton(
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
                                    .term1stupdate(updatemarkval);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Expanded(
                            child: DropdownButton(
                              value: subjectid[0],
                              items: subjectid.map((doc3) {
                                return DropdownMenuItem(
                                    value: doc3, child: Text('$doc3'));
                              }).toList(),
                              onChanged: (val) {
                                deletesubject = val;
                              },
                            ),
                          ),
                          Expanded(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'Marks',
                              ),
                              onChanged: (val) {
                                deletemarkval = val as int;
                              },
                            ),
                          ),
                          Expanded(
                            child: RoundedButton(
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
                                    .term1stdelete(deletemarkval);
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
