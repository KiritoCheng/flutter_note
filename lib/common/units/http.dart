import 'dart:convert';
import 'package:http/http.dart' as http;
import '../api/config.dart';

class HttpRequest {
  // static const CONTENT_TYPE_JSON = "application/json";
  // static const CONTENT_TYPE_FORM = "application/x-www-form-urlencoded";
  static final _host = commonConfig["HOST"];
  static final _port = commonConfig["PORT"];

  makeRequest(String url, [params]) async {
    print("请求开始: $_host:$_port$url");
    print("请求参数: $params");

    return await http
        .post('$_host:$_port$url',
            // headers: {
            //   "Content-Type": CONTENT_TYPE_JSON,
            // },
            body: params)
        .then((response) {
      if (response.statusCode != 200) {
        throw Exception('请求失败');
      }

      // 请求成功拿取值
      Map<String, dynamic> data = jsonDecode(response.body.toString());

      if (data["res"] != 0) {
        return null;
      }

      print("请求成功");
      return data;
    }).catchError((error) {
      print('请求失败$error');
      throw Exception('请求失败$error');
    }).whenComplete(() => print("请求结束!"));
  }
}
