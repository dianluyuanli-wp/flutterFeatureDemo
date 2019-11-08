import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//import 'widgets/index.dart';
import 'package:dio/dio.dart';

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
        body: FutureBUilderRoute(),
      )
    );
  }
}

class FutureBUilderRoute extends StatefulWidget {
  @override
  _FutureBuilderRouteState createState() => _FutureBuilderRouteState();
}

class _FutureBuilderRouteState extends State<FutureBUilderRoute> {
  Dio _dio = new Dio();

  @override
  Widget build(BuildContext context) {
    return new Container(
      alignment: Alignment.center,
      child: FutureBuilder(
        future: _dio.get('https://api.github.com/orgs/flutterchina/repos'),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Response response = snapshot.data;
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return ListView(
              children: response.data.map<Widget>((e) => ListTile(title: Text(e['full_name']),)).toList(),
            );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
} 






