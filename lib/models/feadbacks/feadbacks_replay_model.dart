class FeadBackReplayModel {
  final String uid;
  final String name;
  final String email;
  final String message;
  final String replay;
  FeadBackReplayModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.message,
    required this.replay,
  });

  factory FeadBackReplayModel.fromJson(Map<String, dynamic> json,
      [String? id]) {
    return FeadBackReplayModel(
      uid: json['uid'],
      name: json['name'],
      email: json['email'],
      message: json['message'],
      replay: json['replay'],
    );
  }

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'name': name,
        'email': email,
        'message': message,
        'replay': replay,
      };

  @override
  String toString() {
    return "uid: $uid, name: $name, email: $email, message: $message, replay: $replay";
  }
}
