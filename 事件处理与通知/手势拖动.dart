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
        body: _Drag(),
      )
    );
  }
}

class _Drag extends StatefulWidget {
  @override
  _DragState createState() => new _DragState();
}

class _DragState extends State<_Drag> with SingleTickerProviderStateMixin {
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
            onPanDown: (DragDownDetails e) {
              print('用户手指按下：${e.globalPosition}');
            },
            onPanUpdate: (DragUpdateDetails e) {
              setState(() {
               _left += e.delta.dx;
               _top += e.delta.dy; 
              });
            },
            onPanEnd: (DragEndDetails e) {
              print(e.velocity);
            },
          ),
        )
      ],
    );
  }
}