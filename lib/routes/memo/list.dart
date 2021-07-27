import 'package:flutter/material.dart';
import 'package:flutter_note/common/types/memo_type.dart';
import '../../common/api/config.dart';
import '../../widgets/memo_card.dart';

// 任务列表
class MemoList extends StatelessWidget {
  // 父组件调用子组件方法
  // MemoCard.memoCardKey.currentState.handleLongPress();
  // static final GlobalKey memoCardKey = GlobalKey();

  final cardPress;

  MemoList({Key key, this.cardPress}) : super(key: key);

  final List editingList = [];

  // 请求接口
  Future<List<MemoTypes>> fetchMemoList() async {
    return await MemoApi.fetchMemoList();
  }

  // 缓存勾中的列表
  setEditingList(selected, MemoTypes item) {
    if (selected) {
      // 选中添加入缓存
      editingList.add(item);
    } else {
      // 从缓存中移除
      editingList.removeWhere((e) {
        return e.id == item.id;
      });
    }
  }

  // 点击事件
  handleTap(selected, MemoTypes item, context) {
    if (editingList.length > 0) {
      setEditingList(!selected, item);
      return true;
    }

    // 调用父组件事件
    this.cardPress({"id": item.id});
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<List<MemoTypes>>(
        future: fetchMemoList(),
        builder:
            (BuildContext context, AsyncSnapshot<List<MemoTypes>> snapshot) {
          // 请求已结束
          if (snapshot.connectionState == ConnectionState.done) {
            // 请求失败，显示错误
            if (snapshot.hasError) {
              print(snapshot.error);
              return Text("服务开小差了~");
            }

            // 请求成功，显示数据
            // List<MemoTypes>
            List<MemoTypes> list = snapshot.data;
            return ListView.builder(
                itemCount: list.length,
                itemBuilder: (BuildContext context, int index) {
                  return MemoCard(
                      onLongPress: (selected) {
                        setEditingList(selected, list[index]);
                      },
                      onTap: (selected) {
                        return handleTap(selected, list[index], context);
                      },
                      title: list[index].title,
                      context: list[index].content,
                      margin: EdgeInsets.fromLTRB(
                          16, 16, 16, index == list.length - 1 ? 16 : 0));
                });
          }
          // 请求未结束，显示loading
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
