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
        body: GestureDetectorTestRoute(),
      )
    );
  }
}

class GestureDetectorTestRoute extends StatefulWidget {
  @override
  _GestureDetectorTestRouteState createState() => new _GestureDetectorTestRouteState();
}

class _GestureDetectorTestRouteState extends State<GestureDetectorTestRoute> {
  String _operation = 'No Gesture detected';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: Container(
          alignment: Alignment.center,
          color: Colors.blue,
          width: 200,
          height: 100,
          child: Text(_operation,
            style: TextStyle(color: Colors.white),  
          ),
        ),
        onTap: () => updateText('Tap'),
        onDoubleTap: () => updateText('DoubleTap'),
        onLongPress: () => updateText('LongPress')
      ),
    );
  }

  void updateText(String text) {
    setState(() {
      _operation = text;
    });
  }
}