import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Databaservice {
  final String uid;
  final String classid;
  final String studentid;
  final String subject;
  Databaservice({this.uid, this.classid, this.studentid, this.subject});

  final CollectionReference classcollections =
      FirebaseFirestore.instance.collection('Shools');

  Future createuser(String name) async {
    return await classcollections.doc(uid).set({
      'School': name,
    });
  }

  Future createclasses(String classname) async {
    return await classcollections
        .doc(uid)
        .collection('classes')
        .doc(classid)
        .set({
      'class name': classname,
    }, SetOptions(merge: true)).then((_) {
      print('success!');
    });
  }

  Future loginlogic(String classid) async {
    return await classcollections
        .doc(uid)
        .collection('classes')
        .doc(classid)
        .get();
  }

  Future studentuserid({String studentid}) async {
    return await studentid;
  }

  Future studentdetails(
      String fullname,
      String indexnumber,
      String parentphonenumber,
      String Address,
      String emailaddress,
      DateTime dateofbirth) async {
    return await classcollections
        .doc(uid)
        .collection('classes')
        .doc(classid)
        .collection('studentdetails')
        .doc(studentid)
        .set({
      'Full Name': fullname,
      'Index ID': indexnumber,
      'parentphonenumber': parentphonenumber,
      'Address': Address,
      'emailaddress': emailaddress,
      'Date of birth': dateofbirth,
    }, SetOptions(merge: true)).then((_) {
      print('success!');
    });
  }

  Future deletestudent(String indexnumber) async {
    return await classcollections
        .doc(uid)
        .collection('classes')
        .doc(classid)
        .collection('studentdetails')
        .doc(studentid)
        .delete()
        .then((_) {
      print('successfully deleted');
    });
  }

  Future term1st(String subject) async {
    return await classcollections
        .doc(uid)
        .collection('classes')
        .doc(classid)
        .collection('studentdetails')
        .doc(studentid)
        .collection('1stterm')
        .doc(subject)
        .set({
      'subject': subject,
    }, SetOptions(merge: true)).then((_) {
      print('success!');
    });
  }

  Future term2nd(String subject) async {
    return await classcollections
        .doc(uid)
        .collection('classes')
        .doc(classid)
        .collection('studentdetails')
        .doc(studentid)
        .collection('2ndterm')
        .doc(subject)
        .set({
      'subject': subject,
    }, SetOptions(merge: true)).then((_) {
      print('success!');
    });
  }

  Future term3rd(String subject) async {
    return await classcollections
        .doc(uid)
        .collection('classes')
        .doc(classid)
        .collection('studentdetails')
        .doc(studentid)
        .collection('3rdterm')
        .doc(subject)
        .set({
      'subject': subject,
    }, SetOptions(merge: true)).then((_) {
      print('success!');
    });
  }

  Future term4th(String subject) async {
    return await classcollections
        .doc(uid)
        .collection('classes')
        .doc(classid)
        .collection('studentdetails')
        .doc(studentid)
        .collection('4thterm')
        .doc(subject)
        .set({
      'subject': subject,
    }, SetOptions(merge: true)).then((_) {
      print('success!');
    });
  }

  Future term5th(String subject) async {
    return await classcollections
        .doc(uid)
        .collection('classes')
        .doc(classid)
        .collection('studentdetails')
        .doc(studentid)
        .collection('5thterm')
        .doc(subject)
        .set({
      'subject': subject,
    }, SetOptions(merge: true)).then((_) {
      print('success!');
    });
  }

  Future term1stmarks(int marks) async {
    return await classcollections
        .doc(uid)
        .collection('classes')
        .doc(classid)
        .collection('studentdetails')
        .doc(studentid)
        .collection('1stterm')
        .doc(subject)
        .set({
      'subject': marks,
    }, SetOptions(merge: true)).then((_) {
      print('success!');
    });
  }

  Future term2ndmarks(int marks) async {
    return await classcollections
        .doc(uid)
        .collection('classes')
        .doc(classid)
        .collection('studentdetails')
        .doc(studentid)
        .collection('2ndterm')
        .doc(subject)
        .set({
      'subject': marks,
    }, SetOptions(merge: true)).then((_) {
      print('success!');
    });
  }

  Future term3rdmarks(int marks) async {
    return await classcollections
        .doc(uid)
        .collection('classes')
        .doc(classid)
        .collection('studentdetails')
        .doc(studentid)
        .collection('3rdterm')
        .doc(subject)
        .set({
      'subject': marks,
    }, SetOptions(merge: true)).then((_) {
      print('success!');
    });
  }

  Future term4thmarks(int marks) async {
    return await classcollections
        .doc(uid)
        .collection('classes')
        .doc(classid)
        .collection('studentdetails')
        .doc(studentid)
        .collection('4thterm')
        .doc(subject)
        .set({
      'subject': marks,
    }, SetOptions(merge: true)).then((_) {
      print('success!');
    });
  }

  Future term5thmarks(int marks) async {
    return await classcollections
        .doc(uid)
        .collection('classes')
        .doc(classid)
        .collection('studentdetails')
        .doc(studentid)
        .collection('1stterm')
        .doc(subject)
        .set({
      'subject': marks,
    }, SetOptions(merge: true)).then((_) {
      print('success!');
    });
  }

  Future term1stupdate(int marks) async {
    return await classcollections
        .doc(uid)
        .collection('classes')
        .doc(classid)
        .collection('studentdetails')
        .doc(studentid)
        .collection('1stterm')
        .doc(subject)
        .update({
      'subject': marks,
    });
  }

  Future term2ndupdate(int marks) async {
    return await classcollections
        .doc(uid)
        .collection('classes')
        .doc(classid)
        .collection('studentdetails')
        .doc(studentid)
        .collection('2ndterm')
        .doc(subject)
        .update({
      'subject': marks,
    });
  }

  Future term3rdupdate(int marks) async {
    return await classcollections
        .doc(uid)
        .collection('classes')
        .doc(classid)
        .collection('studentdetails')
        .doc(studentid)
        .collection('3rdterm')
        .doc(subject)
        .update({
      'subject': marks,
    });
  }

  Future term4thupdate(int marks) async {
    return await classcollections
        .doc(uid)
        .collection('classes')
        .doc(classid)
        .collection('studentdetails')
        .doc(studentid)
        .collection('4thterm')
        .doc(subject)
        .update({
      'subject': marks,
    });
  }

  Future term5thupdate(int marks) async {
    return await classcollections
        .doc(uid)
        .collection('classes')
        .doc(classid)
        .collection('studentdetails')
        .doc(studentid)
        .collection('5thterm')
        .doc(subject)
        .update({
      'subject': marks,
    });
  }

  Future term1stdelete(int marks) async {
    return await classcollections
        .doc(uid)
        .collection('classes')
        .doc(classid)
        .collection('studentdetails')
        .doc(studentid)
        .collection('1stterm')
        .doc(subject)
        .delete()
        .then((_) {
      print('successfully deleted');
    });
  }

  Future term2nddelete(int marks) async {
    return await classcollections
        .doc(uid)
        .collection('classes')
        .doc(classid)
        .collection('studentdetails')
        .doc(studentid)
        .collection('1stterm')
        .doc(subject)
        .delete()
        .then((_) {
      print('successfully deleted');
    });
  }

  Future term3rddelete(int marks) async {
    return await classcollections
        .doc(uid)
        .collection('classes')
        .doc(classid)
        .collection('studentdetails')
        .doc(studentid)
        .collection('1stterm')
        .doc(subject)
        .delete()
        .then((_) {
      print('successfully deleted');
    });
  }

  Future term4thdelete(int marks) async {
    return await classcollections
        .doc(uid)
        .collection('classes')
        .doc(classid)
        .collection('studentdetails')
        .doc(studentid)
        .collection('1stterm')
        .doc(subject)
        .delete()
        .then((_) {
      print('successfully deleted');
    });
  }

  Future term5thdelete(int marks) async {
    return await classcollections
        .doc(uid)
        .collection('classes')
        .doc(classid)
        .collection('studentdetails')
        .doc(studentid)
        .collection('1stterm')
        .doc(subject)
        .delete()
        .then((_) {
      print('successfully deleted');
    });
  }

  Future documentid(List<String> index) async {
    return await classcollections
        .doc(uid)
        .collection('classes')
        .doc(classid)
        .collection('studentdetails')
        .get()
        .then((QuerySnapshot value) {
      value.docs.forEach((DocumentSnapshot element) {
        return index.add(element.id);

        //index.forEach((viru) {
        //print(viru);
        //});
      });
    });
  }

  Future term1stid(List<String> index) async {
    return await classcollections
        .doc(uid)
        .collection('classes')
        .doc(classid)
        .collection('studentdetails')
        .doc(studentid)
        .collection('1stterm')
        .get()
        .then((QuerySnapshot value) {
      value.docs.forEach((DocumentSnapshot element) {
        return index.add(element.id);

        //index.forEach((viru) {
        //print(viru);
        //});
      });
    });
  }

  Future term2ndid(List<String> index) async {
    return await classcollections
        .doc(uid)
        .collection('classes')
        .doc(classid)
        .collection('studentdetails')
        .doc(studentid)
        .collection('2ndterm')
        .get()
        .then((QuerySnapshot value) {
      value.docs.forEach((DocumentSnapshot element) {
        return index.add(element.id);

        //index.forEach((viru) {
        //print(viru);
        //});
      });
    });
  }

  Future term3rdid(List<String> index) async {
    return await classcollections
        .doc(uid)
        .collection('classes')
        .doc(classid)
        .collection('studentdetails')
        .doc(studentid)
        .collection('3rdterm')
        .get()
        .then((QuerySnapshot value) {
      value.docs.forEach((DocumentSnapshot element) {
        return index.add(element.id);

        //index.forEach((viru) {
        //print(viru);
        //});
      });
    });
  }

  Future term4thid(List<String> index) async {
    return await classcollections
        .doc(uid)
        .collection('classes')
        .doc(classid)
        .collection('studentdetails')
        .doc(studentid)
        .collection('4thterm')
        .get()
        .then((QuerySnapshot value) {
      value.docs.forEach((DocumentSnapshot element) {
        return index.add(element.id);

        //index.forEach((viru) {
        //print(viru);
        //});
      });
    });
  }

  Future term5thid(List<String> index) async {
    return await classcollections
        .doc(uid)
        .collection('classes')
        .doc(classid)
        .collection('studentdetails')
        .doc(studentid)
        .collection('5thterm')
        .get()
        .then((QuerySnapshot value) {
      value.docs.forEach((DocumentSnapshot element) {
        return index.add(element.id);

        //index.forEach((viru) {
        //print(viru);
        //});
      });
    });
  }
}
