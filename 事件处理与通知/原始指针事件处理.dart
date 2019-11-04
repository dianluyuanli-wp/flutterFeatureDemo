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
        body: EventText(),
      )
    );
  }
}

class EventText extends StatefulWidget {
  @override
  EventTextState createState() => EventTextState(); 
}

class EventTextState extends State<EventText> {
  PointerEvent _event;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Listener(
          child: Container(
            alignment: Alignment.center,
            color: Colors.blue,
            width: 300,
            height: 50,
            child: Text(_event?.toString()??'', style: TextStyle(color: Colors.white),),
          ),
          onPointerDown: (PointerDownEvent event) => setState(() => _event=event),
          onPointerMove: (PointerMoveEvent event) => setState(() => _event=event),
          onPointerUp: (PointerUpEvent event) => setState(() => _event=event),
        ),
        Listener(
          child: ConstrainedBox(
            constraints: BoxConstraints.tight(Size(300, 50)),
            child: Center(child: Text('Box A')),
          ),
          onPointerDown: (event) => print('down A'),
        ),
        Stack(
          children: <Widget>[
            Listener(
              child: ConstrainedBox(
                constraints: BoxConstraints.tight(Size(300, 100)),
                child: DecoratedBox(decoration: BoxDecoration(color: Colors.blue),),
              ),
              onPointerDown: (event) => print('down0'),
            ),
            Listener(
              child: ConstrainedBox(
                constraints: BoxConstraints.tight(Size(200, 100)),
                child: Center(child: Text('左上角200*100f范围内非文本区域点击'),),
              ),
              onPointerDown: (event) => print('down1'),
              behavior: HitTestBehavior.translucent,
            )
          ],
        ),
        Listener(
          child: IgnorePointer(
            child: Listener(
              child: Container(
                color: Colors.red,
                width: 200,
                height: 100,
              ),
              onPointerDown: (event) => print('in'),
            ),
          ),
          onPointerDown: (event) => print('up'),
        )
      ]
    );
  }
}