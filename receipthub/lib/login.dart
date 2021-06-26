import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';

import 'home.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  void goToLogin() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => MyHomePage(
                title: "Home Page",
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    final image = Image.asset(
        'assets/images/logo.png',
        width: 200,
        height: 200,
    );
    final emailField = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          hintStyle: TextStyle(color: CupertinoColors.inactiveGray),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final passwordField = TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          hintStyle: TextStyle(color: CupertinoColors.inactiveGray),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff2fb1ed),
        child: AnimatedButton(
          height: 70,
          width: 200,
          text: 'Login',
          isReverse: true,
          selectedTextColor: Colors.green,
          transitionType: TransitionType.LEFT_TO_RIGHT,
          textStyle: style.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          backgroundColor: Color(0xff2fb1ed),
          borderColor: Color(0xff2fb1ed),
          borderRadius: 50,
          borderWidth: 2,
          onPress: goToLogin,
        ),
      // child: MaterialButton(
      //   minWidth: MediaQuery.of(context).size.width,
      //   padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      //   onPressed: goToLogin,
      //   child: Text("Login",
      //       textAlign: TextAlign.center,
      //       style: style.copyWith(
      //           color: Colors.white, fontWeight: FontWeight.bold)),
      // ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
        backgroundColor: Color(0xff2fb1ed),
      ),
      body: Center(
        child: InkWell(
          onTap: (){print("tapped");},
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // SizedBox(
                //   height: 155.0,
                //   child: Image.asset(
                //     "logo.png",
                //     fit: BoxFit.contain,
                //   ),
                // ),
                InkWell(
                  child: Padding(padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                  child: image)),
                SizedBox(height: 45.0),
                emailField,
                SizedBox(height: 25.0),
                passwordField,
                InkResponse(
                  child: Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: SizedBox(height: 60.0,
                        child: loginButton,
                   ),
                 ),
                )
              ],
            ),
          ),
        ),
      ),
      ),
    );
  }
}
