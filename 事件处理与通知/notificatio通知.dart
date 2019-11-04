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
        body: BothDirectionTestRoute(),
      )
    );
  }
}

class BothDirectionTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (notification){
        switch (notification.runtimeType) {
          case ScrollStartNotification: print("开始滚动");break;
          case ScrollUpdateNotification: print('正在滚动'); break;
          case ScrollEndNotification: print('滚动停止'); break;
          case OverscrollNotification: print('滚动到边界'); break;
        }
      },
      child: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return ListTile(title: Text('$index'));
        },
      ),
    );
  }
}