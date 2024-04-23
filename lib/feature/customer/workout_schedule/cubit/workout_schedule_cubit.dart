import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gem_app2/core/helpers/keys.dart';
import 'package:gem_app2/core/services/cache/cache_service.dart';
import 'package:gem_app2/feature/customer/workout_schedule/model/workout_schedule_model.dart';
import 'package:gem_app2/firebase/firebase_firestore_service.dart';
import 'package:gem_app2/firebase/tables_name.dart';

part 'workout_schedule_state.dart';

class WorkoutScheduleCubit extends Cubit<WorkoutScheduleState> {
  WorkoutScheduleCubit() : super(WorkoutScheduleInitial());

  static WorkoutScheduleCubit get(context) => BlocProvider.of(context);

  void getWorkoutSchedule() async {
    emit(WorkoutScheduleLoading());
    try {
      List<WorkOutScheduleModel?> res =
          await FirebaseFireStoreService.getFilteredData(
        tableName: TablesName.schedule,
        pram: "uid",
        pramValue: CacheService.getDataString(
          key: Keys.userId,
        ),
        fromJson: WorkOutScheduleModel.fromJson,
      );
      emit(WorkoutScheduleSuccess(workOutScheduleModel: res));
    } catch (e) {
      emit(WorkoutScheduleError(error: e.toString()));
    }
  }
}
