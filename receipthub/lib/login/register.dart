import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:receipthub/constants.dart';
import 'package:receipthub/home/home.dart';

import '../login.dart';
import 'package:receipthub/login.dart';

import '../routeFunctions.dart';


class MyRegisterPage extends StatefulWidget {
  MyRegisterPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyRegisterPageState createState() => _MyRegisterPageState();
}

class _MyRegisterPageState extends State<MyRegisterPage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    final defaultLogo = Image.asset(
      'assets/images/logo.png',
      width: 200,
      height: 200,
    );
    final emailField = FormFieldWidget(
        labelText: "Email",
        hintText: "Enter your email",
        icon: "assets/images/mail.png");
    final passwordField = FormFieldWidget(
        labelText: "Password",
        hintText: "Enter your password",
        icon: "assets/images/lock.png");
    final registerButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: textBlue,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Navigator.of(context).push(createRouteToHome());
        },
        child: Text("Register",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: darkBlue, fontWeight: FontWeight.bold)),
      ),
    );
    final registerMessage = Container(
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(padding: EdgeInsets.all(5.0),
            child: Text(
              "Already have an account?",
              style: style.copyWith(
                fontSize: 14.0,
                color: textBlue,
              ),
            ),
          ),
          GestureDetector(
              child: Text("Login", style: TextStyle(fontSize: 14.0, decoration: TextDecoration.underline, color: Colors.blue)),
              onTap: () {
                Navigator.of(context).push(createRouteToLogin());
              }
          ),
        ],
      ),
    );

    return Scaffold(
      backgroundColor: backgroundBlue,
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Container(
            color: backgroundBlue,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                    child: Text(
                      "ReceiptHub",
                      style: style.copyWith(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: textBlue,
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                      child: defaultLogo),
                  SizedBox(height: 45.0),
                  emailField,
                  SizedBox(height: 25.0),
                  passwordField,
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: SizedBox(
                      height: 65.0,
                      child: registerButton,
                    ),
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: registerMessage),
                ],
              ),
            ),
        ),
      ),
    );

    // return Scaffold(
    //   resizeToAvoidBottomInset: false,
    //   body: Center(
    //       child: Container(
    //         child: Padding(
    //             padding: const EdgeInsets.all(36.0),
    //           child: Column(
    //             children: <Widget>[
    //               Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
    //                 child: Text(
    //                   "ReceiptHub",
    //                   style: style.copyWith(
    //                     fontSize: 40.0,
    //                     fontWeight: FontWeight.bold,
    //                     color: primaryBlue,
    //                   ),
    //                 ),
    //               ),
    //               Padding(
    //                   padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
    //                   child: defaultLogo),
    //               SizedBox(height: 45.0),
    //               emailField,
    //               SizedBox(height: 25.0),
    //               passwordField,
    //               Material(
    //                 child: Padding(padding: EdgeInsets.all(30.0),
    //                   child: SizedBox(
    //                     height: 65.0,
    //                     child: registerButton,
    //                   ),
    //                 ),
    //               ),
    //               Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
    //                 child: registerMessage),
    //             ],
    //           ),
    //     ),
    //    ),
    //  ),
    // );
  }
}