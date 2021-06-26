import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    // SizeConfig().init(context);

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    width: 500 * 0.6,
                    height: 50,
                    color: Colors.red,
                  )
                ],
              ))
        ]),
      ),
    );
  }
}
