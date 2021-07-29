import 'package:flutter/material.dart';
import 'package:flutter_note/common/store/index.dart' show Store;
import 'package:flutter_note/models/config_state_model.dart'
    show ConfigModel, ThemeMap;

class SelectTheme extends StatefulWidget {
  const SelectTheme({Key key}) : super(key: key);

  @override
  _SelectThemeState createState() => _SelectThemeState();
}

class _SelectThemeState extends State<SelectTheme> {
  bool _isExpanded = false;

  // 改变颜色
  void _setTheme(color) {
    Store.value<ConfigModel>(context).$setTheme(color);
    // 关闭draw
    Navigator.pop(context);
  }

  // 折叠收缩
  void _setExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
    return Theme(
        data: Theme.of(context).copyWith(cardColor: Colors.transparent),
        child: ExpansionPanelList(
          elevation: 0,
          children: [
            ExpansionPanel(
              // 头部
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  tileColor: Colors.transparent,
                  leading: const Icon(Icons.palette),
                  title: const Text('更改主题'),
                );
              },
              // 折叠内容
              body: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Wrap(
                  spacing: 8.0, // 主轴(水平)方向间距
                  runSpacing: 4.0, // 纵轴（垂直）方向间距
                  children: ThemeMap().toList().map<Widget>((int color) {
                    return GestureDetector(
                      onTap: () {
                        _setTheme(color);
                      },
                      child: Container(
                        color: Color(color),
                        height: 30,
                        width: 30,
                      ),
                    );
                  }).toList(),
                ),
              ),
              isExpanded: _isExpanded,
              canTapOnHeader: true,
            )
          ],
          // 折叠触发事件
          expansionCallback: (int index, bool isExpanded) {
            _setExpanded();
          },
        ));
  }
}
