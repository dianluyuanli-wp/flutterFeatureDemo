import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'localTest',
      home: new Scaffold(
        body: new Center(
          child: new TapboxA()
        )
      ),
    );
  }
}

class TapboxA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Word Test') 
      ),
      body: new Container(
        height: 120.0,
        width: 120.0,
        color: Colors.blue[50],
        child: Align(
          alignment: FractionalOffset(0.2,0.6),
          child: FlutterLogo(
            size: 60,
          ),
        ),
      )
    );
  }
}
