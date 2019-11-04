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
        body: FutureText(),
      )
    );
  }
}

Future<String> mockNetworkDate() async {
  return Future.delayed(Duration(seconds: 2), () => '我是王上的数据');
}

class FutureText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<String>(
        future: mockNetworkDate(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Text('Contents: ${snapshot.data}');
            }
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

