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

class FutureText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<int> _showModalBottomSheet() {
      return showModalBottomSheet<int>(
        context: context,
        builder: (BuildContext context) {
          return ListView.builder(
            itemCount: 30,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text('$index'),
                onTap: () => Navigator.of(context).pop(index),
              );
            },
          );
        }
      );
    }

    showLoadingDialog() {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return UnconstrainedBox(
            constrainedAxis: Axis.vertical, 
            child: SizedBox(
              width: 280,
              child: AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(
                      padding: const EdgeInsets.only(top: 26),
                      child: Text('正在加载，请稍后...'),
                    )
                  ],
                ),
              ),
            ),
          );
        }
      );
    }

    Future<DateTime> _showDatePicker1() {
      var date = DateTime.now();
      return showDatePicker(
        context: context,
        initialDate: date,
        firstDate: date,
        lastDate: date.add(Duration(days: 30)),
      );
    }

    Future<DateTime> _showDatePicker2() {
      var date = DateTime.now();
      return showCupertinoModalPopup(
        context: context,
        builder: (ctx) {
          return SizedBox(
            height: 200,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.dateAndTime,
              minimumDate: date,
              maximumDate: date.add(
                Duration(days: 30)
              ),
              maximumYear: date.year + 1,
              onDateTimeChanged: (DateTime value) {
                print(value);
              },
            ),
          );
        }
      );
    }
    return Column(
      children: <Widget>[
        RaisedButton(
          child: Text('对话框一'),
          onPressed: () async {
            //  showDeleteConfirmDialog1()
            bool delete = await showCustomDialog<bool>(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('提示'),
                  content: Text('您确定要删除当前文件吗？'),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('取消'),
                      onPressed: () => Navigator.of(context).pop(false),
                    ),
                    FlatButton(
                      child: Text('删除'),
                      onPressed: () => Navigator.of(context).pop(true),
                    )
                  ],
                );
              }
            );
            if (delete) {
              print('已确认删除');
            } else {
              print('取消删除');
            }
          },
        ),
        RaisedButton(
          child: Text('对话框二'),
          onPressed: () {changeLanguage(context);},
        ),
        RaisedButton(
          child: Text('对话框三'),
          onPressed: () {showListDialog(context);},
        ),
        DialogRoute(),
        RaisedButton(
          child: Text('对话框五，复选可点击'),
          onPressed: () async {
            bool deleteTree = await showDeleteConfirmDialog3(context);
            if (deleteTree == null) {
              print('取消删除');
            } else {
              print('同时删除子目录： $deleteTree');
            }
          },
        ),
        RaisedButton(
          child: Text('显示底部菜单'),
          onPressed: () async {
            int type = await _showModalBottomSheet();
            print(type);
          },
        ),
        RaisedButton(
          child: Text('loading 对话框'),
          onPressed: () {
            showLoadingDialog();
          },
        ),
        RaisedButton(
          child: Text('日期选择器'),
          onPressed: () {
            _showDatePicker1();
          },
        ),
        RaisedButton(
          child: Text('ios风格日期选择器'),
          onPressed: () {
            _showDatePicker2();
          },
        )
      ]
    );
  }
}

class DialogCheckbox extends StatefulWidget {
  DialogCheckbox({
    Key key,
    this.value,
    @required this.onChanged
  });

  final ValueChanged<bool> onChanged;
  final bool value;

  @override
  _DialogCheckboxState createState() => _DialogCheckboxState();
}

class _DialogCheckboxState extends State<DialogCheckbox>{
  bool value;

  @override
  void initState() {
    value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      onChanged: (v) {
        widget.onChanged(v);
        setState(() {
         value = v; 
        });
      },
    );
  }
}
Future<bool> showDeleteConfirmDialog3(context) {
  bool _withTree = false; //记录复选框是否选中
  
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("提示"),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("您确定要删除当前文件吗?"),
            Row(
              children: <Widget>[
                Text("同时删除子目录？"),
                DialogCheckbox(
                  value: _withTree, //默认不选中
                  onChanged: (bool value) {
                    //更新选中状态
                    _withTree = !_withTree;
                  },
                ),
              ],
            ),
          ],
        ),
        actions: <Widget>[
          FlatButton(
            child: Text("取消"),
            onPressed: () => Navigator.of(context).pop(),
          ),
          FlatButton(
            child: Text("删除"),
            onPressed: () {
              // 将选中状态返回
              Navigator.of(context).pop(_withTree);
            },
          ),
        ],
      );
    },
  );
}

class StatefulBuilder extends StatefulWidget {
  const StatefulBuilder({
    Key key,
    @required this.builder,
  }) : assert(builder != null), super(key: key);

  final StatefulWidgetBuilder builder;

  @override
  _StatefulBuilderState createState() => _StatefulBuilderState();
}

class _StatefulBuilderState extends State<StatefulBuilder> {
  //  builder 一定需要两个参数
  @override
  Widget build(BuildContext context) => widget.builder(context, setState);
}


class DialogRoute extends StatefulWidget {
  @override
  _DialogRouteState createState() => new _DialogRouteState();
}

class _DialogRouteState extends State<DialogRoute> {
  bool withTree = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RaisedButton(
          child: Text('对话框四'),
          onPressed: () async {
            bool delete = await showDeleteConfirmDialog2();
            if (delete) {
              print('取消删除');
            } else {
              print('同时删除');
            }
          },
        )
      ],
    );
  }

//默认无法更新，因为setState只能修改当前build构造的子树的状态并重新渲染，但是checkbox本身是showDeleteConfirmDialog2构造的
//  故无法刷新状态
  Future<bool> showDeleteConfirmDialog2() {
    withTree = false;
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('提示'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('请确定要删除当前文件吗？'),
              Row(
                children: <Widget>[
                  Text('同时删除子目录？'),
                  //  注释的写法无法实现勾选
                  // Checkbox(
                  //   value: withTree,
                  //   onChanged: (bool value) {
                  //     setState(() {
                  //     withTree = !withTree; 
                  //     });
                  //   },
                  // )

                  //  调整方法二 包裹statefulBuilder，传递context并且调用setState
                  StatefulBuilder(
                    builder: (context, _setState) {
                      return Checkbox(
                        value: withTree,
                        onChanged: (bool value) {
                          _setState(() {
                            withTree = !withTree;
                          });
                        },
                      );
                    },
                  ),
                  //  方法三 调用内部方法，标记element为dirty
                  Builder(
                    builder: (BuildContext context) {
                      return Checkbox(
                        value: withTree,
                        onChanged: (bool value) {
                          (context as Element).markNeedsBuild();
                          withTree = !withTree;
                        },
                      );
                    },
                  )
                ],
              )
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('取消'),
              onPressed: () => Navigator.of(context).pop(false),
            ),
            FlatButton(
              child: Text('删除'),
              onPressed: () {
                Navigator.of(context).pop(withTree);
              },
            )
          ],
        );
      }
    );
  }
}

Future<T> showCustomDialog<T>({
  @required BuildContext context,
  bool barrierDismissible = true,
  WidgetBuilder builder,
}) {
  final ThemeData theme = Theme.of(context, shadowThemeOnly: true);
  return showGeneralDialog(
    context: context,
    pageBuilder: (BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
        final Widget pageChild = Builder(builder: builder,);
        return SafeArea(
          child: Builder(builder: (BuildContext context) {
            return theme != null ? Theme(data: theme, child: pageChild,) : pageChild;
          },),
        );
      },
    barrierDismissible: barrierDismissible,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black87,
    transitionDuration: const Duration(milliseconds: 150),
    transitionBuilder: _buildMaterialDialogTransitions
  );
}

Widget _buildMaterialDialogTransitions(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child
) {
  return ScaleTransition(
    scale: CurvedAnimation(
      parent: animation,
      curve: Curves.easeOut,
    ),
    child: child,
  );
}

Future<void> showListDialog(context) async {
  int index = await showDialog<int>(
    context: context,
    builder: (BuildContext context) {
      var child = Column(
        children: <Widget>[
          ListTile(title: Text('请选择'),),
          Expanded(
            child: ListView.builder(
              itemCount: 30,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text('$index'),
                  onTap: () => Navigator.of(context).pop(index),
                );
              },
            ),
          )
        ],
      );
      return Dialog(child: child,);
    }
  );
  if (index != null) {
    print('点击了: $index');
  }
}

Future<void> changeLanguage(context) async {
  int i = await showDialog<int>(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        title: const Text('请选择语言'),
        children: <Widget>[
          SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context, 1);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: const Text('简体中文'),
            ),
          ),
          SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context, 2);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: const Text('美国英语'),
            ),
          )
        ],
      );
    }
  );
  if (i != null) {
    print('选择了：${i == 1 ? '简体中文':'美国英语'}');
  }
}

Future<bool> showDeleteConfirmDialog1(context) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('提示'),
        content: Text('您确定要删除当前文件吗？'),
        actions: <Widget>[
          FlatButton(
            child: Text('取消'),
            onPressed: () => Navigator.of(context).pop(false),
          ),
          FlatButton(
            child: Text('删除'),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          )
        ],
      );
    }
  );
}

