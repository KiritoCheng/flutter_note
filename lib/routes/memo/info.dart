import 'package:flutter/material.dart';
import 'package:flutter_note/common/api/memo.dart';
import 'package:flutter_note/common/types/memo_type.dart';
import 'package:flutter_note/widgets/skeleton.dart';

class MemoInfoPage extends StatefulWidget {
  @override
  _MemoInfoState createState() => new _MemoInfoState();
}

class _MemoInfoState extends State<MemoInfoPage> {
  String title = "";
  String content = "";
  String img = "";
  int id;
  // 初始化
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      // 获取路由传参id
      Map<String, dynamic> args = ModalRoute.of(context).settings.arguments;
      MemoTypes _info = await MemoApi.fetchMemoInfo(args["id"]);
      this.setState(() {
        this.id = args["id"];
        this.title = _info.title;
        this.content = _info.content;
        this.img = _info.img;
      });
    });
  }

  // setState被触发
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {}

  // 删除事件
  void deleteMemo() async {
    bool res = await MemoApi.fetchRemoveMemo(this.id);
    if (res) {
      Navigator.of(context).pop();
    }
  }

  // 渲染节点
  void rander() {}

  @override
  Widget build(BuildContext context) {
    // if (this.title == "") {
    //   return Scaffold(body: Skeleton());
    // }
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.grey, //修改颜色
        ),
        elevation: 0,
        actions: <Widget>[
          //导航栏右侧菜单
          IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red,
              onPressed: deleteMemo),
        ],
      ),
      body: Scrollbar(
          child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              this.title,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              this.content,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      )),
    );
  }
}
