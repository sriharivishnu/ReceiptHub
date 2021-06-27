import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:receipthub/constants.dart';
import 'package:receipthub/home/home.dart';

import 'login/register.dart';

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
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  void goToRegisterPage() {
    Navigator.push(
      context,
      PageTransition(
          type: PageTransitionType.leftToRight,
          child: MyRegisterPage(title: "Register Page")),
    );
  }

  void goToHomePage() {
    Navigator.push(
      context,
      PageTransition(
          type: PageTransitionType.leftToRight,
          child: MyHomePage(title: "Home Page")),
    );
  }

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat();
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

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
    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: textBlue,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          goToHomePage();
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style:
                style.copyWith(color: darkBlue, fontWeight: FontWeight.bold)),
      ),
    );
    final registerMessage = Container(
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(5.0),
            child: Text(
              "Don't have an account?",
              style: style.copyWith(
                fontSize: 14.0,
                color: textBlue,
              ),
            ),
          ),
          GestureDetector(
              child: Text("Sign Up",
                  style: TextStyle(
                      fontSize: 14.0,
                      decoration: TextDecoration.underline,
                      color: Colors.blue)),
              onTap: () {
                goToRegisterPage();
              }),
        ],
      ),
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundBlue,
      body: Center(
        child: Container(
          color: backgroundBlue,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
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
                SizedBox(height: 25.0),
                emailField,
                SizedBox(height: 25.0),
                passwordField,
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
                  child: SizedBox(
                    height: 55.0,
                    child: loginButton,
                  ),
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: registerMessage),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FormFieldWidget extends StatelessWidget {
  static const TextStyle style =
      TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  const FormFieldWidget({
    required this.labelText,
    required this.hintText,
    required this.icon,
  });
  final String hintText, labelText, icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: false,
      style: style.copyWith(color: textBlue),
      decoration: InputDecoration(
          labelText: this.labelText,
          hintText: this.hintText,
          contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
          hintStyle: TextStyle(color: textBlue),
          labelStyle: TextStyle(color: textBlue),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: Image.asset(
              this.icon,
              width: 30,
              height: 30,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: textBlue, width: 2),
            borderRadius: BorderRadius.circular(32.0),
          ),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
  }
}
