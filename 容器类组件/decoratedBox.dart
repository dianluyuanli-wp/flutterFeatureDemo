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
      body: new DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.red, Colors.orange[700]]),
          borderRadius: BorderRadius.circular(3),
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              offset: Offset(2,2),
              blurRadius: 4
            )
          ]
        ),
        child: Padding(padding: EdgeInsets.symmetric(horizontal: 80, vertical: 18),
          child: Text('Login', style: TextStyle(color: Colors.white)),
        ),
      )
    );
  }
}
