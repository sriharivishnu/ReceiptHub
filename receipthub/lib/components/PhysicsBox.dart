import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

//https://github.com/tensor-programming/Flutter-Physics-Animations/blob/master/lib/main.dart
class PhysicsBox extends StatefulWidget {
  final boxPosition;
  final List<Widget> children;

  PhysicsBox({this.boxPosition = 0.0, required this.children});

  @override
  BoxState createState() => BoxState();
}

class BoxState extends State<PhysicsBox> with TickerProviderStateMixin {
  double? boxPosition;
  double? boxPositionOnStart;
  Offset? start;
  Offset? point;
  bool expanded = false;

  late AnimationController controller;
  late ScrollSpringSimulation simulation;

  @override
  void initState() {
    super.initState();
    boxPosition = widget.boxPosition;

    simulation = ScrollSpringSimulation(
      SpringDescription(
        mass: 1.0,
        stiffness: 1.0,
        damping: 0.5,
      ),
      0.0,
      1.0,
      0.0,
    );

    controller = AnimationController(vsync: this)
      ..addListener(() {
        print('${simulation.x(controller.value)}');
      });
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var stackChildren = <Widget>[
          Container(
            height: 200,
            width: screenWidth,
            child: CustomPaint(
                painter: BoxPainter(
              color: Colors.lightBlue,
              boxPosition: boxPosition!,
              boxPositionOnStart: boxPositionOnStart ?? 0.1,
              touchPoint: point,
            )),
          ),
        ] +
        widget.children;
    return GestureDetector(
        onPanStart: startDrag,
        onPanUpdate: onDrag,
        onPanEnd: endDrag,
        behavior: HitTestBehavior.translucent,
        child: Stack(children: stackChildren));
  }

  void startDrag(DragStartDetails details) {
    start = (context.findRenderObject() as RenderBox)
        .globalToLocal(details.globalPosition);

    boxPositionOnStart = boxPosition;
  }

  void onDrag(DragUpdateDetails details) {
    setState(() {
      point = (context.findRenderObject() as RenderBox)
          .globalToLocal(details.globalPosition);

      final dragVec = start!.dy - point!.dy;
      final normDragVec = (dragVec / context.size!.height).clamp(-1.0, 1.0);
      boxPosition = (boxPositionOnStart! + normDragVec).clamp(0.1, 0.9);
    });
  }

  void endDrag(DragEndDetails details) {
    setState(() {
      start = null;
      point = null;
      if (boxPosition! > 0.3 && !expanded) {
        expanded = false;
      } else if (boxPosition! < 0.7 && expanded) {
        expanded = false;
      }
      if (expanded) {
        boxPosition = 0.9;
        boxPositionOnStart = 0.9;
      } else {
        boxPosition = 0.1;
        boxPositionOnStart = 0.1;
      }
    });
  }
}

class BoxPainter extends CustomPainter {
  final double boxPosition;
  final double boxPositionOnStart;
  final Color color;
  final Offset? touchPoint;
  final Paint boxPaint;
  final Paint dropPaint;

  BoxPainter({
    this.boxPosition = 0.0,
    this.boxPositionOnStart = 0.0,
    this.color = Colors.grey,
    this.touchPoint,
  })  : boxPaint = Paint(),
        dropPaint = Paint() {
    boxPaint.color = this.color;
    boxPaint.style = PaintingStyle.fill;
    dropPaint.color = Colors.grey;
    dropPaint.style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.clipRect(Rect.fromLTWH(0.0, 0.0, size.width, size.height));

    final boxValueY = size.height - (size.height * boxPosition);
    final prevBoxValueY = size.height - (size.height * boxPositionOnStart);
    print(size.height);
    final midPointY = ((boxValueY - prevBoxValueY) * 1.2 + prevBoxValueY)
        .clamp(size.height * 0.4, size.height);

    Point left, mid, right;
    left = Point(-50.0, prevBoxValueY);
    right = Point(size.width + 50.0, prevBoxValueY);

    if (null != touchPoint) {
      mid = Point(touchPoint!.dx, midPointY - 25);
    } else {
      mid = Point(size.width / 2, midPointY - 25);
    }

    final path = Path();
    path.moveTo(mid.x as double, mid.y as double);
    path.quadraticBezierTo(
      mid.x - 100.0,
      mid.y as double,
      left.x as double,
      left.y as double,
    );
    path.lineTo(0.0, size.height);
    path.moveTo(mid.x as double, mid.y as double);
    path.quadraticBezierTo(
      mid.x + 100.0,
      mid.y as double,
      right.x as double,
      right.y as double,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();

    canvas.drawPath(path, boxPaint);

    canvas.drawCircle(
        Offset(right.x as double, right.y as double), 25.0, dropPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
