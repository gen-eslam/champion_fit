class WorkOutModel {
  String title;
  String url;
  List<WorkOutListItem> workOutList;

  WorkOutModel({
    required this.title,
    required this.url,
    required this.workOutList,
  });

  factory WorkOutModel.fromJson(Map<String, dynamic> json) {
    return WorkOutModel(
      title: json['title'],
      url: json['url'],
      workOutList: (json['workOutList'] as List)
          .map((e) => WorkOutListItem.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'url': url,
      'workOutList': workOutList,
    };
  }

  @override
  String toString() {
    return 'WorkOutModel{title: $title, url: $url, workOutList: $workOutList}';
  }
}

class WorkOutListItem {
  String name, startTime, endTime;

  WorkOutListItem({
    required this.name,
    required this.startTime,
    required this.endTime,
  });

  factory WorkOutListItem.fromJson(Map<String, dynamic> json) {
    return WorkOutListItem(
      name: json['name'],
      startTime: json['startTime'],
      endTime: json['endTime'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'startTime': startTime,
      'endTime': endTime,
    };
  }

  @override
  String toString() {
    return 'WorkOutListItem{name: $name, startTime: $startTime, endTime: $endTime}';
  }
}
