import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show ChangeNotifier;

Map<String, int> theme = {
  "blue": int.parse("42a5f5", radix: 16) | 0xFF000000,
  "red": int.parse("ffa726", radix: 16) | 0xFF000000
};

class ConfigInfo {
  int themeColor = theme['blue'];
}

class ConfigModel extends ConfigInfo with ChangeNotifier {
  Future $setTheme(payload) async {
    themeColor = payload;
    notifyListeners();
  }
}
