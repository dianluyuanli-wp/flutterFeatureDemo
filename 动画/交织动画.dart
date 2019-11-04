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
        body: StaggerRoute(),
      )
    );
  }
}

class StaggerAnimation extends StatelessWidget {
  StaggerAnimation({ Key key, this.controller }) : super(key: key) {
    height = Tween<double>(
      begin: 0,
      end: 300
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 0.6, curve: Curves.ease)
      )
    );

    color = ColorTween(
      begin: Colors.green,
      end: Colors.red,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0, 0.6, curve: Curves.ease)
      )
    );

    padding = Tween<EdgeInsets> (
      begin: EdgeInsets.only(left: 0),
      end: EdgeInsets.only(left: 100),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0, 1, curve: Curves.ease)
      )
    );
  }

  final Animation<double> controller;
  Animation<double> height;
  Animation<EdgeInsets> padding;
  Animation<Color> color;

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: padding.value,
      child: Container(
        color: color.value,
        width: 50,
        height: height.value
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller
    );
  }
}

class StaggerRoute extends StatefulWidget {
  @override
  _StaggerRouteState createState() => _StaggerRouteState();
}

class _StaggerRouteState extends State<StaggerRoute> with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this
    );
  }

  Future<Null> _playAnimation() async{
    try {
      await _controller.forward().orCancel;
      await _controller.reverse().orCancel;
    } on TickerCanceled {

    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        _playAnimation();
      },
      child: Center(
        child: Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(.1),
            border: Border.all(
              color: Colors.black.withOpacity(.5)
            )
          ),
          child: StaggerAnimation(
            controller: _controller
          ),
        ),
      ),
    );
  }
}