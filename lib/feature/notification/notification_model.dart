class NotificationModel {
  final String title;
  final String body;
  final String date;

  NotificationModel({
    required this.title,
    required this.body,
    required this.date,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json, [String? uid]) {
    return NotificationModel(
      title: json['title'],
      body: json['body'],
      date: json['date'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['body'] = body;
    data['date'] = date;
    return data;
  }
}
