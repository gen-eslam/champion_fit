class CustomDietModel {
  String uid;
  String userName;
  String? docId;
  String email;
  String dietNote;

  CustomDietModel({
    required this.uid,
    required this.userName,
    this.docId,
    required this.email,
    required this.dietNote,
  });

  factory CustomDietModel.fromJson(Map<String, dynamic> json, [String? id]) =>
      CustomDietModel(
        uid: json['uid'],
        userName: json['userName'],
        email: json['email'],
        dietNote: json['dietNote'],
        docId: id,
      );

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'userName': userName,
        'email': email,
        'dietNote': dietNote,
      };

  @override
  String toString() {
    return "uid: $uid, userName: $userName, email: $email, dietNote: $dietNote ";
  }
}
