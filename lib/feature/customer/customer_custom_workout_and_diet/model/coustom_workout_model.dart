class CustomWorkoutModel {
  String uid;
  String userName;
  String? docId;
  String email;
  String workoutNote;

  CustomWorkoutModel({
    required this.uid,
    required this.userName,
    this.docId,
    required this.email,
    required this.workoutNote,
  });

  factory CustomWorkoutModel.fromJson(Map<String, dynamic> json,
          [String? id]) =>
      CustomWorkoutModel(
        uid: json['uid'],
        userName: json['userName'],
        email: json['email'],
        workoutNote: json['workoutNote'],
        docId: id,
      );

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'userName': userName,
        'email': email,
        'workoutNote': workoutNote,
      };

  @override
  String toString() {
    return "uid: $uid, userName: $userName, email: $email, workoutNote: $workoutNote ";
  }
}
