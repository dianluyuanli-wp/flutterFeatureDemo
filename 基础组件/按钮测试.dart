import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'localTest',
      home: new Scaffold(
        body: new Center(
          child: new TapboxA()
        )
      ),
    );
  }
}

class TapboxA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Word Test') 
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new RaisedButton(
              child: Text('normal'),
              onPressed: () {}
            ),
            new FlatButton(
              child: Text("normal"),
              onPressed: () {},
            ),
            new OutlineButton(
              child: Text("normal"),
              onPressed: () {},
            ),
            new IconButton(
              icon: Icon(Icons.thumb_up),
              onPressed: () {},
            ),
            new RaisedButton.icon(
              icon: Icon(Icons.send),
              label: Text("发送"),
              onPressed: () {}
            ),
            new OutlineButton.icon(
              icon: Icon(Icons.add),
              label: Text("添加"),
              onPressed: () {}
            ),
            new FlatButton.icon(
              icon: Icon(Icons.info),
              label: Text("详情"),
              onPressed: () {}
            ),
            new FlatButton(
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              child: Text("Submit"),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              onPressed: () {},
            )
          ],
        ),
        width: 375.0,
        //height: 300.0,
      )
    );
  }
}
