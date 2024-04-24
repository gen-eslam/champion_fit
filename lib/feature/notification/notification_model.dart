class NotificationModel {
  final String title;
  final String time;

  NotificationModel({
    required this.title,
    required this.time,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json, [String? uid]) {
    return NotificationModel(
      title: json['message'],
      time: json['time'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = title;
    data['time'] = time;
    return data;
  }
}
