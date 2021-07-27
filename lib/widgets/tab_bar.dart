import 'package:flutter/material.dart';
import '../routes/my_page.dart';
import '../routes/home_page.dart';

// 路由容器管理
class TabBarRoute extends StatefulWidget {
  @override
  _RouterState createState() => _RouterState();
}

class _RouterState extends State<TabBarRoute> {
  // 选中的下标
  int _selectedIndex = 0;

  // 菜单栏配置
  final List<Map> _items = [
    {"name": "笔记", "route": HomePage()},
    {"name": "我的", "route": MyPage()}
  ];
  // final List _routeNames = ['home_page', 'my_page'];

  // 点击菜单栏事件
  void _onItemTapped(int index) {
    if (_selectedIndex == index) {
      return;
    }

    // 更新UI
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _items[_selectedIndex]["route"],

      // 底部菜单
      bottomNavigationBar: BottomNavigationBar(
        // 底部导航
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: _items[0]["name"]),
          BottomNavigationBarItem(
              icon: Icon(Icons.school), label: _items[1]["name"]),
        ],
        currentIndex: _selectedIndex,
        // fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
