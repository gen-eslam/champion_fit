import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gem_app2/feature/customer/customer_custom_workout_and_diet/model/custom_diet_model.dart';
import 'package:gem_app2/firebase/firebase_firestore_service.dart';
import 'package:gem_app2/firebase/tables_name.dart';
import 'package:meta/meta.dart';

part 'nutrition_plan_requests_state.dart';

class NutritionPlanRequestsCubit extends Cubit<NutritionPlanRequestsState> {
  NutritionPlanRequestsCubit() : super(NutritionPlanRequestsInitial());

  static NutritionPlanRequestsCubit get(context) => BlocProvider.of(context);

  Future<void> getNutritionRequests() async {
    emit(NutritionPlanRequestsLoading());
    try {
      List<CustomDietModel> customDietModel =
          await FirebaseFireStoreService.getDocsData<CustomDietModel>(
        tableName: TablesName.customDites,
        fromJson: CustomDietModel.fromJson,
      );
      emit(NutritionPlanRequestsSucess(customDietModel: customDietModel));
    } catch (e) {
      emit(NutritionPlanRequestsError(message: e.toString()));
    }
  }
}
