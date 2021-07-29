import 'package:flutter/material.dart';
import 'package:flutter_note/common/units/routes.dart';
import 'widgets/tab_bar.dart';
import 'package:flutter_note/common/store/index.dart' show Store;
import 'package:flutter_note/models/config_state_model.dart' show ConfigModel;

void main() => runApp(Store.init(child: MyApp()));

// 主入口文件
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Store.connect<ConfigModel>(builder: (context, child, model) {
      return MaterialApp(
          title: 'Flutter Demo',
          home: TabBarRoute(),

          // 获取Provide状态
          theme: ThemeData(
            primaryColor: Color(model.themeColor),
            primaryTextTheme:
                TextTheme(headline6: TextStyle(color: Colors.white)),
            primaryIconTheme: IconThemeData(
              color: Colors.white,
            ),
          ),

          //名为"/"的路由作为应用的home(首页)
          // initialRoute: "add_memo",

          //注册路由表
          routes: routes);
    });
  }
}
