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
        body: Column(
          children: <Widget>[
            NavBar(color: Colors.blue, title: '标题',),
            NavBar(color: Colors.white, title: "标题",)
          ],
        ),
      )
    );
  }
}

class NavBar extends StatelessWidget {
  final String title;
  final Color color;

  NavBar({
    Key key,
    this.color,
    this.title
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: 52,
        minWidth: double.infinity
      ),
      decoration: BoxDecoration(
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 3),
            blurRadius: 3
          )
        ]
      ),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: color.computeLuminance() < .5 ? Colors.white : Colors.black,
        )
      ),
      alignment: Alignment.center,
    );
  }
}

