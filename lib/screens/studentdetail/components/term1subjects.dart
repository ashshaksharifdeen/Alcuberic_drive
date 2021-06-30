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
import 'package:face_attendence/screens/studentdetail/components/classes.dart';

class Term1marks extends StatelessWidget {
  final String userid;
  final String classid;
  final List<String> indexnu;
  Term1marks({
    this.userid,
    this.classid,
    this.indexnu,
  });
  String indexnumber;
  String subject;

  //DocumentSnapshot<Object> element;

  var datas;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Form(
          child: Card(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "Give Subject Name one by one",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: size.height * 0.03),
                  DropdownButton(
                    value: indexnu[0],
                    items: indexnu.map((String viru) {
                      return DropdownMenuItem(
                          value: viru, child: Text('$viru'));
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
                  RoundedInputField(
                    hintText: "Subject Name",
                    onChanged: (value) {
                      subject = value;
                    },
                  ),
                  RoundedButton(
                    text: "ADD Subjects",
                    press: () async {
                      await Databaservice(
                        uid: userid,
                        classid: classid,
                        studentid: indexnumber,
                        subject: subject,
                      ).term1st(subject);
                    },
                  ),
                  SizedBox(height: size.height * 0.03),
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
                ]),
          ),
        ),
      ),
    );
  }
}
