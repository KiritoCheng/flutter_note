import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPage createState() => _MyPage();
}

class _MyPage extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    List menuTitles = [
      '我的消息',
      '阅读记录',
      '我的博客',
      '我的活动',
      '联系我们',
      '关于应用',
    ];

    List menuIcons = [
      Icons.message,
      Icons.print,
      Icons.error,
      Icons.send,
      Icons.people,
      Icons.person,
    ];

    return SingleChildScrollView(
      child: Column(children: [
        // 用户界面
        Container(
            height: 200.0,
            color: Colors.blue,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        //背景装饰
                        gradient: RadialGradient(
                            //背景径向渐变
                            colors: [Colors.red, Colors.orange],
                            center: Alignment.topLeft,
                            radius: .98),
                        boxShadow: [
                          //卡片阴影
                          BoxShadow(
                              color: Colors.black54,
                              offset: Offset(2.0, 2.0),
                              blurRadius: 4.0)
                        ]),
                  ),
                  //加间距
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    '点击头像登录',
                    style: TextStyle(color: Colors.white),
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
                trailing: Icon(Icons.arrow_forward_ios),
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
