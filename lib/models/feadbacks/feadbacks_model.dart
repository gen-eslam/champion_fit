class FeadbacksModel {
  String uid;
  String userName;
  String? docId;
  String email;
  String? feadback;

  FeadbacksModel({
    required this.uid,
    required this.userName,
    this.docId,
    required this.email,
    required this.feadback,
  });

  factory FeadbacksModel.fromJson(Map<String, dynamic> json, [String? id]) =>
      FeadbacksModel(
        uid: json['uid'],
        userName: json['userName'],
        email: json['email'],
        feadback: json['feadback'],
        docId: id,
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
