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
      body: new ConstrainedBox(
        constraints: BoxConstraints(minWidth: double.infinity),
        child: new Container(
          margin: EdgeInsets.only(top: 50, left: 120),
          constraints: BoxConstraints.tightFor(width: 200, height: 150),
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [Colors.red, Colors.orange],
              center: Alignment.topLeft,
              radius: .98
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black54,
                offset: Offset(2, 2),
                blurRadius: 4
              )
            ]
          ),
          transform: Matrix4.rotationZ(.2),
          alignment: Alignment.center,
          child: Text('5.20', style: TextStyle(color: Colors.white, fontSize: 40)),
        )
      )
    );
  }
}
