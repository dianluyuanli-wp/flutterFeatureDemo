import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'localTest',
      home: new Scaffold(
        body: WillPopScopeTextRoute(),
      )
    );
  }
}

class WillPopScopeTextRoute extends StatefulWidget {
  @override
  WillPopScopeTestRouteState createState() {
    return new WillPopScopeTestRouteState();
  }
}

class WillPopScopeTestRouteState extends State<WillPopScopeTextRoute> {
  DateTime _lastPressdAt;

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async {
        if (_lastPressdAt == null || DateTime.now().difference(_lastPressdAt) > Duration(seconds: 1)) {
          _lastPressdAt = DateTime.now();
          return false;
        }
      },
      child: Container(
        alignment: Alignment.center,
        child: Text('一秒内连续按两次返回键退出'),
      ),
    );
  }
}


