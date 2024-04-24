import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gem_app2/feature/customer/customer_custom_workout_and_diet/model/coustom_workout_model.dart';
import 'package:gem_app2/firebase/firebase_firestore_service.dart';
import 'package:gem_app2/firebase/tables_name.dart';

part 'workout_requests_state.dart';

class WorkoutRequestsCubit extends Cubit<WorkoutRequestsState> {
  WorkoutRequestsCubit() : super(WorkoutRequestsInitial());

  static WorkoutRequestsCubit get(context) => BlocProvider.of(context);

  Future<void> getWorkoutRequests() async {
    emit(WorkoutRequestsLoading());
    try {
      List<CustomWorkoutModel> customWorkoutModels =
          await FirebaseFireStoreService.getDocsData<CustomWorkoutModel>(
        tableName: TablesName.customWorkouts,
        fromJson: CustomWorkoutModel.fromJson,
      );
      emit(WorkoutRequestsSuccess(customWorkoutModels: customWorkoutModels));
    } catch (e) {
      emit(WorkoutRequestsError(message:e.toString()));
    }
  }
}
