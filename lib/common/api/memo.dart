// import 'package:flutter_note/models/task.dart';
import 'package:flutter_note/common/types/memo_type.dart';

import '../units/http.dart';

class MemoApi {
  // 便签列表
  static const list = '/api/task/list';
  static Future<List<MemoTypes>> fetchMemoList() async {
    var res = await HttpRequest().makeRequest(MemoApi.list);

    // 获取返回的数据列表
    var rtn = res != null ? res["data"] : [];

    // 类型转换
    List<MemoTypes> memoList = List();
    rtn.forEach((value) {
      var newDat = MemoTypes(value);
      memoList.add(newDat);
    });

    return memoList;
  }

  // 新增便签
  static const add = '/api/task/add';
  static Future<dynamic> fetchAddTask(String title, String content) async {
    var res = await HttpRequest()
        .makeRequest(MemoApi.add, {"title": title, "content": content});
    // {res: 0, msg: 添加成功, data: []}
    if (res['res'] == 0) return true;
    return false;
  }

  // 便签详情
  static const info = '/api/task/info';
  static Future<MemoTypes> fetchMemoInfo(int id) async {
    var res =
        await HttpRequest().makeRequest(MemoApi.info, {"id": id.toString()});

    // 获取返回的数据列表
    var rtn = res != null ? res["data"] : {};
    return MemoTypes(rtn);
  }

  // 删除便签
  static const remove = '/api/task/delete';
  static Future<dynamic> fetchRemoveMemo(int id) async {
    var res =
        await HttpRequest().makeRequest(MemoApi.remove, {"id": id.toString()});
    if (res['res'] == 0) return true;
    return false;
  }
}
