import 'package:flutter/material.dart';
import 'package:flutter_note/common/store/index.dart' show Store;
import 'package:flutter_note/models/config_state_model.dart'
    show ConfigModel, theme;

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  void _setLanguange() {}

  void _setTheme(context) {
    Store.value<ConfigModel>(context).$setTheme(theme["red"]);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        //移除抽屉菜单顶部默认留白
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipOval(
                      child: Image.asset(
                        "images/google_icon.png",
                        width: 80,
                      ),
                    ),
                  ),
                  Text(
                    "Kirito",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    onTap: this._setLanguange,
                    leading: const Icon(Icons.language),
                    title: const Text('更改语言'),
                  ),
                  ListTile(
                    onTap: () {
                      this._setTheme(context);
                    },
                    leading: const Icon(Icons.palette),
                    title: const Text('更改主题'),
                    trailing: Icon(Icons.expand_more),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
