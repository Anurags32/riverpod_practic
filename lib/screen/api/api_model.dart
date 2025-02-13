class Riverpod_Model {
  int? userId;
  int? id;
  String? title;
  String? body;

  Riverpod_Model({this.userId, this.id, this.title, this.body});

  Riverpod_Model.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}
