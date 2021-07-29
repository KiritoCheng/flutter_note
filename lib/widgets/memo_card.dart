import 'package:flutter/material.dart';

class MemoCard extends StatefulWidget {
  // 标题
  final title;

  // 内容
  final context;

  // 边距
  final margin;
  final id;

  // 点击事件
  final onTap;
  final onLongPress;
  final selected;

  MemoCard(
      {Key key,
      this.title = "",
      this.context = "",
      this.margin,
      this.selected = false,
      this.id,
      @required this.onTap,
      @required this.onLongPress})
      : super(key: key);

  @override
  _MemoCardState createState() => new _MemoCardState();
}

class _MemoCardState extends State<MemoCard> {
  bool selected = false;

  @override
  void initState() {
    super.initState();
    selected = widget.selected || false;
  }

  // 长按
  void handleLongPress() {
    this.setState(() {
      selected = !selected;
    });
    widget.onLongPress(selected);
  }

  // 点击
  void handleTap() {
    // 获取是否在编辑状态，如果编辑状态，点击变为长按事件
    var isEditor = widget.onTap(selected);
    if (isEditor) {
      this.setState(() {
        selected = !selected;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: handleTap,
        onLongPress: handleLongPress, //点击

        child: Card(
            shape: RoundedRectangleBorder(
                side: BorderSide(
                    color: selected ? Colors.black87 : Colors.white,
                    width: 2.0),
                borderRadius: BorderRadius.circular(4.0)),
            // margin: EdgeInsets.symmetric(vertical: 16.0),
            margin: widget.margin,
            child: Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 标题
                    Text(widget.title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        )),
                    // 内容
                    widget.context != ""
                        ? Container(
                            margin: EdgeInsets.only(top: 16),
                            child: Text(
                              widget.context,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ))
                        : Container()
                  ],
                ))));
  }
}
