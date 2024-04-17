class UserModel {
  String? uid, userName, email, imageUrl, role, docId;
  bool? isFemale;
  int? age, height, weight, subscription;
  UserModel({
    this.uid,
    this.userName,
    this.email,
    this.role,
    this.subscription,
    this.isFemale = false,
    this.age,
    this.docId,
    this.height,
    this.weight,
    this.imageUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json, String docId) =>
      UserModel(
        uid: json['uid'],
        userName: json['userName'],
        email: json['email'],
        docId: docId,
        subscription: json['subscription'],
        role: json['role'],
        isFemale: json['isFemale'],
        age: json['age'],
        height: json['height'],
        weight: json['weight'],
        imageUrl: json['imageUrl'],
      );

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'userName': userName,
        'email': email,
        'subscription': subscription,
        'role': role,
        'isFemale': isFemale,
        'age': age,
        'height': height,
        'weight': weight,
        'imageUrl': imageUrl,
      };

  @override
  String toString() {
    // TODO: implement toString
    return "uid: $uid, userName: $userName, email: $email, subscription: $subscription, role: $role, isFemale: $isFemale, age: $age, height: $height, weight: $weight, imageUrl: $imageUrl , docId: $docId";
  }
}
