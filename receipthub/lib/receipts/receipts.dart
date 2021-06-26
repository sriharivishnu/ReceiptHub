import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    Receipt([Item("Milk", 10.99)], Store("Zehrs", "Luxembourg", "ID"), 100),
    Receipt([Item("Cheese", 10.99)], Store("Zehrs", "Luxembourg", "ID"), 100),
    Receipt([Item("Goat", 10.99)], Store("Zehrs", "Luxembourg", "ID"), 100),
    Receipt([Item("Paul", 10.99)], Store("Zehrs", "Luxembourg", "ID"), 100),
    Receipt([Item("Cookies", 10.99)], Store("Zehrs", "Luxembourg", "ID"), 100),
    Receipt([Item("Orange", 10.99)], Store("Zehrs", "Luxembourg", "ID"), 100),
  ];
  void onBackButton() {}
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
              backgroundColor: Colors.white,
              body: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Icon(Icons.arrow_back_ios_new_rounded),
                      onTap: onBackButton,
                    ),
                    Padding(
                        child: Text("Receipts",
                            style: TextStyle(
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
              ])),
        ));
  }
}

class ReceiptWidget extends StatelessWidget {
  ReceiptWidget({Key? key, required this.receipt}) : super(key: key);

  final Receipt receipt;
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.all(10),
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(10),
        //   color: Colors.grey[300],
        //   boxShadow: [
        //     BoxShadow(
        //         color: Colors.grey,
        //         blurRadius: 2.0,
        //         spreadRadius: 0.15,
        //         offset: Offset.fromDirection(-5.0))
        //   ],
        // ),
        child: Column(children: [
          Text(
            receipt.store.name,
            textAlign: TextAlign.center,
          )
        ]));
  }
}
