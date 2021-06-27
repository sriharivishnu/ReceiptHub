import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:receipthub/home/home.dart';

import '../constants.dart';
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
  late Future<List<Receipt>> receiptData;

  var mockData = [
    Receipt(
        items: [Item(name: "Milk", price: 10.99)],
        store: Store(name: "Zehrs", location: "Luxembourg", id: "ID")),
    Receipt(
        items: [Item(name: "Milk", price: 10.99)],
        store: Store(name: "Zehrs", location: "Luxembourg", id: "ID")),
    Receipt(
        items: [Item(name: "Milk", price: 10.99)],
        store: Store(name: "Zehrs", location: "Luxembourg", id: "ID")),
    Receipt(
        items: [Item(name: "Milk", price: 10.99)],
        store: Store(name: "Zehrs", location: "Luxembourg", id: "ID")),
    Receipt(
        items: [Item(name: "Milk", price: 10.99)],
        store: Store(name: "Zehrs", location: "Luxembourg", id: "ID")),
    Receipt(
        items: [Item(name: "Milk", price: 10.99)],
        store: Store(name: "Zehrs", location: "Luxembourg", id: "ID")),
    Receipt(
        items: [Item(name: "Milk", price: 10.99)],
        store: Store(name: "Zehrs", location: "Luxembourg", id: "ID")),
    Receipt(
        items: [Item(name: "Milk", price: 10.99)],
        store: Store(name: "Zehrs", location: "Luxembourg", id: "ID")),
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

  Future<List<Receipt>> fetchReceipts() async {
    final response =
        await http.get(Uri.parse('https://receipthub.herokuapp.com/receipt'));
    print(response.body);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var receipts = <Receipt>[];
      for (Map<String, dynamic> x in jsonDecode(response.body)["data"]) {
        receipts.add(Receipt.fromJson(x));
      }
      print("HERE" + receipts.toString());
      return receipts;
    } else {
      throw Exception('Failed to load receipts');
    }
  }

  @override
  void initState() {
    super.initState();
    receiptData = fetchReceipts();
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
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: textBlue,
                  ),
                  onTap: onBackButton,
                ),
                Padding(
                    child: Text("Receipts",
                        style: TextStyle(
                            color: textBlue,
                            fontSize: 40,
                            fontWeight: FontWeight.w500)),
                    padding: EdgeInsets.symmetric(vertical: 10))
              ],
            ),
            // FutureBuilder<List<Receipt>>(
            //   future: receiptData,
            //   builder: (context, snapshot) {
            //     if (snapshot.hasData) {
            //       return Expanded(
            //           child: GridView.count(
            //               crossAxisCount: 2,
            //               mainAxisSpacing: 12,
            //               crossAxisSpacing: 12,
            //               scrollDirection: Axis.vertical,
            //               // Generate 100 widgets that display their index in the List.
            //               children: snapshot.data!
            //                   .map((item) => ReceiptWidget(receipt: item))
            //                   .toList()));
            //     }
            //
            //     // By default, show a loading spinner.
            //     return CircularProgressIndicator();
            //   },
            // )
            Expanded(
                child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    scrollDirection: Axis.vertical,
                    // Generate 100 widgets that display their index in the List.
                    children: mockData
                        .map((item) => ReceiptWidget(receipt: item))
                        .toList()))
          ]),
        )));
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
                  "9.99",
                  style: TextStyle(color: textBlue, fontSize: 12.0),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Test Item Purchased",
                  style: TextStyle(color: textBlue, fontSize: 12.0),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "6:21 09/27/2002",
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
