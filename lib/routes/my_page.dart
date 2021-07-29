import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPage createState() => _MyPage();
}

class _MyPage extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    List menuTitles = [
      '我的便签',
      '上传云端',
      '历史记录',
      '参与活动',
      '联系我们',
      '关于应用',
    ];

    List menuIcons = [
      Icons.chat_bubble_outline,
      Icons.call_split,
      Icons.history,
      Icons.all_inclusive,
      Icons.mail_outline,
      Icons.call_made,
    ];

    return SingleChildScrollView(
      child: Column(children: [
        // 用户界面
        Container(
            decoration: BoxDecoration(
              // 背景装饰
              gradient: LinearGradient(
                colors: [Theme.of(context).primaryColor, Colors.white10],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            height: 200.0,
            // color: Theme.of(context).primaryColor,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    // width: 60,
                    // height: 60,
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      "K",
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        shape: BoxShape.circle,
                        boxShadow: [
                          //卡片阴影
                          BoxShadow(
                              color: Colors.black54,
                              offset: Offset(1.0, 1.0),
                              blurRadius: 4.0)
                        ]),
                  ),
                  //加间距
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'KiritoChen',
                    style: TextStyle(fontSize: 24, color: Colors.black87),
                  )
                ],
              ),
            )),

        // 列表界面
        ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ListTile(
                //左图标
                leading: Icon(menuIcons[index]),
                //中间标题
                title: Text(menuTitles[index]),
                trailing: Icon(Icons.chevron_right),
              );
            },
            //分隔线
            separatorBuilder: (context, index) {
              return Divider();
            },
            itemCount: menuTitles.length)
      ]),
    );
  }
}
