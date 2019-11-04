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
        body: AnimatedSwitcherCounterRoute(),
      )
    );
  }
}

class AnimatedSwitcherCounterRoute extends StatefulWidget {
  const AnimatedSwitcherCounterRoute({Key key}) : super(key: key);

  @override
  _AnimatedSwitcherCounterRouteState createState() => _AnimatedSwitcherCounterRouteState();
}

class _AnimatedSwitcherCounterRouteState extends State<AnimatedSwitcherCounterRoute> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (Widget child, Animation<double> animation) {
              //return ScaleTransition(child: child, scale: animation);
              var tween = Tween<Offset>(begin: Offset(1, 0), end: Offset(0,0));
              return MySlideTransition(
                child: child,
                position: tween.animate(animation),
              );
            },
            child: Text(
              '$_count',
              key: ValueKey<int>(_count),
              style: Theme.of(context).textTheme.display1
            ),
          ),
          RaisedButton(
            child: const Text('+1'),
            onPressed: () {
              setState(() {
               _count += 1; 
              });
            },
          )
        ],
      ),
    );
  }
}

class MySlideTransition extends AnimatedWidget {
  MySlideTransition({
    Key key,
    @required Animation<Offset> position,
    this.transformHitTests = true,
    this.child,
  }) : assert(position != null),
       super(key: key, listenable: position);

  Animation<Offset> get position => listenable;
  final bool transformHitTests;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    Offset offset = position.value;
    if (position.status == AnimationStatus.reverse) {
      offset = Offset(-offset.dx, offset.dy);
    }
    return FractionalTranslation(
      translation: offset,
      transformHitTests: transformHitTests,
      child: child
    );
  }
}