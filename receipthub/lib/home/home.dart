import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/PhysicsBox.dart';
import '../components/chart.dart';
import '../components/chart2.dart';
import '../components/chart3.dart';
import '../nfc/nfc.dart';
import '../receipts/receipts.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  int current_page = 0;

  void goToReceiptsPage() {
    print("HERE");
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ReceiptPage(
                title: "My Receipts",
              )),
    );
  }

  void goToAddReceipt() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TagReadPage.create()),
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
              Container(height: 300, child: GalleryView()),

              Container(
                  width: screenWidth * 0.5,
                  child: Button(
                    text: "View My Receipts",
                    callback: goToReceiptsPage,
                  )),
            ]),
            Positioned(
                bottom: 0,
                child: PhysicsBox(
                  boxPosition: 0.1,
                  children: [],
                ))
          ]),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              goToAddReceipt();
            },
            child: Icon(Icons.add),
            backgroundColor: Colors.red,
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BubbleBottomBar(
            opacity: .2,
            currentIndex: current_page,
            onTap: (i) => {print(i)},
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            elevation: 8,
            fabLocation: BubbleBottomBarFabLocation.center, //new
            hasNotch: true, //new
            hasInk: true, //new, gives a cute ink effect
            inkColor:
                Colors.black12, //optional, uses theme color if not specified
            items: <BubbleBottomBarItem>[
              BubbleBottomBarItem(
                  backgroundColor: Colors.red,
                  icon: Icon(
                    Icons.home,
                    color: Colors.black,
                  ),
                  activeIcon: Icon(
                    Icons.home,
                    color: Colors.red,
                  ),
                  title: Text("Home")),
              BubbleBottomBarItem(
                  backgroundColor: Colors.deepPurple,
                  icon: Icon(
                    Icons.access_time,
                    color: Colors.black,
                  ),
                  activeIcon: Icon(
                    Icons.access_time,
                    color: Colors.deepPurple,
                  ),
                  title: Text("Receipts")),
              BubbleBottomBarItem(
                  backgroundColor: Colors.indigo,
                  icon: Icon(
                    Icons.pie_chart_outline_rounded,
                    color: Colors.black,
                  ),
                  activeIcon: Icon(
                    Icons.pie_chart_outline_rounded,
                    color: Colors.indigo,
                  ),
                  title: Text("Trends"))
            ],
          ),
        )));
  }
}

class Button extends StatelessWidget {
  final GestureTapCallback callback;
  final String text;
  Button({Key? key, required this.callback, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callback,
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(10))),
      child: Row(
        children: <Widget>[
          SizedBox(width: 18),
          Text(this.text,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white)),
          SizedBox(width: 25),
          Icon(Icons.chevron_right, color: Colors.white),
        ],
      ),
    );
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
            aspectRatio: 1.4,
            height: 250,
            enlargeCenterPage: true,
            autoPlayAnimationDuration: Duration(seconds: 3),
          ),
          items: graphList
              .map((item) =>
                  Container(alignment: Alignment.center, child: item) as Widget)
              .toList(),
        ),
      ]),
    );
  }
}
