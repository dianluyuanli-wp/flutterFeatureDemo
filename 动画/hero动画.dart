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
        body: HeroAnimationRoute(),
      )
    );
  }
}

class HeroAnimationRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: InkWell(
        child: Hero(
          tag: 'avatar',
          child: ClipOval(
            child: Image.asset('images/lake.jpg', width: 50),
          )
        ),
        onTap: () {
          Navigator.push(context, PageRouteBuilder(
            pageBuilder: (BuildContext context, Animation animation, Animation secondaryAnimation) {
              return new FadeTransition(
                opacity: animation,
                child: Scaffold(
                  appBar: AppBar(
                    title: Text('原图')
                  ),
                  body: HeroAnimationRouteB()
                )
              );
            })
          );
        },
      ),
    );
  }
}

class HeroAnimationRouteB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: 'avatar',
        child: Image.asset('images/lake.jpg'),
      ),
    );
  }
}