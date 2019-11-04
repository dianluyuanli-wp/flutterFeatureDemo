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
        body: _ScaleTestRoute(),
      )
    );
  }
}

class _ScaleTestRoute extends StatefulWidget {
  @override
  _ScaleTestRouteState createState() => new _ScaleTestRouteState();
}

class _ScaleTestRouteState extends State<_ScaleTestRoute> {
  double _width = 200;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: Image.asset('./images/lake.jpg', width: _width,),
        onScaleUpdate: (ScaleUpdateDetails details) {
          setState(() {
            _width = 200 * details.scale.clamp(.8, 10);
          });
        },
      )
    );
  }
}