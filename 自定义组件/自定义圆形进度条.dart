import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//import 'widgets/index.dart';
import 'dart:math';

import 'package:test_pro/widgets/index.dart';

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
        body: GradientCircularProgressRoute(),
      )
    );
  }
}

class GradientCircularProgressIndicator extends StatelessWidget  {
  GradientCircularProgressIndicator({
    this.strokeWidth = 2,
    @required this.radius,
    @required this.colors,
    this.stops,
    this.strokeCapRound = false,
    this.backgroundColor = const Color(0xffeeeeee),
    this.totalAngle = 2 * pi,
    this.value
  });

  final double strokeWidth;
  final bool strokeCapRound;
  final double value;
  final double radius;
  final Color backgroundColor;
  final double totalAngle;
  final List<Color> colors;
  final List<double> stops;

  @override
  Widget build(BuildContext context) {
    double _offset = 0;
    if (strokeCapRound) {
      _offset = asin(strokeWidth / (radius * 2 - strokeWidth));
    }
    var _colors = colors;
    if (_colors == null) {
      Color color = Theme
        .of(context)
        .accentColor;
      _colors = [color, color];
    }
    return Transform.rotate(
      angle: -pi / 2 - _offset,
      child: CustomPaint(
        size: Size.fromRadius(radius),
        painter: _GradientCircularProgressPainter(
          strokeWidth: strokeWidth,
          strokeCapRound: strokeCapRound,
          backgroundColor: backgroundColor,
          value: value,
          total: totalAngle,
          radius: radius,
          colors: _colors
        )
      )
    );
  }
}

class _GradientCircularProgressPainter extends CustomPainter {
  _GradientCircularProgressPainter({
    this.strokeWidth: 10,
    this.strokeCapRound: false,
    this.backgroundColor = const Color(0xffeeeeee),
    this.radius,
    this.total = 2 * pi,
    @required this.colors,
    this.stops,
    this.value
  });

  final double strokeWidth;
  final bool strokeCapRound;
  final double value;
  final Color backgroundColor;
  final List<Color> colors;
  final double total;
  final double radius;
  final List<double> stops;

  @override
  void paint(Canvas canvas, Size size) {
    if (radius != null) {
      size = Size.fromRadius(radius);
    }
    double _offset = strokeWidth / 2;
    double _value = (value ?? .0);
    _value = _value.clamp(0.0, 1.0) * total;
    double _start = 0;

    if (strokeCapRound) {
      _start = asin(strokeWidth / (size.width - strokeWidth));
    }

    Rect rect = Offset(_offset, _offset) & Size(
      size.width - strokeWidth,
      size.height - strokeWidth
    );

    var paint = Paint()
      ..strokeCap = strokeCapRound ? StrokeCap.round : StrokeCap.butt
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true
      ..strokeWidth = strokeWidth;

    if (backgroundColor != Colors.transparent) {
      paint.color = backgroundColor;
      canvas.drawArc(rect, _start, total, false, paint);
    }

    if (_value > 0) {
      paint.shader = SweepGradient(
        startAngle: 0,
        endAngle: _value,
        colors: colors,
        stops: stops,
      ).createShader(rect);

      canvas.drawArc(rect, _start, _value, false, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class GradientCircularProgressRoute extends StatefulWidget {
  @override
  GradientCircularProgressRouteState createState() => new GradientCircularProgressRouteState();
}

class GradientCircularProgressRouteState extends State<GradientCircularProgressRoute> with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = 
      new AnimationController(vsync: this, duration: Duration(seconds: 3));
    bool isForward = true;
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.forward) {
        isForward = true;
      } else if (status == AnimationStatus.completed || status == AnimationStatus.dismissed) {
        if (isForward) {
          _animationController.reverse();
        } else {
          _animationController.forward();
        }
      } else if (status == AnimationStatus.reverse) {
        isForward = false;
      }
    });
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AnimatedBuilder(
              animation: _animationController,
              builder: (BuildContext context, Widget child) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    children: <Widget>[
                      Wrap(
                        spacing: 10,
                        runSpacing: 16,
                        children: <Widget>[
                          GradientCircularProgressIndicator(
                            colors: [Colors.blue, Colors.blue],
                            radius: 50,
                            strokeWidth: 3,
                            value: _animationController.value
                          ),
                          GradientCircularProgressIndicator(
                            colors: [Colors.red, Colors.orange],
                            radius: 50,
                            strokeWidth: 3,
                            value: _animationController.value,
                          ),
                          GradientCircularProgressIndicator(
                            colors: [Colors.teal, Colors.cyan],
                            radius: 50,
                            strokeWidth: 5,
                            strokeCapRound: true,
                            value: CurvedAnimation(
                              parent: _animationController,
                              curve: Curves.decelerate).value,
                          ),
                          TurnBox(
                            turns: 1 /8,
                            child: GradientCircularProgressIndicator(
                              colors: [Colors.red, Colors.orange, Colors.red],
                              radius: 50,
                              strokeWidth: 5,
                              strokeCapRound: true,
                              backgroundColor: Colors.red[50],
                              totalAngle: 1.5 * pi,
                              value: CurvedAnimation(
                                parent: _animationController,
                                curve: Curves.ease
                              ).value,
                            ),
                          ),
                          RotatedBox(
                            quarterTurns: 1,
                            child: GradientCircularProgressIndicator(
                              colors: [Colors.blue[700], Colors.blue[200]],
                              radius: 50,
                              strokeWidth: 3,
                              strokeCapRound: true,
                              backgroundColor: Colors.transparent,
                              value: _animationController.value,
                            ),
                          ),
                          GradientCircularProgressIndicator(
                            colors: [Colors.red, Colors.amber, Colors.cyan, Colors.green[200], Colors.blue, Colors.red],
                            radius: 50,
                            strokeWidth: 5,
                            strokeCapRound: true,
                            value: _animationController.value,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: GradientCircularProgressIndicator(
                              colors: [Colors.blue[700], Colors.blue[300]],
                              radius: 100,
                              strokeWidth: 20,
                              value: _animationController.value,
                              strokeCapRound: true,
                            ),
                          ),
                          ClipRect(
                            child: Align(
                              alignment: Alignment.topCenter,
                              heightFactor: .5,
                              child: Padding(
                                padding: const EdgeInsetsDirectional.only(bottom: 8),
                                child: SizedBox(
                                  child: TurnBox(
                                    turns: .75,
                                    child: GradientCircularProgressIndicator(
                                      colors: [Colors.teal, Colors.cyan[500]],
                                      radius: 100,
                                      strokeWidth: 8,
                                      value: _animationController.value,
                                      totalAngle: pi,
                                      strokeCapRound: true,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 104,
                            width: 200,
                            child: Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                Positioned(
                                  height: 200,
                                  top: 0,
                                  child: TurnBox(
                                    turns: .75,
                                    child: GradientCircularProgressIndicator(
                                      colors: [Colors.teal, Colors.cyan[500]],
                                      radius: 100,
                                      strokeWidth: 8,
                                      value: _animationController.value,
                                      totalAngle: pi,
                                      strokeCapRound: true,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(top: 10),
                                  child: Text(
                                    '${(_animationController.value * 100).toInt()}',
                                    style: TextStyle(fontSize: 25, color: Colors.blueGrey),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}


