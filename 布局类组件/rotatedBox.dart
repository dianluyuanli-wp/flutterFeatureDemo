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
        child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[new DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
              child: new RotatedBox(
                quarterTurns: 1,
                child: Text('Hello world'),
              )
            ),
            Text('你好', style: TextStyle(color: Colors.green, fontSize: 18.0))
            ]
          )
      )
    );
  }
}
