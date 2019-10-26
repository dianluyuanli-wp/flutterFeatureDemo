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
        child: new Column(
          children: <Widget>[
            new Container(
              child: new Text('Hello world',
                textAlign: TextAlign.left,
              ),
              width: 375.0,
            ),
            new Text("Hello world! I'm Jack."*4,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            new Text('Hello world',
              textScaleFactor: 1.5,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 18.0,
                height: 1.2,
                fontFamily: 'Courier',
                background: new Paint()..color=Colors.yellow,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.dashed
              ),
            ),
            new Text.rich(TextSpan(
              children: [
                TextSpan(
                  text: 'Home: '
                ),
                TextSpan(
                  text: 'https://fluterchina.club',
                  style: TextStyle(
                    color: Colors.blue
                  ),
                )
              ]
            )),
            DefaultTextStyle(
              style: TextStyle(
                color: Colors.red,
                fontSize: 20.0,
              ),
              textAlign: TextAlign.start,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('hello world'),
                  Text('I am Jack'),
                  Text('I am Jack',
                    style: TextStyle(
                      inherit: false,
                      color: Colors.grey
                    ),
                  )
                ],
              )
            )
          ],
        ),
        width: 375.0,
        height: 300.0,
      )
    );
  }
}
