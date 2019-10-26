import 'package:english_words/english_words.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'localTest',
      home: new Scaffold(
        body: InfiniteListView(),
      )
    );
  }
}

class InfiniteListView extends StatefulWidget {
  @override
  _InfiniteListViewState createState() => new _InfiniteListViewState();
}

class _InfiniteListViewState extends State<InfiniteListView> {
  static const loadingTag = '###loading###';
  var _words = <String>[loadingTag];

  @override
  void initState() {
    super.initState();
    _retrieveDate();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: _words.length,
      itemBuilder: (context, index) {
        if (_words[index] == loadingTag) {
          if (_words.length - 1 < 100) {
            _retrieveDate();
            return Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.center,
              child: SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            );
          } else {
            return Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(16),
              child: Text('没有更多了', style: TextStyle(color: Colors.grey)),
            );
          }
        }
        return ListTile(title: Text(_words[index]));
      },
      separatorBuilder: (context, index) => Divider(height: 0),
    );
  }

  void _retrieveDate() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      _words.insertAll(_words.length - 1,
        prefix0.generateWordPairs().take(20).map((e) => e.asPascalCase).toList()
      );
      setState(() {
        
      });
    });
  }
}

