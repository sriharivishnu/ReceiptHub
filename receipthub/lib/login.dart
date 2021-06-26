import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin{
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

  void testFunction() {
    print('Jason in testFunction');
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
    final loginLogo = Image.asset(
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
        // child: AnimatedButton(
        //   height: 70,
        //   width: 200,
        //   text: 'Login',
        //   isReverse: true,
        //   animationDuration: const Duration(milliseconds: 250),
        //   selectedTextColor: Color(0xff2fb1ed),
        //   transitionType: TransitionType.BOTTOM_CENTER_ROUNDER,
        //   textStyle: style.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        //   backgroundColor: Color(0xff2fb1ed),
        //   borderColor: Color(0xff2fb1ed),
        //   borderRadius: 50,
        //   borderWidth: 2,
        //   onPress: goToLogin,
        //   onPress: testFunction,
      //   ),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: goToLogin,
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
    return AnimatedSwitcher(
    duration: const Duration(milliseconds: 1000),
    child: Scaffold(
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
                SizeTransition(sizeFactor: _animation,
                  axis: Axis.horizontal,
                axisAlignment: -1,
                child: Padding(padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                    child: loginLogo),),
                SizedBox(height: 45.0),
                emailField,
                SizedBox(height: 25.0),
                passwordField,
                Material(
                  color: Colors.transparent,
                  child: InkResponse(
                    child: Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: SizedBox(height: 60.0,
                        child: loginButton,
                      ),
                    ),
                    onTap: () {},
                  )
                ),
              ],
            ),
          ),
        ),
      ),
      ),
    ),
   );
  }
}
