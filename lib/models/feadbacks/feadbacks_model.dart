class FeadbacksModel {
  String uid;
  String userName;
  String email;
  String feadback;

  FeadbacksModel({
    required this.uid,
    required this.userName,
    required this.email,
    required this.feadback,
  });

  factory FeadbacksModel.fromJson(Map<String, dynamic> json) => FeadbacksModel(
        uid: json['uid'],
        userName: json['userName'],
        email: json['email'],
        feadback: json['feadback'],
      );

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'userName': userName,
        'email': email,
        'feadback': feadback,
      };

  @override
  String toString() {
    return "uid: $uid, userName: $userName, email: $email, feadback: $feadback ";
  }
}
