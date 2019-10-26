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
    var img = AssetImage('images/lake.jpg');
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Word Test') 
      ),
      body: new SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            new Image(
              image: img,
              width: 100.0,
              height: 50.0,
              fit: BoxFit.fill
            ),
            Image(
              image: img,
              height: 50,
              width: 50,
              fit: BoxFit.contain
            ),
            Image(
              image: img,
              width: 100,
              height: 50.0,
              fit: BoxFit.fitHeight
            ),
            Image(
              image: img,
              width: 100,
              height: 50,
              fit: BoxFit.fitHeight
            ),
            Image(
              image: img,
              width: 100,
              height: 50,
              fit: BoxFit.scaleDown
            ),
            Image(
              image: img,
              height: 50,
              width: 100,
              fit: BoxFit.none
            ),
            Image(
              image: img,
              width: 100,
              color: Colors.blue,
              colorBlendMode: BlendMode.difference,
              fit: BoxFit.fill
            ),
            Image(
              image: img,
              width: 100,
              height: 200,
              repeat: ImageRepeat.repeatY
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.accessible, color: Colors.green),
                Icon(Icons.error, color: Colors.green),
                Icon(Icons.fingerprint, color: Colors.green)
              ],
            )
          ].map((e){
            return Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: 100,
                    child: e
                  )
                ),
                //Text(e.fit.toString())
              ],
            );
          }).toList(),
        ),
      )
    );
  }
}
