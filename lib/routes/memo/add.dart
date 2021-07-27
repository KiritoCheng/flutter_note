import 'package:flutter/material.dart';
import '../../common/api/memo.dart';

class MemoAddPage extends StatefulWidget {
  @override
  _MemoAddPage createState() => new _MemoAddPage();
}

class _MemoAddPage extends State<MemoAddPage> {
  final titleInput = TextEditingController();
  final contentInput = TextEditingController();

  GlobalKey _formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  void submitAddMemo() async {
    if ((_formKey.currentState as FormState).validate()) {
      //验证通过提交数据
      var res = await MemoApi.fetchAddTask(titleInput.text, contentInput.text);
      if (res) {
        Navigator.of(context).pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // 禁止键盘占用
        // resizeToAvoidBottomPadding: false,
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
                icon: Icon(Icons.done),
                color: Colors.blue,
                onPressed: submitAddMemo),
          ],
        ),
        body: Scrollbar(
            child: SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child: Form(
                    key: _formKey, //设置globalKey，用于后面获取FormState
                    // autovalidate: true, //开启自动校验
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: <Widget>[
                        // 标题
                        TextFormField(
                          controller: titleInput,
                          style: TextStyle(fontSize: 24),
                          maxLines: 1,
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                              height: 0.5,
                              fontWeight: FontWeight.w500,
                            ),
                            labelText: "标题",
                          ),
                          // 校验
                          validator: (v) {
                            return v.trim().length > 0 ? null : "请输入标题";
                          },
                        ),
                        // 内容
                        Container(
                            constraints: BoxConstraints(
                                minHeight:
                                    MediaQuery.of(context).size.height - 200),
                            child: TextField(
                              controller: contentInput,
                              style: TextStyle(fontSize: 18),
                              maxLines: null,
                              scrollPadding: EdgeInsets.all(20.0),
                              decoration: InputDecoration(
                                hintText: "记事",
                                border: InputBorder.none,
                                // border: OutlineInputBorder(),
                              ),
                            ))
                      ],
                    )))));
  }
}
