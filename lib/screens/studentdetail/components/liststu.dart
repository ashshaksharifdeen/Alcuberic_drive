import 'dart:ffi';
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

//var firebaseUser = FirebaseAuth.instance.currentUser;

class Listpageid extends StatefulWidget {
  final String userid;
  final String classid;
  Listpageid({this.userid, this.classid});
  String indexnumber;
  @override
  _ListpageidState createState() =>
      _ListpageidState(userid: userid, classid: classid);
}

class _ListpageidState extends State<Listpageid> {
  final String userid;
  final String classid;
  _ListpageidState({this.userid, this.classid});
  String indexnumber;
  Future _data;
  Future getPosts() async {
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot qn = await firestore
        .collection('Schools')
        .doc(userid)
        .collection('Classes')
        .doc(classid)
        .collection('studentdetails')
        .get();
    return qn.docs;
  }

  navigateToDetail(DocumentSnapshot post) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailpageState(
                  post: post,
                )));
  }

  @override
  Void initState() {
    super.initState();
    _data = getPosts();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: FutureBuilder(
            future: getPosts(),
            // ignore: missing_return
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Text("Loading...."),
                );
              } else {
                ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (_, index) {
                      return ListTile(
                        title: Text(snapshot.data[index].data['title']),
                        onTap: () => navigateToDetail(snapshot.data[index]),
                      );
                    });
              }
            }),
      ),
    );
  }
}

class DetailpageState extends StatefulWidget {
  final String userid;
  final String classid;
  final DocumentSnapshot post;
  DetailpageState({
    this.userid,
    this.classid,
    this.post,
  });
  String indexnumber;
  _DetailpageStateid createState() =>
      _DetailpageStateid(userid: userid, classid: classid);
}

class _DetailpageStateid extends State<DetailpageState> {
  final String userid;
  final String classid;
  final DocumentSnapshot post;
  _DetailpageStateid({
    this.userid,
    this.classid,
    this.post,
  });
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Card(
          child: ListTile(
            title: Text(widget.post["title"]),
            subtitle: Text(widget.post["content"]),
          ),
        ),
      ),
    );
  }
}
