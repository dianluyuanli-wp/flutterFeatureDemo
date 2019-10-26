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
        constraints: BoxConstraints.expand(),
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: <Widget>[
            Container(child: Text('hello world', style: TextStyle(color: Colors.white)),
              color: Colors.red,
            ),
            Positioned(
              left: 18.0,
              child: Text('I am Jack'),
            ),
            Positioned(
              top: 18.0,
              child: Text("your friend"),
            )
          ],
        ),
      )
    );
  }
}
