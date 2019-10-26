import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'localTest',
      home: new Scaffold(
        body: CustomScrollViewTestRoute(),
      )
    );
  }
}

class CustomScrollViewTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          expandedHeight: 250,
          flexibleSpace: FlexibleSpaceBar(
            title: const Text('Demo'),
            background: Image.asset('./images/lake.jpg', fit: BoxFit.cover),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(8),
          sliver: new SliverGrid(
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 4
            ),
            delegate: new SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return new Container(
                  alignment: Alignment.center,
                  color: Colors.cyan[100 * (index % 9)],
                  child: new Text('grid item $index'),
                );
              },
              childCount: 20,
            ),
          )
        ),
        new SliverFixedExtentList(
          itemExtent: 50,
          delegate: new SliverChildBuilderDelegate((BuildContext context, int index) {
            return new Container(
              alignment: Alignment.center,
              color: Colors.lightBlue[100 * (index%9)],
              child: new Text('list item $index'),
            );
          },
          childCount: 50
          ),
        )
      ],
    );
  }
}



