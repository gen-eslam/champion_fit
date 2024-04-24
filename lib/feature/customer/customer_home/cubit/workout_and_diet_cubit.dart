import 'package:bloc/bloc.dart';
import 'package:gem_app2/feature/customer/customer_home/model/diet_model.dart';
import 'package:gem_app2/firebase/firebase_firestore_service.dart';
import 'package:gem_app2/firebase/tables_name.dart';

part 'workout_and_diet_state.dart';

class WorkoutAndDiteCubit extends Cubit<WorkoutAndDiteState> {
  WorkoutAndDiteCubit() : super(WorkoutAndDiteInitial());

  void getDietData() async {
    emit(DietDataLoading());
    try {
      List<DietModel> res =
          await FirebaseFireStoreService.getDocsData<DietModel>(
        tableName: TablesName.diets,
        fromJson: DietModel.fromJson,
      );
      emit(DietDataLoaded(dietList: res));
    } catch (e) {
      emit(DietDataError(
        message: e.toString(),
      ));
    }
  }
}
