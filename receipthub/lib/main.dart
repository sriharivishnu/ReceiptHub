import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:receipthub/receipts/receipts.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/PhysicsBox.dart';
import '../components/chart.dart';
import '../components/chart2.dart';
import '../components/chart3.dart';
import '../constants.dart';
import '../login.dart';
import '../nfc/nfc.dart';
import '../receipts/receipts.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'home/home.dart';
import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  int current_page = 0;

  List listOfPages = [
    MyHomePage(title: "Home Page"),
    ReceiptPage(title: "My Receipts"),
  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        title: 'ReceiptHub',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginPage(title: 'ReceiptHub'),
      );
  }
}

class MainClass extends StatefulWidget {
  const MainClass({Key? key}) : super(key: key);

  @override
  _MainClassState createState() => _MainClassState();
}

class _MainClassState extends State<MainClass> {
  @override

  int current_page = 0;

  List listOfPages = [
    MyHomePage(title: "Home Page"),
    ReceiptPage(title: "My Receipts"),
  ];

  Widget build(BuildContext context) {
    return MediaQuery(data: new MediaQueryData(),
        child: new MaterialApp(
          home: Scaffold(
            body: listOfPages[current_page],
            bottomNavigationBar: BottomNavyBar(
              backgroundColor: textBlue,
              curve: Curves.elasticInOut,
              selectedIndex: current_page,
              onItemSelected: (index){
                setState(() {
                  current_page = index;
                });
              },
              items: <BottomNavyBarItem>[
                BottomNavyBarItem(
                  icon: Icon(Icons.home),
                  title: Text('Home'),
                  activeColor: backgroundBlue,
                  inactiveColor: darkBlue,
                ),
                BottomNavyBarItem(
                  icon: Icon(Icons.access_time),
                  title: Text('Receipts'),
                  activeColor: backgroundBlue,
                  inactiveColor: darkBlue,
                ),
              ],
            ),
        ),
        ),
    );

    return Scaffold(
      body: listOfPages[current_page],
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: current_page,
        onItemSelected: (index){
          setState(() {
            current_page = index;
          });
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            activeColor: Colors.blue,
            inactiveColor: Colors.black,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.access_time),
            title: Text('Receipts'),
            activeColor: Colors.blue,
            inactiveColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
