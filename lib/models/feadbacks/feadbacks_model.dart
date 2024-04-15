class FeadbacksModel {
  String uid;
  String userName;
  String email;
  String feadback;
  bool isSeen;

  FeadbacksModel({
    required this.uid,
    required this.userName,
    required this.email,
    this.isSeen = false,
    required this.feadback,
  });

  factory FeadbacksModel.fromJson(Map<String, dynamic> json) => FeadbacksModel(
        uid: json['uid'],
        userName: json['userName'],
        email: json['email'],
        isSeen: json['isSeen'],
        feadback: json['feadback'],
      );

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'userName': userName,
        'email': email,
        'isSeen': isSeen,
        'feadback': feadback,
      };

  @override
  String toString() {
  
    return "uid: $uid, userName: $userName, email: $email, feadback: $feadback , isSeen: $isSeen";
  }
}
