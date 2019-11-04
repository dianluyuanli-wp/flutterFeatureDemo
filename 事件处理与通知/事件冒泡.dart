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
        body: NotificationRoute(),
      )
    );
  }
}

class NotificationRoute extends StatefulWidget {
  @override
  NotificationRouteState createState() => new NotificationRouteState();
}

class NotificationRouteState extends State<NotificationRoute> {
  String _msg = '';
  @override
  Widget build(BuildContext context) {
    return NotificationListener<MyNotification>(
      onNotification: (notification) {
        setState(() {
         _msg+=notification.msg+'  '; 
        });
        return true;
      },
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            RaisedButton(
              onPressed: () => MyNotification('Hi').dispatch(context),
              child: Text('Send notification'),
            ),
            Builder(
              builder: (context) {
                return RaisedButton(
                  onPressed: () => MyNotification('Hi').dispatch(context),
                  child: Text('Send Notification'),
                );
              },
            ),
            Text(_msg)
          ],
        ),
      ),
    );
  }
}

class MyNotification extends Notification {
  MyNotification(this.msg);
  final String msg;
}