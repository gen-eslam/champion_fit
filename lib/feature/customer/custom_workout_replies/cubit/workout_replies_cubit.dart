import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gem_app2/core/helpers/keys.dart';
import 'package:gem_app2/core/services/cache/cache_service.dart';
import 'package:gem_app2/firebase/firebase_firestore_service.dart';
import 'package:gem_app2/firebase/tables_name.dart';
import 'package:gem_app2/models/coustom_workout_replayes_model.dart';
import 'package:meta/meta.dart';

part 'workout_replies_state.dart';

class WorkoutRepliesCubit extends Cubit<WorkoutRepliesState> {
  WorkoutRepliesCubit() : super(WorkoutRepliesInitial());

  static WorkoutRepliesCubit get(context) => BlocProvider.of(context);


   void getReplies() async {
    emit(WorkoutRepliesGetLoading());
    try {
      List<CustomWorkoutRepliesModel?> feadBacks = await FirebaseFireStoreService
          .getFilteredData<CustomWorkoutRepliesModel>(
        tableName: TablesName.customDitesReplies,
        fromJson: CustomWorkoutRepliesModel.fromJson,
        pram: 'customerUid',
        pramValue: CacheService.getDataString(key: Keys.userId),
      );
      print(feadBacks.length);
      emit(WorkoutRepliesGetSuccess(feadBacks: feadBacks));
    } catch (e) {
      emit(WorkoutRepliesGetError(error: e.toString()));
    }
  }
}
