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
      body: new Flow(
        delegate: TextFLowDelegate(margin: EdgeInsets.all(10.0)),
        children: <Widget>[
          new Container(width: 80.0, height: 80.0, color: Colors.red,),
          new Container(width: 80.0, height: 80.0, color: Colors.green,),
          new Container(width: 80.0, height: 80.0, color: Colors.blue,),
          new Container(width: 80.0, height: 80.0, color: Colors.yellow,),
          new Container(width: 80.0, height: 80.0, color: Colors.brown,),
          new Container(width: 80.0, height: 80.0, color: Colors.purple,),          
        ],
      )
    );
  }
}

class TextFLowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;
  TextFLowDelegate({this.margin});

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i,
          transform: new Matrix4.translationValues(x, y, 0.0)
        );
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        context.paintChild(i,
          transform: new Matrix4.translationValues(x, y, 0.0)
        );
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  @override
  getSize(BoxConstraints constraints) {
    return Size(double.infinity, 200.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
