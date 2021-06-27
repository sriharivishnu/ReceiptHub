


import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/chart.dart';
import 'components/chart2.dart';
import 'components/chart3.dart';
import 'constants.dart';

final graphList = <Widget>[
  BarChartSample2(),
  BarChartSample3(),
  LineChartSample2()
];

class Trends extends StatefulWidget {
  Trends({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _TrendsState createState() => _TrendsState();
}

class _TrendsState extends State<Trends> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundBlue,
      body: Column(
        children: <Widget>[
          Padding(
      padding: EdgeInsets.fromLTRB(10, 50, 10, 30),
            child: Text(
              "Trends",
              style: TextStyle(
                  color: textBlue,
                  fontSize: 40, fontWeight: FontWeight.w500)
              ),
            ),
          Container(height: 300,
              child: GalleryView()),
        ],
      ),
    );
  }
}


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
      backgroundColor: backgroundBlue,
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