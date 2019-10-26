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
Widget redBox = DecoratedBox(
  decoration: BoxDecoration(color: Colors.red),
);
class TapboxA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Word Test') 
      ),
      body: new ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: double.infinity,
          minHeight: 50.0
        ),
        child: Container(
          height: 5,
          child: redBox,
        ),
      )
    );
  }
}
