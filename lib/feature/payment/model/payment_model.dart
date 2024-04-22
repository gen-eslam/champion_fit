class PaymentModel {
  String? name;
  String? email;
  String? userUid;
  String? docId;

  PaymentModel({this.name, this.email, this.userUid, this.docId});

  PaymentModel.fromJson(Map<String, dynamic> json, [String? id]) {
    name = json['name'];
    email = json['email'];
    userUid = json['userUid'];
    docId = id;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['userUid'] = userUid;
    return data;
  }

  @override
  String toString() {
    return 'PaymentModel{name: $name, email: $email, userUid: $userUid, docId: $docId}';
  }
}
