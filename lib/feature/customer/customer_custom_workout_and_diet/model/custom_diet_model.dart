class CustomDietModel {
  String? uid;
  String? userName;
  String? docId;
  String? email;
  String? dietNote;

  CustomDietModel({
     this.uid,
     this.userName,
    this.docId,
     this.email,
     this.dietNote,
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
