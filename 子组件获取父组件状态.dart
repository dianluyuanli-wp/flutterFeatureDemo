import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'localTest',
      home: new Page(),
    );
  }
}

class Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('字数中获取state对象'),
      ),
      body: Center(
        child: Builder(builder: (context) {
          return RaisedButton(
            onPressed: () {
              ScaffoldState _state = context.ancestorStateOfType(
                TypeMatcher<ScaffoldState>()
              );
              _state.showSnackBar(
                SnackBar(content: Text('我是SnackBar'),)
              );
            },
            child: Text("显示SnackBar"),
          );
        },)
      )
    );
  }
}