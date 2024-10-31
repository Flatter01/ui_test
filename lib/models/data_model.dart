class PostModel {
  int? id;
  String? title;
  String? body;

  PostModel({this.id, this.title, this.body});
  PostModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    return data;
  }
}
