import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'localTest',
      home: new Scaffold(
        body: InfiniteListView(),
      )
    );
  }
}

class InfiniteListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      ListTile(title: Text('商品列表'),),
      Expanded(
        child: ListView.builder(itemBuilder: (BuildContext context, int index) {
          return ListTile(title: Text('$index'));
        })
      )
    ],);
  }
}



