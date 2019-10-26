import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'localTest',
      home: new Scaffold(
        body: ScrollNotificationTestRoute(),
      )
    );
  }
}

class ScrollNotificationTestRoute extends StatefulWidget {
  @override
  _ScrollNotificationTestRouteState createState() => new _ScrollNotificationTestRouteState();
}

class _ScrollNotificationTestRouteState extends State<ScrollNotificationTestRoute> {
  String _progress = '0%';

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          double progress = notification.metrics.pixels /
            notification.metrics.maxScrollExtent;
            setState(() {
             _progress = '${(progress * 100).toInt()}%'; 
            });
            print('BottomEdge: ${notification.metrics.extentAfter == 0}');
        },
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            ListView.builder(
              itemCount: 100,
              itemExtent: 50,
              itemBuilder: (context, index) {
                return ListTile(title: Text('$index'));
              },
            ),
            CircleAvatar(
              radius: 30,
              child: Text(_progress),
              backgroundColor: Colors.black54,
            )
          ],
        ),
      ),
    );
  }
}


