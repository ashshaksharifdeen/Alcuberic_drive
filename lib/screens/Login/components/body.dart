import 'package:flutter/material.dart';
import 'package:face_attendence/Screens/Login/components/background.dart';
import 'package:face_attendence/Screens/Signup/signup_screen.dart';
import 'package:face_attendence/widgets/already_have_an_account_acheck.dart';
import 'package:face_attendence/widgets/rounded_button.dart';
import 'package:face_attendence/widgets/rounded_input_field.dart';
import 'package:face_attendence/widgets/rounded_password_field.dart';
import 'package:face_attendence/Screens/welcomeclass/classwelcome.dart';
import 'package:face_attendence/Screens/classsignin/classsign.dart';
import 'package:flutter_svg/svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:face_attendence/Screens/Login/components/frgtlogin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:face_attendence/model/database.dart';
import 'package:firebase_core/firebase_core.dart';

class Body extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  bool showProgress = false;
  String email, password;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: ModalProgressHUD(
          inAsyncCall: showProgress,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "LOGIN",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                "assets/icons/login.svg",
                height: size.height * 0.35,
              ),
              SizedBox(height: size.height * 0.03),
              RoundedInputField(
                hintText: "Enter Your Email",
                onChanged: (value) {
                  email = value;
                }, //if account is not in the database call that or return any error message
              ),
              RoundedPasswordField(
                onChanged: (value) {
                  password = value;
                }, //back end part
              ),
              Material(
                elevation: 5,
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(32.0),
                child: MaterialButton(
                  onPressed: () async {
                    showProgress = true;

                    try {
                      final newUser = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);

                      String user =
                          newUser.user.uid; //get the emailid user id value
                      print(newUser.toString());
                      if (newUser != null) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ClassSignUpScreen(
                                      userid: user,
                                    )));

                        showProgress = false;
                      }

                      print(user);
                    } catch (e) {}
                  },
                  minWidth: 200.0,
                  height: 45.0,
                  child: Text(
                    "Login",
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ForgotPassword();
                        },
                      ),
                    );
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  )),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignUpScreen();
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
