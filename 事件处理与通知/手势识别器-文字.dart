import 'package:flutter/gestures.dart';
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
        body: _GestureRecognizerTestRoute(),
      )
    );
  }
}

class _GestureRecognizerTestRoute extends StatefulWidget {
  @override
  _GestureRecognizerTestRouteState createState() => _GestureRecognizerTestRouteState();
}
class _GestureRecognizerTestRouteState extends State<_GestureRecognizerTestRoute> {
  TapGestureRecognizer _tapGestureRecognizer = new TapGestureRecognizer();
  bool _toggle = false;

  @override
  void dispose() {
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(text: '你好世界'),
            TextSpan(
              text: '点我变色',
              style: TextStyle(
                fontSize: 30,
                color: _toggle ? Colors.blue : Colors.red
              ),
              //  级联调用，同时执行两个操作，既赋值又绑定
              recognizer: _tapGestureRecognizer..onTap = () {
                setState(() {
                  _toggle = !_toggle;
                });
              }
            ),
            TextSpan(text: '你好世界')
          ]
        )
      ),
    );
  }
}