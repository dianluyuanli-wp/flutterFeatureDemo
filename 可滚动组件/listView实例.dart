import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'localTest',
      home: new Scaffold(
        body: SingleChildScrollViewTestRoute(),
      )
    );
  }
}

class SingleChildScrollViewTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget divider1 = Divider(color: Colors.blue);
    Widget divider2 = Divider(color: Colors.green);
    return Scrollbar(
      child: ListView.separated(
        itemCount: 100,
        //itemExtent: 50,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(title: Text('$index'));
        },
        separatorBuilder: (BuildContext context, int index) {
          return index%2==0?divider1:divider2;
        }
      )
    );
  }
}

