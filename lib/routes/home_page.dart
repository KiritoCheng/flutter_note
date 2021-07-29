import 'package:flutter/material.dart';
import 'package:flutter_note/widgets/drawer/index.dart';
import './memo/index.dart';

// home主页
class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  // 销毁
  @override
  void dispose() {
    super.dispose();
  }

  // 初始化
  @override
  void initState() {
    super.initState();
  }

  // setState被触发
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {}

  // 按钮点击
  void _addPress() {
    Navigator.pushNamed(context, "add_memo").then((value) {
      this.setState(() {});
    });
  }

  // 卡片点击
  void _cardPress(arguments) {
    Navigator.pushNamed(context, "memo_info", arguments: arguments)
        .then((value) {
      this.setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //导航栏
      appBar: AppBar(
        title: Text("便签"),
      ),

      //抽屉
      drawer: new MyDrawer(),

      // 内容
      body: Container(
        child: MemoList(cardPress: _cardPress),
      ),

      // 浮动按钮
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: _addPress,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
