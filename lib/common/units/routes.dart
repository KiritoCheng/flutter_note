import 'package:flutter_note/routes/memo/index.dart';
import 'package:flutter_note/routes/home_page.dart';
import 'package:flutter_note/routes/my_page.dart';

final routes = {
  //注册首页路由
  "home_page": (context) => HomePage(),
  "my_page": (context) => MyPage(),
  "add_memo": (context) => MemoAddPage(),
  "memo_info": (context) => MemoInfoPage(),
};

// 动态路由
// Route<dynamic> generateRoute(RouteSettings settings) {
// 	switch (settings.name) {
// 		case page5:
// 			return MaterialPageRoute(builder: (context) => Page5());
// 		case page6:
// 			return MaterialPageRoute(builder: (context) => Page6());
// 		default:
// 			return MaterialPageRoute(builder: (context) => Page1());
// 	}
