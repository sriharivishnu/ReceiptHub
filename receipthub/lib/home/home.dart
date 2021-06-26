import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/PhysicsBox.dart';
import '../components/chart.dart';
import '../components/chart2.dart';
import '../components/chart3.dart';
import '../receipts/receipts.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  void goToReceiptsPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ReceiptPage(
                title: "My Receipts",
              )),
    );
  }

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
                body: Stack(children: [
                  Column(children: [
                    Row(
                      children: [searchBar],
                    ),
                    // BarChartSample3(),
                    Container(height: 350, child: GalleryView()),

                    Container(
                      width: screenWidth * 0.5,
                      child: ElevatedButton(
                        onPressed: () {
                          goToReceiptsPage();
                        },
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                            ),
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.all(15))),
                        child: Row(
                          children: <Widget>[
                            SizedBox(width: 18),
                            Text("View My Receipts",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white)),
                            SizedBox(width: 6),
                            Icon(Icons.chevron_right, color: Colors.white),
                          ],
                        ),
                      ),
                    )
                  ]),
                  Positioned(
                      bottom: 0,
                      child: PhysicsBox(
                        boxPosition: 0.1,
                        children: [
                          // Center(
                          //     child: MaterialButton(
                          //         onPressed: () {},
                          //         color: Colors.indigo,
                          //         minWidth: 100,
                          //         child: Text("Add Receipt",
                          //             style: TextStyle(color: Colors.white))))
                        ],
                      ))
                ]))));
  }
}

final graphList = <Widget>[
  BarChartSample2(),
  BarChartSample3(),
  LineChartSample2()
];

class GalleryView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GalleryViewState();
  }
}

class _GalleryViewState extends State<GalleryView> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 1.0,
            height: 300,
            enlargeCenterPage: true,
            autoPlayAnimationDuration: Duration(seconds: 1),
          ),
          items: graphList
              .map((item) =>
                  Container(alignment: Alignment.center, child: item) as Widget)
              .toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: graphList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ]),
    );
  }
}
