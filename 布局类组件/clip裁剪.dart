import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'localTest',
      home: new ClipTestRoute(),
    );
  }
}

class ClipTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget avatar = Image.asset('images/lake.jpg', width: 60);
    return Center(
      child: Column(
        children: <Widget>[
          avatar,
          ClipOval(child: avatar),
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: avatar,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                widthFactor: .5,
                child: avatar,
              ),
              Text('你好世界', style: TextStyle(color: Colors.green))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipRect(
                child: Align(
                  alignment: Alignment.topLeft,
                  widthFactor: .5,
                  child: avatar
                ),
              ),
              Text('你好世界', style: TextStyle(color: Colors.green))
            ],
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.red
            ),
            child: ClipRect(
              clipper: MyClipper(),
              child: avatar,
            ),
          )
        ],
      )
    );
  }
}

class MyClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) => Rect.fromLTWH(10, 15, 40, 30);

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => false;
}

