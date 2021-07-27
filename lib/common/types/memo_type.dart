class MemoTypes {
  // 标题
  String title;

  // 内容
  String content;

  // 图片
  String img;

  // id
  int id;

  MemoTypes(Map<String, dynamic> json) {
    this.id = json['id'];
    this.title = json['title'];
    this.content = json['content'];
    this.img = json['img'];
  }
}
