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
  @override
  _AnimatedSwitcherCounterRouteState createState() => _AnimatedSwitcherCounterRouteState();
}

class _AnimatedSwitcherCounterRouteState extends State<AnimatedSwitcherCounterRoute> {
  Color _decorationColor = Colors.blue;
  @override
  Widget build(BuildContext context) {

    var duration = Duration(seconds: 1);

    return AnimatedDecoratedBox1(
      duration: duration,
      decoration: BoxDecoration(color: _decorationColor),
      child: FlatButton(
        onPressed: () {
          setState(() {
            if (_decorationColor == Colors.blue)
              _decorationColor = Colors.red;
            else
              _decorationColor = Colors.blue;
          });
        },
        child: Text(
          'AnimatedDecoratedBox',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class AnimatedDecoratedBox1 extends StatefulWidget {
  AnimatedDecoratedBox1({
    Key key,
    @required this.decoration,
    this.child,
    this.curve =Curves.linear,
    @required this.duration,
    this.reverseDuration
  });

  final BoxDecoration decoration;
  final Widget child;
  final Duration duration;
  final Curve curve;
  final Duration reverseDuration;

  @override
  _AnimatedDecoratedBox1State createState() => _AnimatedDecoratedBox1State();
}

class _AnimatedDecoratedBox1State extends State<AnimatedDecoratedBox1> with SingleTickerProviderStateMixin {
  @protected
  AnimationController get controller => _controller;
  AnimationController _controller;

  Animation<double> get animation => animation;
  Animation<double> _animation;

  DecorationTween _tween;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return DecoratedBox(
          decoration: _tween.animate(_animation).value,
          child: child,
        );
      },
      child: widget.child
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      reverseDuration: widget.reverseDuration,
      vsync: this
    );
    _tween = DecorationTween(begin: widget.decoration);
    _updateCurve();
  }

  void _updateCurve() {
    if (widget.curve != null) {
      _animation = CurvedAnimation(parent: _controller, curve: widget.curve);
    } else {
      _animation = _controller;
    }
  }

  @override
  void didUpdateWidget(AnimatedDecoratedBox1 oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.curve != oldWidget.curve){
      _updateCurve();
    }
    _controller.duration = widget.duration;
    _controller.reverseDuration = widget.reverseDuration;
    if (widget.decoration != (_tween.end ?? _tween.begin)) {
      _tween..begin = _tween.evaluate(_animation)
      ..end = widget.decoration;

      _controller..value = 0.0..forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}