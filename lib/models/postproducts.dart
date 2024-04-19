class PostProducts {
  String? title;
  int? userId;

  PostProducts({this.title, this.userId});

  PostProducts.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['userId'] = this.userId;
    return data;
  }
}
