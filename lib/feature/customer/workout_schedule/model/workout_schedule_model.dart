import 'package:gem_app2/feature/customer/workout/model/workout_model.dart';

class WorkOutScheduleModel {
  String? uid;
  String? date;
  String? docId;
  WorkoutModel? workoutModel;

  WorkOutScheduleModel({this.uid, this.date, this.workoutModel, this.docId});

  factory WorkOutScheduleModel.fromJson(Map<String, dynamic> json,
      [String? id]) {
    return WorkOutScheduleModel(
      uid: json['uid'],
      docId: id,
      date: json['date'],
      workoutModel: WorkoutModel.fromJson(json['workoutModel']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['date'] = date;
    data['workoutModel'] = workoutModel?.toJson();
    return data;
  }
}
