class CustomWorkoutRepliesModel {
  String? trainerName;
  String? trainerEmail;
  String? customerUid;
  String? trainerUid;
  String? message;
  String? reply;
  String? docId;

  CustomWorkoutRepliesModel({
    this.trainerName,
    this.trainerEmail,
    this.message,
    this.customerUid,
    this.trainerUid,
    this.reply,
    this.docId,
  });

  factory CustomWorkoutRepliesModel.fromJson(Map<String, dynamic> json,
          [String? docId]) =>
      CustomWorkoutRepliesModel(
        trainerName: json['trainerName'],
        trainerEmail: json['trainerEmail'],
        trainerUid: json['trainerUid'],
        message: json['message'],
        customerUid: json['customerUid'],
        reply: json['reply'],
        docId: docId,
      );

  Map<String, dynamic> toJson() => {
        'trainerName': trainerName,
        'trainerEmail': trainerEmail,
        'trainerUid': trainerUid,
        'message': message,
        'customerUid': customerUid,
        'reply': reply,
      };

  @override
  String toString() {
    return "trainerName: $trainerName, trainerEmail: $trainerEmail, message: $message, reply: $reply, customerUid: $customerUid, docId: $docId, trainerUid: $trainerUid";
  }
}
