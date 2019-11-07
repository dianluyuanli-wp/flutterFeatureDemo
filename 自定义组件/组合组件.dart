import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//  widget文件夹要放在lib目录下
import 'widgets/index.dart';

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
        body: GradientButtonRoute(),
      )
    );
  }
}

class GradientButtonRoute extends StatefulWidget {
  @override
  _GradientButtonRouteState createState() => _GradientButtonRouteState();
}

class _GradientButtonRouteState extends State<GradientButtonRoute> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          GradientButton(
            colors: [Colors.orange, Colors.red],
            height: 50,
            child: Text('Submit'),
            onPressed: onTap,
          ),
          GradientButton(
            colors: [Colors.lightGreen, Colors.green[700]],
            height: 50,
            child: Text('Submit'),
            onPressed: onTap,
          ),
          GradientButton(
            colors: [Colors.lightBlue[300], Colors.blueAccent],
            height: 50,
            child: Text('Submit'),
            onPressed: onTap,
          ),
        ],
      ),
    );
  }
  onTap() {
    print('button click');
  }
}


