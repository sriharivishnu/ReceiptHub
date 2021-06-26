import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/Receipt.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  var receiptData = [
    Receipt([Item("Milk", 10.99)], Store("Zehrs", "Luxembourg", "ID"), 100),
    Receipt([Item("Cheese", 10.99)], Store("Zehrs", "Luxembourg", "ID"), 100),
    Receipt([Item("Goat", 10.99)], Store("Zehrs", "Luxembourg", "ID"), 100),
    Receipt([Item("Paul", 10.99)], Store("Zehrs", "Luxembourg", "ID"), 100),
    Receipt([Item("Cookies", 10.99)], Store("Zehrs", "Luxembourg", "ID"), 100),
    Receipt([Item("Orange", 10.99)], Store("Zehrs", "Luxembourg", "ID"), 100),
  ];
  var receiptDataForUser = [
    {
      "items": [
        {"name": "Milk", "price": 10.99},
        {"name": "cookies", "price": 6.99}
      ],
      "store": {
        "id": "e0726191-c221-4cd3-98f7-68da888a953f",
        "name": "Zehr's",
        "location": "GPS COORDINATES"
      }
    },
    {
      "items": [
        {"name": "Milk2", "price": 10.99},
        {"name": "cookies", "price": 6.99}
      ],
      "store": {
        "id": "e0726191-c221-4cd3-98f7-68da888a953f",
        "name": "Zehr's",
        "location": "GPS COORDINATES"
      }
    },
    {
      "items": [
        {"name": "Milk3", "price": 10.99},
        {"name": "cookies", "price": 6.99}
      ],
      "store": {
        "id": "e0726191-c221-4cd3-98f7-68da888a953f",
        "name": "Zehr's",
        "location": "GPS COORDINATES"
      }
    }
  ];

  @override
  Widget build(BuildContext context) {
    // SizeConfig().init(context);
    var screenWidth = MediaQuery.of(context).size.width;

    var searchBar = Container(
        width: screenWidth * 0.9,
        alignment: Alignment.center,
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
        // height: 50,
        decoration: BoxDecoration(
            color: CupertinoColors.lightBackgroundGray,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  blurRadius: 2.0,
                  spreadRadius: 0.15,
                  offset: Offset.fromDirection(-5.0))
            ]),
        child: TextField(
          onChanged: (value) {},
          decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: "Search",
              prefixIcon: Icon(Icons.search),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0)),
        ));

    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
              backgroundColor: Colors.white,
              body: Column(children: [
                Row(
                  children: [searchBar],
                ),
                Row(
                  children: [
                    Text("Receipts",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.w500))
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
              ]))),
    );
  }
}

class ReceiptWidget extends StatelessWidget {
  ReceiptWidget({Key? key, required this.receipt}) : super(key: key);

  final Receipt receipt;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[300],
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                blurRadius: 2.0,
                spreadRadius: 0.15,
                offset: Offset.fromDirection(-5.0))
          ],
        ),
        child: Column(children: [
          Text(
            receipt.store.name,
            textAlign: TextAlign.center,
          )
        ]));
  }
}
