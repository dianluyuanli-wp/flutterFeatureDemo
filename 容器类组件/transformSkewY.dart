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
          color: Colors.black,
          child: new Transform(
            //  偏移方式实测跟alignment有关系
          alignment: Alignment.topRight,
          transform: new Matrix4.skewY(.3),
          child: new Container(
            padding: const EdgeInsets.all(8.0),
            color: Colors.deepOrange,
            child: const Text('Apartment for rend'),
          ),
        )
      )
    );
  }
}
