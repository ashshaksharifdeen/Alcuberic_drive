import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:face_attendence/screens/listview/components/background.dart';
import 'package:face_attendence/Screens/studentdetail/studentdetails.dart';
import 'package:face_attendence/Screens/marks/markshome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:face_attendence/model/database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:face_attendence/Screens/Imagessend/imagesfile.dart';

class Body extends StatelessWidget {
  final String userid;
  final String classid;
  Body({this.userid, this.classid});
  List<String> indexval = [];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/studentattendence.png')),
                title: Text('ADD Student'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Studentdetails(
                          userid: userid,
                          classid: classid,
                        ); //before move check that if account already exist give notification from database
                      },
                    ),
                  );
                },
              ),
              ListTile(
                leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/recognization.png')),
                title: Text('Face Recognize'),
                onTap: () {},
              ),
              ListTile(
                leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/progress.png')),
                title: Text('Attendence & Results progress'),
                onTap: () {},
              ),
              ListTile(
                leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/marks.png')),
                title: Text('Marks update'),
                onTap: () async {
                  await Databaservice(uid: userid, classid: classid)
                      .documentid(indexval);

                  indexval.forEach((rut) {
                    print(rut);
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Markshome(
                          userid: userid,
                          classid: classid,
                          indexnu: indexval,
                        ); //before move check that if account already exist give notification from database
                      },
                    ),
                  );
                },
              ),
              ListTile(
                leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/recognization.png')),
                title: Text('ADD Student Image'),
                onTap: () async {
                  await Databaservice(uid: userid, classid: classid)
                      .documentid(indexval);

                  indexval.forEach((rut) {
                    print(rut);
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Imageadd(
                          userid: userid,
                          classid: classid,
                          indexnu: indexval,
                        ); //before move check that if account already exist give notification from database
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
