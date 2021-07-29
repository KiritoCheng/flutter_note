import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show ChangeNotifier;

class ThemeMap {
  int red = int.parse("ef5350", radix: 16) | 0xFF000000;
  int pink = int.parse("ec407a", radix: 16) | 0xFF000000;
  int purple = int.parse("ab47bc", radix: 16) | 0xFF000000;
  int deepPurple = int.parse("7e57c2", radix: 16) | 0xFF000000;
  int indigo = int.parse("5c6bc0", radix: 16) | 0xFF000000;
  int blue = int.parse("42a5f5", radix: 16) | 0xFF000000;
  int lightBlue = int.parse("29b6f6", radix: 16) | 0xFF000000;
  int cyan = int.parse("26c6da", radix: 16) | 0xFF000000;
  int teal = int.parse("26a69a", radix: 16) | 0xFF000000;
  int green = int.parse("66bb6a", radix: 16) | 0xFF000000;
  int lightGreen = int.parse("9ccc65", radix: 16) | 0xFF000000;
  int lime = int.parse("d4e157", radix: 16) | 0xFF000000;
  int yellow = int.parse("ffee58", radix: 16) | 0xFF000000;
  int amber = int.parse("ffca28", radix: 16) | 0xFF000000;
  int orange = int.parse("ffa726", radix: 16) | 0xFF000000;
  int brown = int.parse("8d6e63", radix: 16) | 0xFF000000;
  int grey = int.parse("bdbdbd", radix: 16) | 0xFF000000;

  // Map 转实体类
  // ThemeMap.fromJson(Map<String, dynamic> json) {}

  // 实体类转 Map
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['red'] = this.red;
    data['pink'] = this.pink;
    data['purple'] = this.purple;
    data['deepPurple'] = this.deepPurple;
    data['indigo'] = this.indigo;
    data['blue'] = this.blue;
    data['lightBlue'] = this.lightBlue;
    data['cyan'] = this.cyan;
    data['teal'] = this.teal;
    data['green'] = this.green;
    data['lightGreen'] = this.lightGreen;
    data['lime'] = this.lime;
    data['yellow'] = this.yellow;
    data['amber'] = this.amber;
    data['orange'] = this.orange;
    data['brown'] = this.brown;
    data['grey'] = this.grey;
    return data;
  }

  // 实体类转List
  List<int> toList() {
    List<int> colorList = new List();
    ThemeMap().toJson().forEach((k, v) {
      colorList.add(v);
    });
    return colorList;
  }
}

class ConfigInfo {
  int themeColor = ThemeMap().blue;
}

class ConfigModel extends ConfigInfo with ChangeNotifier {
  Future $setTheme(payload) async {
    themeColor = payload;
    notifyListeners();
  }
}
