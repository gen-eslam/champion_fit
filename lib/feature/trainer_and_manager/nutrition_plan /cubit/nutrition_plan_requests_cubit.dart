import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'nutrition_plan_requests_state.dart';

class NutritionPlanRequestsCubit extends Cubit<NutritionPlanRequestsState> {
  NutritionPlanRequestsCubit() : super(NutritionPlanRequestsInitial());
}
