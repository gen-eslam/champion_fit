part of 'nutrition_plan_requests_cubit.dart';

abstract class NutritionPlanRequestsState {}

final class NutritionPlanRequestsInitial extends NutritionPlanRequestsState {}

final class NutritionPlanRequestsLoading extends NutritionPlanRequestsState {}

final class NutritionPlanRequestsSucess extends NutritionPlanRequestsState {
  final List<CustomDietModel?> customDietModel;

  NutritionPlanRequestsSucess({required this.customDietModel});
}

final class NutritionPlanRequestsError extends NutritionPlanRequestsState {
  final String message;

  NutritionPlanRequestsError({required this.message});
}
