import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:receipthub/home/home.dart';

import '../constants.dart';
import '../login.dart';
import '../models/Receipt.dart';

class ReceiptPage extends StatefulWidget {
  ReceiptPage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<ReceiptPage> createState() => _ReceiptPageState();
}

class _ReceiptPageState extends State<ReceiptPage>
    with TickerProviderStateMixin {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  var receiptData = [
    Receipt([Item("Burger", 5.99)], Store("McDonald's", "Kitchener", "ID"), 8),
    Receipt([Item("Cheese", 10.99)], Store("Zehrs", "Luxembourg", "ID"), 18),
    Receipt([Item("Goat", 10.99)], Store("Walmart", "TownTown", "ID"), 21),
    Receipt([Item("Paul", 10.99)], Store("ThePaulStore", "Far Away", "ID"), 16),
    Receipt([Item("iPhone X", 1000.99)], Store("Best Buy", "Waterloo", "ID"), 1),
    Receipt([Item("1 Slice Pepperoni", 2.99)], Store("Papa John's", "Waterloo", "ID"), 2),
    Receipt([Item("Penne Alfredo", 16.99)], Store("East Side Mario's", "Guelph", "ID"), 99),
    Receipt([Item("Orange", 10.99)], Store("Zehrs", "Luxembourg", "ID"), 100),
    Receipt([Item("Orange", 10.99)], Store("Zehrs", "Luxembourg", "ID"), 100),
    Receipt([Item("Orange", 10.99)], Store("Zehrs", "Luxembourg", "ID"), 100),
    Receipt([Item("Orange", 10.99)], Store("Zehrs", "Luxembourg", "ID"), 100),
    Receipt([Item("Orange", 10.99)], Store("Zehrs", "Luxembourg", "ID"), 100),
  ];
  void onBackButton() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => MyHomePage(
            title: "Home Page",
          )),
    );
  }

  void goToHomePage() {
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
    return Container(
        color: backgroundBlue,
        child: SafeArea(
          child: Scaffold(
              backgroundColor: backgroundBlue,
              body: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Icon(Icons.arrow_back_ios_new_rounded,
                        color: textBlue,),
                      onTap: onBackButton,
                    ),
                    Padding(
                        child: Text("Receipts",
                            style: TextStyle(
                              color: textBlue,
                                fontSize: 40, fontWeight: FontWeight.w500)),
                        padding: EdgeInsets.symmetric(vertical: 10))
                  ],
                ),
                Expanded(
                    child: GridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        scrollDirection: Axis.vertical,
                        // Generate 100 widgets that display their index in the List.
                        children: receiptData
                            .map((item) => ReceiptWidget(receipt: item))
                            .toList()))
              ]),
          ),
        ));
  }
}

class ReceiptWidget extends StatelessWidget {
  ReceiptWidget({Key? key, required this.receipt}) : super(key: key);

  final Receipt receipt;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 15.0,
        color: darkBlue,
        margin: EdgeInsets.all(10),
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            print('Card tapped.');
          },
          child: SizedBox(
            width: 300,
            height: 200,
            child: Column(children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  receipt.store.name,
                  style: TextStyle(color: textBlue, fontSize: 14.0),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  receipt.items[0].price.toString(),
                  style: TextStyle(color: textBlue, fontSize: 12.0),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  receipt.items[0].name,
                  style: TextStyle(color: textBlue, fontSize: 12.0),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  receipt.creationDate.toString(),
                  style: TextStyle(color: textBlue, fontSize: 12.0),
                  textAlign: TextAlign.center,
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
