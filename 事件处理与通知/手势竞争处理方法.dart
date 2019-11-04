import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'localTest',
      home: new Scaffold(
        appBar: AppBar(
          title: Text('App name'),
        ),
        body: BothDirectionTestRoute(),
      )
    );
  }
}

class BothDirectionTestRoute extends StatefulWidget {
  @override
  BothDirectionTestRouteState createState() => new BothDirectionTestRouteState();
}

class BothDirectionTestRouteState extends State<BothDirectionTestRoute> {
  double _top = 0;
  double _left = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: _top,
          left: _left,
          child: GestureDetector(
            child: CircleAvatar(child: Text('A'),),
            onVerticalDragUpdate: (DragUpdateDetails details) {
              setState(() {
                _top += details.delta.dy;
              });
            },
            onHorizontalDragUpdate: (DragUpdateDetails details) {
              setState(() {
               _left += details.delta.dx; 
              });
            },
          ),
        )
      ],
    );
  }
}