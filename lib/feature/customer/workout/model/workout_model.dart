
class WorkoutModel {
  String? title, imageUrl, docId;
  List<WorkoutModelItem> workOutList;

  WorkoutModel({
    this.title,
    this.imageUrl,
    this.docId,
    required this.workOutList,
  });

  factory WorkoutModel.fromJson(Map<String, dynamic> json, [String? id]) {
    return WorkoutModel(
      title: json['title'],
      docId: id,
      imageUrl: json['imageUrl'],
      workOutList: List<WorkoutModelItem>.from(
          json['workOutList'].map((x) => WorkoutModelItem.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['imageUrl'] = imageUrl;
    data['workOutList'] = workOutList.map((v) => v.toJson()).toList();
    return data;
  }
}

class WorkoutModelItem {
  String? name;
  String? url;

  WorkoutModelItem({
    this.name,
    this.url,
  });

  factory WorkoutModelItem.fromJson(Map<String, dynamic> json) {
    return WorkoutModelItem(
      name: json['name'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}
